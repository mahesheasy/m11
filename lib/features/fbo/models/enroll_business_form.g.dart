// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enroll_business_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnrollBusinessFormImpl _$$EnrollBusinessFormImplFromJson(
        Map<String, dynamic> json) =>
    _$EnrollBusinessFormImpl(
      managerName: json['manager_name'] as String?,
      businessName: json['business_name'] as String?,
      address: json['address'] as String?,
      mobileNumber: json['mobile_no'] as String?,
      type: json['supplier_type'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$EnrollBusinessFormImplToJson(
        _$EnrollBusinessFormImpl instance) =>
    <String, dynamic>{
      'manager_name': instance.managerName,
      'business_name': instance.businessName,
      'address': instance.address,
      'mobile_no': instance.mobileNumber,
      'supplier_type': instance.type,
      'city': instance.city,
      'state': instance.state,
    };
