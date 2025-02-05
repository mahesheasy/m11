import 'package:injectable/injectable.dart';
import 'package:m11_ind/app/data/app_repo.dart';
import 'package:m11_ind/app/model/otp_inp.dart';
import 'package:m11_ind/core/core.dart';

typedef ResendOTPCubit = NetworkRequestCubit<bool, OTPInput>;
typedef ResendOTPCubitState = NetworkRequestState<bool>;

@lazySingleton
class AppBlocProvider {
  const AppBlocProvider({required this.repo});

  final AppRepo repo;

  static AppBlocProvider get() => $sl.get<AppBlocProvider>();
  
  ResendOTPCubit resendOTPCubit() => ResendOTPCubit(
    onRequest: (params, state) => repo.sendOTP(params!),
  );
}