// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'can_request_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CanRequestSummaryImpl _$$CanRequestSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$CanRequestSummaryImpl(
      name: json['fbo_name'] as String,
      noOfCans: (json['no_of_cans_approved'] as num?)?.toInt() ?? 0,
      lastPurchaseDate: json['last_purchase_date'] as String?,
      lastPurchaseRate: (json['last_purchase_rate'] as num?)?.toDouble() ?? 0.0,
      lastPurchaseWeight:
          (json['last_purchase_weight'] as num?)?.toDouble() ?? 0.0,
      cansIssuedDate: json['date_of_cans_issued'] as String?,
    );

Map<String, dynamic> _$$CanRequestSummaryImplToJson(
        _$CanRequestSummaryImpl instance) =>
    <String, dynamic>{
      'fbo_name': instance.name,
      'no_of_cans_approved': instance.noOfCans,
      'last_purchase_date': instance.lastPurchaseDate,
      'last_purchase_rate': instance.lastPurchaseRate,
      'last_purchase_weight': instance.lastPurchaseWeight,
      'date_of_cans_issued': instance.cansIssuedDate,
    };
