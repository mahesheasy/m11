// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uco_deposit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UCODepositImpl _$$UCODepositImplFromJson(Map<String, dynamic> json) =>
    _$UCODepositImpl(
      date: json['date'] as String,
      fboId: json['fbo_id'] as String?,
      fboName: json['fbo_name'] as String?,
      address: json['address'] as String?,
      collQty: (json['collected_qty_in_kgs'] as num).toDouble(),
      paymentType: json['payment_type'] as String?,
      noOfCans: (json['no_of_cans'] as num).toDouble(),
      weightWithOil: (json['can_weight_with_oil'] as num).toDouble(),
      weightWithoutOil: (json['can_weight_without_oil'] as num).toDouble(),
      totalWeight: (json['total_weight'] as num).toDouble(),
      totalAmt: (json['total_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$UCODepositImplToJson(_$UCODepositImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'fbo_id': instance.fboId,
      'fbo_name': instance.fboName,
      'address': instance.address,
      'collected_qty_in_kgs': instance.collQty,
      'payment_type': instance.paymentType,
      'no_of_cans': instance.noOfCans,
      'can_weight_with_oil': instance.weightWithOil,
      'can_weight_without_oil': instance.weightWithoutOil,
      'total_weight': instance.totalWeight,
      'total_amount': instance.totalAmt,
    };
