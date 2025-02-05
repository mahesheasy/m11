import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/deo/data/deo_repo.dart';
import 'package:m11_ind/features/deo/model/app_rej_input.dart';
import 'package:m11_ind/features/deo/model/deo_montly_report.dart';
import 'package:m11_ind/features/deo/model/gate_entry_form.dart';
import 'package:m11_ind/features/deo/model/gate_exit_form.dart';
import 'package:m11_ind/features/deo/model/gate_exit.dart';
import 'package:m11_ind/features/deo/model/geo_loc_update.dart';
import 'package:m11_ind/features/deo/model/uco_deposit.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';

@LazySingleton(as: DEORepo)
class DeoRepoImpl extends BaseApiRepository implements DEORepo {
  const DeoRepoImpl(super.client);

  @override
  AsyncValueOf<List<String>> ceUsers() async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,
        reqParams: {
          'doctype': Doctype.user,
          'filters': [['user_list', '=', 'CEO']],
        },
        parser: (json) {
          final data = json['message'] as List<dynamic>;
          final names = data.map((e) => e['name'].toString()).toList();
          return names;
        },
      );
      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<String>> bdeUsers() async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,
        reqParams: {
          'doctype': Doctype.user,
          'filters': [['user_list', '=', 'BDE']],
        },
        parser: (json) {
          final data = json['message'] as List<dynamic>;
          final names = data.map((e) => e['name'].toString()).toList();
          return names;
        },
      );
      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<String>> vehicleDrivers() async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,
        reqParams: {
          'doctype': Doctype.user,
          'filters': [['user_list', '!=', 'FBO']],
        },
        parser: (json) {
          final data = json['message'] as List<dynamic>;
          final names = data.map((e) => e['name'].toString()).toList();
          return names;
        },
      );
      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<String>> getvehicleNums() async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,
        reqParams: {
          'doctype': Doctype.vehicleMaster,
          'fields': ['vehicle_no'],
          // 'filters': [['vehicle_no', '!=', 'null']],
        },
        parser: (json) {
          final data = json['message'] as List<dynamic>;
          final names = data.map((e) => e['vehicle_no'].toString()).toList();
          return names;
        },
      );
      final response = await get(config);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<List<GateExit>> gateExitList(int start) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getList,
        reqParams: {
          'doctype': Doctype.vehicleTracking,
          'limit': 20,
          'limit_start': start,
          'order_by': 'name DESC',
          'fields': ['*'],
        },
        parser: (json) {
          final data = json['message'] as List<dynamic>;
          return data.map((e) => GateExit.fromJson(e)).toList();
        },
      );
      final response = await get(config);
      $logger.info('GateExit$response');
      return response.process((r) => right(r.data!));
    });
  }
  @override
  AsyncValueOf<bool> assignBDE(Pair<String, String> inp) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.assignBDE, 
        parser: (json) => json,
        body: jsonEncode({'fbo_id': inp.first, 'bde_id': inp.second})
      );
      final response = await post(config);
      return response.process((r) => right(true));
    });
  }
  
  @override
  AsyncValueOf<bool> assignCE(Pair<String, String> inp) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.assignCE, 
        parser: (json) => json,
        body: jsonEncode({'fbo_id': inp.first, 'ce_id': inp.second})
      );
      final response = await post(config);
      return response.process((r) => right(true));
    });
  }


  @override
  AsyncValueOf<String> createGateExit(GateExitForm form) async {
    final odoMeterFileBytes = form.odoMeter?.readAsBytesSync();
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.createVehicleTracking,
        body: jsonEncode({
          'collection_executive': form.ceName,
          'vehicle': form.vehicleNumber,
          'vehicle_out_reading': form.startKmReading,
          if (odoMeterFileBytes.isNotNull) ...{
            'vehicle_out_reading_photo': base64Encode(odoMeterFileBytes!),
          },
        }),
        parser: (json) => json['message'],
      );
      final response = await post(config);
      return response.process((r) => right(r.data));
    });
  }

  @override
  AsyncValueOf<List<FBO>> assignCEList(DateTime dateTime, int start, int end) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.assignCEList,
        reqParams: {
          'req_date': DFU.ddMMyyyy(dateTime),
          'usr': user().email,
          'start_row' : start,
          'end_row' : end,
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
  AsyncValueOf<List<FBO>> fboCanRequests(DateTime dateTime, int start, int end) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.fboCanRequests,
        reqParams: {
          'date': DFU.ddMMyyyy(dateTime),
          'usr': user().email,
          'start_row' : start,
          'end_row' : end,
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
  AsyncValueOf<List<DEOMonthlyReport>> fetchMonthlyReport() async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.monthlyReport,
        reqParams: {'usr' : user().email},
        parser: (json) {
          final d = json['message']['data'] as List<dynamic>;
          return d.map((e) => DEOMonthlyReport.fromJson(e)).toList(growable: false);
        },
      );
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<FBODetails> getFBODetails(String fboId) async {
    final requestConfig = RequestConfig(
      url: Urls.fbos,
      reqParams: {'name' : fboId, 'usr': user().email},
      parser: (json) {
        final d = json['message']['data'] as List<dynamic>;
        return FBODetails.fromJson(d.firstOrNull);
      },
    );
    final response = await get(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<bool> approveCanRequest(ApproveCanRequest inp) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.canAppReject,
        parser: (json) => json,
        body: jsonEncode(inp.toJson()..putIfAbsent('approved_deo', () => user().email)),
      );

      final response = await post(requestConfig);
      return response.process((r) => right(true));
    });
  }

  @override
  AsyncValueOf<bool> rejectCanRequest(RejectCanReqInput inp) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.canAppReject,
        parser: (json) => json,
        body: jsonEncode(inp.toJson()),
      );
      final response = await post(requestConfig);
      return response.process((r) => right(true));
    });
  }

  @override
  AsyncValueOf<List<UCODeposit>> ucoDepositSummary(String user) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.ceSummaryReport,
        parser: (json) {
          final d = json['message']['data'] as List<dynamic>;
          return d.map((e) => UCODeposit.fromJson(e)).toList();
        },
        reqParams: {'usr' : user}
      );
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }
  
  @override
  AsyncValueOf<bool> updateVehicleTracking(GateEntryForm form) async {
    return await executeSafely(() async {
      final vehicleInFileBytes = form.odoMeter?.readAsBytesSync();
      final requestConfig = RequestConfig(
        url: Urls.updateVehicleTracking,
        body: jsonEncode({
          'vehicle_track_id': form.vehicleTrackId,
          'vehicle_in_reading': form.vehicleInReading,
          'actual_kms': form.actualKms?.toInt(),
          if(vehicleInFileBytes.isNotNull) ...{
            'vehicle_in_reading_photo': base64Encode(vehicleInFileBytes!),
          },
        }),
        parser: (json) => json,
      );
      final response = await post(requestConfig);
      return response.process((r) => right(true));
    });
  }
  
  @override
  AsyncValueOf<bool> ucoSubmission(String usrId) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.ucoDeposit,
        parser: (json) => json,
        body: jsonEncode({'ce_id': usrId}),
      );
      final response = await post(requestConfig);
      return response.process((r) => right(true));
    });
  }

  @override
  AsyncValueOf<None> updateGEOLocation(GeoLocUpdate inp) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: '${Urls.supplier}/${inp.name}', 
        parser: (p0) => p0,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode(GeoLocUpdate.toJson(inp)),
      );
      $logger.devLog(config);
      await put(config);
      return right(const None());
    });
  }
}
