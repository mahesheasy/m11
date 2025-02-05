import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/fbo/data/fbo_repo.dart';
import 'package:m11_ind/features/fbo/models/enroll_business_form.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';
import 'package:m11_ind/features/fbo/models/request_extra_cans.dart';

@LazySingleton(as: FBORepo)
class FBORepoImpl extends BaseApiRepository implements FBORepo {
  const FBORepoImpl(super.client);

  @override
  AsyncValueOf<Pair<String, bool>> getStatus() async {
    return await executeSafely(() async {      
      final config = RequestConfig(
        url: Urls.fboStatus,
        reqParams: {'email_id': user().email},
        parser: (json) {
          final msmessageObj = json['message'] as Map<String, dynamic>;
          return msmessageObj['data'] as List<dynamic>;
        },
      );
      final response = await get(config);
      return response.process((r) {
        if (r.data!.isEmpty) return right(const Pair('', false));
        final json = r.data!.first;
        final id = json['fbo_id'] as String;
        final isActive = json['active_status'] == 'true';
        return right(Pair(id, isActive));
      });
    });
  }

  @override
  AsyncValueOf<bool> enrollBusiness(EnrollBusinessForm form) async {
    return await executeSafely(() async {
      final r1 = {
        'fbo_name' : user().name,
        'email_id': user().email,
        'remarks' : 'New Visit',
      };
      final config = RequestConfig(
        url: Urls.enrollbusiness,
        parser: (p0) => p0,
        body: jsonEncode({...form.toJson(), ...r1}),
      );
      final res = await post(config);
      return res.process((r) => right(true));
    });
  }

  @override
  AsyncValueOf<FBODetails> getFBODetails(String fboId) async {
    return await executeSafely(() async {
      final requestConfig = RequestConfig(
        url: Urls.fbos,
        parser: (json) {
          final d = json['message']['data'] as List<dynamic>;
          $logger.devLog(d);

          return FBODetails.fromJson(d.firstOrNull);
        },
        reqParams: {'name': fboId, 'usr': user().email},
      );
      final response = await get(requestConfig);
      return response.process((r) => right(r.data!));
    });
  }

  @override
  AsyncValueOf<bool> requestCans(RequestExtraCans request) async {
    final config = RequestConfig(
      url: Urls.canRequest,
      parser: (p0) => p0,
      body: jsonEncode(request.toJson()),
    );
    final res = await post(config);
    return res.process((r) => right(true));
  }

  @override
  AsyncValueOf<bool> requestFBO(RequestExtraCans request) async {
    final config = RequestConfig(
      url: Urls.requestUCO,
      parser: (p0) => p0,
      body: jsonEncode(request.toJson()),
    );
    final res = await post(config);
    return res.process((r) => right(true));
  }
}
