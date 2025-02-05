// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'can_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CanRequestImpl _$$CanRequestImplFromJson(Map<String, dynamic> json) =>
    _$CanRequestImpl(
      fbo: json['fbo_name'] as String,
      reqDate: json['req_date'] as String,
      requestedCans: (json['no_of_cans'] as num).toInt(),
      approvedcans: (json['issued_noof_cans_by_de'] as num?)?.toInt() ?? 0,
      approvedBy: json['approved_deo'] as String?,
      rejectedBy: json['rejected_deo'] as String?,
      deliveryDate: json['deo_delivery_date'] as String?,
      approve:
          const BoolenAPIConverter().fromJson((json['approve'] as num).toInt()),
      reject:
          const BoolenAPIConverter().fromJson((json['reject'] as num).toInt()),
    );

Map<String, dynamic> _$$CanRequestImplToJson(_$CanRequestImpl instance) =>
    <String, dynamic>{
      'fbo_name': instance.fbo,
      'req_date': instance.reqDate,
      'no_of_cans': instance.requestedCans,
      'issued_noof_cans_by_de': instance.approvedcans,
      'approved_deo': instance.approvedBy,
      'rejected_deo': instance.rejectedBy,
      'deo_delivery_date': instance.deliveryDate,
      'approve': const BoolenAPIConverter().toJson(instance.approve),
      'reject': const BoolenAPIConverter().toJson(instance.reject),
    };
