
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_details.freezed.dart';
part 'bank_details.g.dart';

@freezed
class BankDetails with _$BankDetails {
  factory BankDetails({
    @JsonKey(name: 'payment_type') String? paymentType,
    @JsonKey(name: 'bank_name') String? bankName,
    @JsonKey(name: 'account_number') String? accountNumber,
    @JsonKey(name: 'ifsc_code') String? ifscCode,
    @JsonKey(name: 'reenter_account_number') String? reenterAccNumber,
    @JsonKey(name: 'benificiary_name') String? beneficiaryName,
    @JsonKey(name: 'upi_id') String? upiId,
  }) = _BankDetails;

  factory BankDetails.fromJson(Map<String, dynamic> json) => _$BankDetailsFromJson(json);
}