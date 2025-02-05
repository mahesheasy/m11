// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_pickup_summary_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewPickUpSummaryImpl _$$NewPickUpSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$NewPickUpSummaryImpl(
      id: (json['id'] as num).toInt(),
      totalWeight: (json['total_weight'] as num?)?.toDouble() ?? 0.0,
      emptyCanWeight: (json['empty_can_weight'] as num?)?.toDouble() ?? 0.0,
      netWeight: (json['net_weight'] as num?)?.toDouble() ?? 0.0,
      isProcessed: json['isProcessed'] as bool? ?? false,
      isFileCaptured: json['isFileCaptured'] as bool? ?? false,
      canWeightImg: toNull(json['canWeightImg']),
      emptyCanWeightImg: toNull(json['emptyCanWeightImg']),
    );

Map<String, dynamic> _$$NewPickUpSummaryImplToJson(
        _$NewPickUpSummaryImpl instance) =>
    <String, dynamic>{
      'total_weight': instance.totalWeight,
      'empty_can_weight': instance.emptyCanWeight,
      'net_weight': instance.netWeight,
    };
