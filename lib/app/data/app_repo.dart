import 'package:m11_ind/app/model/otp_inp.dart';
import 'package:m11_ind/core/core.dart';

abstract interface class AppRepo {
  AsyncValueOf<bool> sendOTP(OTPInput inp);
}