import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/features/bde/model/enroll_fbo.dart';
import 'package:m11_ind/features/ce/models/can_request.dart';
import 'package:m11_ind/features/ce/models/can_request_summary.dart';
import 'package:m11_ind/features/ce/models/depo_master.dart';
import 'package:m11_ind/features/ce/models/deposit_summary.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/models/fbo_list_inp.dart';
import 'package:m11_ind/features/ce/models/fbo_summary.dart';
import 'package:m11_ind/features/ce/models/pick_up_summary.dart';
import 'package:m11_ind/features/ce/models/pr_details.dart';
import 'package:m11_ind/features/ce/models/request_mode.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/data/ce_repo.dart';
import 'package:m11_ind/features/ce/models/collection_report.dart';

@LazySingleton(as: CERepo)
class CERepoImpl extends BaseApiRepository
    with FileUtilsMixin
    implements CERepo {
  const CERepoImpl(super.client);

  @override
  AsyncValueOf<List<FBO>> fetchPickUpList(
      DateTime dateTime, String mode, String? query) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.pickUpList,
        reqParams: {
          'req_date': DFU.ddMMyyyy(dateTime),
          'usr_id': user().email,
          'status': mode,
          if (query.containsValidValue) 'query': query,
        },
        parser: (json) {
          final d = json['message']['data'] as List<dynamic>;

          return d.map((e) => FBO.fromJson(e)).toList(growable: false);
        },
      );
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<FBO>> fetchMissedCollections(DateTime dateTime) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.missedcollections,
        reqParams: {
          'user_id': user().email,
          'req_date': DFU.ddMMyyyy(dateTime),
        },
        parser: (json) {
          final d = json['message']['data'] as List<dynamic>;

          return d.map((e) => FBO.fromJson(e)).toList(growable: false);
        },
      );
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<FBO>> fetchCanRequests(DateTime dateTime) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.canRequests,
        reqParams: {
          'usr_id': user().email,
          'req_date': DFU.ddMMyyyy(dateTime),
        },
        parser: (json) {
          final d = json['message']['data'] as List<dynamic>;

          return d.map((e) => FBO.fromJson(e)).toList(growable: false);
        },
      );
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<CollectionReport>> fetchCollectionReport(
      DateTime dateTime) async {
    return await executeSafely(() async {
      final config = RequestConfig(
          url: Urls.collectionReport,
          parser: (json) {
            final d = json['message']['data'] as List<dynamic>;
            return d.map((e) => CollectionReport.fromJson(e)).toList();
          },
          reqParams: {
            'usr': user().email!,
            'req_date': DFU.ddMMyyyy(dateTime),
          });
          $logger.devLog(config);
      final res = await get(config);
      return res.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<RequestMode>> fetchCount(DateTime? dateTime) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.fboCounts,
        reqParams: {
          'usr': user().email!,
          if (dateTime.isNotNull) 'req_date': DFU.ddMMyyyy(dateTime!),
        },
        parser: (json) {
          final d = json['message']['data'] as List<dynamic>;
          return d.map((e) => RequestMode.fromJson(e)).first;
        },
      );
      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<FBO>> fetchFBOs(FBOListInp inp) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.taggedfbos,
        reqParams: {
          ...FBOListInp.toJson(inp),
          'usr_id': user().email,
        },
        parser: (json) {
          final d = json['message']['data'] as List<dynamic>;

          return d.map((e) => FBO.fromJson(e)).toList(growable: false);
        },
      );$logger.devLog(requestConfig);
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<File> downloadUCOReport(List<CollectionReport> ucoData) async {
    try {
      final dataRows = <List<dynamic>>[];
      for (int i = 0; i < ucoData.length; i++) {
        dataRows.insert(i, [ucoData[i].supplierName, ucoData[i].ucoWeight]);
      }
      final pdfReport =
          await _generatePDF(CollectionReport.headerCols, dataRows);
      return right(pdfReport!);
    } on Exception catch (e, st) {
      $logger.error('[CEO RepoImpl]', e, st);
      return e.toString().asFailure();
    }
  }

  Future<File?> _generatePDF(
      List<String> headers, List<dynamic> dataRows) async {
    final pdf = pw.Document()
      ..addPage(
        pw.MultiPage(
          build: (context) => [
            pw.TableHelper.fromTextArray(
              context: context,
              headers: headers,
              cellAlignment: pw.Alignment.center,
              headerStyle:
                  pw.TextStyle(color: PdfColor.fromInt(AppColors.white.value)),
              headerDecoration: pw.BoxDecoration(
                  color: PdfColor.fromInt(AppColors.green.value)),
              data: [...dataRows.map((e) => e)],
            ),
          ],
        ),
      );
    final bytes = await pdf.save();
    return await saveFile('UCO_Collection.pdf', base64Encode(bytes));
  }

  @override
  AsyncValueOf<FBODetails> getFBODetails(String fboId) async {
    final requestConfig = RequestConfig(
      url: Urls.fbos,
      reqParams: {
        'usr': user().email,
        'name': fboId,
      },
      parser: (json) {
        final d = json['message']['data'] as List<dynamic>;
        $logger.devLog(d);
        return FBODetails.fromJson(d.firstOrNull);
      },
    );
    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
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
          reqParams: {'fbo_name': fboId});
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<bool> remindFBO(String fboId) async {
    return right(true);
  }

  @override
  AsyncValueOf<DepoMaster> fetchDepoMaster() async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
          url: Urls.depoDetails,
          parser: (json) {
            final message = json['message'] as Map<String, dynamic>;
            final d = message['data'] as List<dynamic>;
            return DepoMaster.fromJson(d.firstOrNull);
          },
          reqParams: {'usr': user().email});

      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<DepositSummary> fetchDepositSummary() async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
          url: Urls.depositSummary,
          parser: (json) {
            final message = json['message'] as Map<String, dynamic>;
            final d = message['data'] as List<dynamic>;
            return DepositSummary.fromJson(d.firstOrNull);
          },
          reqParams: {
            'usr': user().email,
            'req_date': DFU.ddMMyyyy(DFU.now())
          });

      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<CanRequest> canRequestDetails(String requestId) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: '${Urls.canReqDetails}/$requestId',
        parser: (json) {
          final d = json['data'];
          return CanRequest.fromJson(d);
        },
      );

      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<CanRequestSummary> canRequestSummary(String fboName) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
          url: Urls.canReqSummary,
          parser: (json) {
            final message = json['message'] as Map<String, dynamic>;
            final d = message['data'] as List<dynamic>;
            return CanRequestSummary.fromJson(d.firstOrNull);
          },
          reqParams: {'fbo_name': fboName});

      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<PRDetails> createNewPickUp(NewPickUpSummary pickUp) async {
    return await executeSafely(() async {
      final fbo = pickUp.fbo;
      final oilCollection = pickUp.forms
          .map((e) => {
                'can_weight_with_oil': e.totalWeight,
                'can_weight_without_oil': e.emptyCanWeight,
                'net_weight': e.netWeight,
                'weighted_can_photo': e.canWeightImg.isNull
                    ? null
                    : base64Encode(e.canWeightImg!.readAsBytesSync()),
              })
          .toList();

      final requestMap = {
        if (fbo.isNotNull) 'fbo_id': fbo?.name,
        'price': pickUp.fbo?.pricekg,
        'ce': user().email,
        'payment_type': pickUp.paymentType,
        if (pickUp.upiId.isNotNull) 'upi_id': pickUp.upiId,
        'collection_date': DFU.ddMMyyyy(DateTime.now()),
        'no_of_cans': pickUp.forms.length,
        'total_amt': pickUp.totalAmount,
        if (fbo != null && fbo.isRegistered) ...{
          'net_amt': pickUp.netAmount,
        } else ...{
          'net_amt': pickUp.totalAmount,
        },
        'collected_qty_in_kgs': pickUp.netWeight,
        'total_weight': pickUp.totalWeight,
        'oil_collection': oilCollection,
      };
      final config = RequestConfig(
        url: Urls.newPickupSummary,
        parser: (p0) {
          final json = p0['message']['pr_details'];
          return PRDetails.fromJson(json);
        },
        body: jsonEncode(requestMap),
      );
      $logger.devLog(config);

      final response = await post(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<bool> updateCanIssue(String id, int cans) async {
    return await executeSafely(() async {
      final config = RequestConfig(
          url: Urls.canIssue,
          parser: (p0) => p0,
          body: jsonEncode({
            'can_request_id': id,
            'issue_date': DFU.ddMMyyyy(DateTime.now()),
            'no_of_cans': cans,
            'issued_by_ce': user().email,
          }));
      final response = await post(config);
      return response.process((r) => right(true));
    });
  }

  @override
  AsyncValueOf<bool> updateVisitRemarks(String fboId, String remarks,
      String? otherRemarks, String? scheduleDate) async {
    return await executeSafely(() async {
      final config = RequestConfig(
          url: Urls.newPickupSummary,
          parser: (p0) => p0,
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode({
            'ce_id': user().email,
            'fbo_id': fboId,
            'visit_date': DFU.ddMMyyyy(DFU.now()),
            'visit_remarks': remarks,
            'other_visit_remarks': remarks,
            'scheduled_date': scheduleDate,
          }));
      final response = await post(config);
      return response.process((r) => right(true));
    });
  }

  @override
  AsyncValueOf<Uint8List> downloadGRNFile(String url) async {
    return await executeSafely(() async => await downloadFile(url));
  }

  @override
  AsyncValueOf<String> updateFssai(EnrollFBO form) async {
    return await executeSafely(() async {
      final config = RequestConfig(
          url: Urls.updateFssai,
          parser: (p0) {
            return p0['message']['message'] as String;
          },
          headers: {HttpHeaders.contentTypeHeader: 'application/json'},
          body: jsonEncode({
            'supplier_name': form.id,
            'fssai_certificate_image': form.certificateImage,
            'custom_fssai_no': form.fssaiNumber,
          }));
      $logger.devLog('config"$config');
      final response = await post(config);
      return response.process((r) => right(r.data!));
    });
  }
}

Future<String> compressAndEncodeImage(File imageFile) async {
  final compressedFile = await FlutterImageCompress.compressWithFile(
    imageFile.absolute.path,
    quality: 50,
  );

  return base64Encode(compressedFile!);
}
