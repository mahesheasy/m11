import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/app/data/app_repo.dart';
import 'package:m11_ind/app/model/otp_inp.dart';
import 'package:m11_ind/core/core.dart';

@LazySingleton(as: AppRepo)
class AppRepoImpl extends BaseApiRepository implements AppRepo {
  const AppRepoImpl(super.client);

  @override
  AsyncValueOf<bool> sendOTP(OTPInput inp) async {
    return await executeSafely(() async {
      final config = RequestConfig(
        url: Urls.sendOTP,
        parser: (_) => true,
        reqParams: {
          'otp_code': inp.otp,
          'phone_number': inp.number,
          'otp_type': inp.type.code,
        }
      );
      $logger.devLog(config);
      final response = await post(config);
      return response.process((r) => right(true));
    });
  }
}