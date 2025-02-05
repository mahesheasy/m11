import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/auth/model/logged_in_user.dart';
import 'package:m11_ind/features/bde/model/current_uco_price.dart';
import 'package:m11_ind/features/bde/model/route_master.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/models/fbo_list_inp.dart';
import 'package:m11_ind/features/ce/models/fbo_summary.dart';
import 'package:m11_ind/features/ce/models/request_mode.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:m11_ind/features/bde/data/bde_repo.dart';
import 'package:m11_ind/features/bde/model/enroll_fbo.dart';
import 'package:m11_ind/features/bde/model/enrollment_report.dart';

@LazySingleton(as: BDERepo)
class BDERepoImpl extends BaseApiRepository
    with FileUtilsMixin
    implements BDERepo {
  const BDERepoImpl(super.client);

  @override
  AsyncValueOf<CurrentUCOPrice> getUCOPrice() async {
    return await executeSafely(() async {
      final request = RequestConfig(
        url: Urls.ucoPrice,
        parser: (json) => CurrentUCOPrice.fromJson(json['message']['data']),
      );

      final response = await get(request);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<int> getTaskPercent() async {
    return right(16);
  }

  @override
  AsyncValueOf<bool> enrollFBO(EnrollFBO fbo) async {
    return await executeSafely(() async {
      
      var requestBody = fbo.toJson();
      if (fbo.isEnrolling.isTrue) {
        final bankDetails = fbo.bankDetails?.toJson();
        requestBody
          ..remove('bank_details')
          ..putIfAbsent('bank_details', () => [bankDetails]);
      } else {
        requestBody.remove('bank_details');
      }
       if (fbo.fssaiNumber != null && fbo.fssaiNumber!.isNotEmpty) {
      requestBody.putIfAbsent('fssai_no', () => fbo.fssaiNumber);
    } else {
      throw Exception('FSSAI Number is required for enrollment');
    }
      requestBody.putIfAbsent('assigned_bde', () => user().email);
      final config = RequestConfig(
        url: Urls.enrollFBO,
        parser: (p0) => p0,
        body: jsonEncode(requestBody),
      );
      $logger.devLog('enroll fbo $config');
      
      final res = await post(config);
      return res.process((r) => right(true));
    });
  }

  @override
  AsyncValueOf<List<EnrollmentReport>> getEmrollmentReport() async {
    return await executeSafely(() async {
      final request = RequestConfig(
        url: Urls.enrollmentReport,
        reqParams: {'usr': user().email},
        parser: (json) {
          final d = json['message']['data'] as List<dynamic>;

          return d
              .map((e) => EnrollmentReport.fromJson(e))
              .toList(growable: false);
        },
      );

      final response = await get(request);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<File> downloadEnrollmentReport(List<EnrollmentReport> data) async {
    return await executeSafely(() async {
      final dataRows = <List<dynamic>>[];
      for (int i = 0; i < data.length; i++) {
        dataRows.insert(i, [data[i].fboname, data[i].ucorate]);
      }
      final pdfReport = await _generatePDF(EnrollmentReport.headerCols, dataRows);
      if (pdfReport.isNull) {}
      return right(pdfReport!);
    });
  }

  Future<File?> _generatePDF(
    List<String> headers,
    List<dynamic> dataRows,
  ) async {
    final pdf = pw.Document()
      ..addPage(
        pw.MultiPage(
          build: (context) => [
            pw.TableHelper.fromTextArray(
              context: context,
              headers: headers.isEmpty ? null : headers,
              cellAlignment: pw.Alignment.center,
              headerStyle:
                  pw.TextStyle(color: PdfColor.fromInt(AppColors.white.value)),
              headerDecoration: headers.isEmpty ? null : pw.BoxDecoration(
                  color: PdfColor.fromInt(AppColors.green.value)),
              data: [...dataRows.map((e) => e)],
            ),
          ],
        ),
      );
    final bytes = await pdf.save();
    return await saveFile('Enrollment_Report.pdf', base64Encode(bytes));
  }

  @override
  AsyncValueOf<List<FBO>> fetchRoutesList(String route, String? query, int start, int end) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.routes,
        parser: (json) {
          final d = json['message']['data'] as List<dynamic>;
          return d.map((e) => FBO.fromJson(e)).toList(growable: false);
        },
        reqParams: {
          'usr': user().email,
          'startrow': start,
          'endrow': end,
          'route' : route,
          if(query.containsValidValue) 'query' : query,
        },
      );
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
      },
    );
  }

  @override
  AsyncValueOf<List<FBO>> fetchFBOs(FBOListInp inp, int start, int end) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.fbos,
        parser: (json) {
          final d = json['message']['data'] as List<dynamic>;

          return d.map((e) => FBO.fromJson(e)).toList(growable: false);
        },
        reqParams: {
          'usr': user().email,
          'startrow': start,
          if(inp.query.containsValidValue) 'query': inp.query,
          if(inp.status != 'None') 'status' : inp.status,
          'endrow': end,
        },
      );
      $logger.devLog(requestConfig);
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
      },
    );
  }

  @override
  AsyncValueOf<List<RequestMode>> fetchFBOCounts() async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.fboCounts,
        parser: (json) {
          final d = json['message']['data'] as List<dynamic>;
          return d.map((e) => RequestMode.fromJson(e)).first;
        },
        reqParams: {'usr': user().email},
      );
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
      },
    );
  }

  @override
  AsyncValueOf<FBOSummary> fetchFBOSummary(String fboId) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.fboSummary,
        parser: (json) {
          final message = json['message'] as Map<String, dynamic>;
          final d = message['data'] as List<dynamic>;
          return FBOSummary.fromJson(d.firstOrNull).copyWith(fboId);
        },
        reqParams: {'fbo_name': fboId},
      );
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
      },
    );
  }

  @override
  AsyncValueOf<FBODetails> getFBODetails(String fboId) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.fbos,
        parser: (json) {
          final d = json['message']['data'] as List<dynamic>;

          return FBODetails.fromJson(d.firstOrNull);
        },
        reqParams: {'name': fboId, 'usr': user().email},
      );
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
      },
    );
  }
  
  @override
  AsyncValueOf<List<FBODetails>> fetchFollowUPs(
      DateTime dateTime, 
      int start, 
      int end,
    ) async {
      return executeSafely(() async {
        final requestConfig = RequestConfig(
          url: Urls.followUps,
          reqParams: {
            'startrow': start, 
            'endrow': end,
            'req_date' : DFU.ddMMyyyy(dateTime),
            'usr' : user().email,
          },
          parser: (json) {
            final d = json['message']['data'] as List<dynamic>;
            return d.map((e) => FBODetails.fromJson(e)).toList(growable: false);
          },
        );
        final response = await get(requestConfig);
        return response.process((r) => right(r.data!));
      });
  }
  
  @override
  AsyncValueOf<File> downloadSummary(FBOSummary summary) async {
    return await executeSafely(() async {
      final dataRows = <List<dynamic>>[
        ['Last Number of Cans Deposited', summary.noOfCansSubmitted],
        ['Last Purchase Date', summary.lastPurchaseDate.valueOrNil],
        ['Last Purchase Rate', summary.lastPurchaseRate],
        ['Last Purchase Weight', summary.lastPurcahseWeight],
        ['Date of Cans Issued', summary.cansIssuedDate.valueOrNil],
      ];
      final pdfReport = await _generatePDF([], dataRows);
      if (pdfReport.isNull) {}
      return right(pdfReport!);
    });
  }

  @override
  AsyncValueOf<List<RouteMaster>> fetchRouteMaster(String? query) async {
    return await executeSafely(() async {
      final filters = [
        if(user().depoName != null)['depot_name', '=', user().depoName],
        if(user().isCollExecutive)['collection_executive', '=', user().email],
      ];
      final config = RequestConfig(
        url: Urls.routeMaster, 
        parser: (json) {
          final d = json['data'] as List<dynamic>;
          return d.map((e) => RouteMaster.fromJson(e)).toList();
        },
        reqParams: {
          'fields': ['*'],
          if(filters.isNotEmpty)...{
            'filters': filters,
          }
        }
      );
      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }
}
