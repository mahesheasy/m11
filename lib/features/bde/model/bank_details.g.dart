// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankDetailsImpl _$$BankDetailsImplFromJson(Map<String, dynamic> json) =>
    _$BankDetailsImpl(
      paymentType: json['payment_type'] as String?,
      bankName: json['bank_name'] as String?,
      accountNumber: json['account_number'] as String?,
      ifscCode: json['ifsc_code'] as String?,
      reenterAccNumber: json['reenter_account_number'] as String?,
      beneficiaryName: json['benificiary_name'] as String?,
      upiId: json['upi_id'] as String?,
    );

Map<String, dynamic> _$$BankDetailsImplToJson(_$BankDetailsImpl instance) =>
    <String, dynamic>{
      'payment_type': instance.paymentType,
      'bank_name': instance.bankName,
      'account_number': instance.accountNumber,
      'ifsc_code': instance.ifscCode,
      'reenter_account_number': instance.reenterAccNumber,
      'benificiary_name': instance.beneficiaryName,
      'upi_id': instance.upiId,
    };
