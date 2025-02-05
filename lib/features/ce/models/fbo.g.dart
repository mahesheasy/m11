// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fbo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FBOImpl _$$FBOImplFromJson(Map<String, dynamic> json) => _$FBOImpl(
      fboName: json['name'] as String,
      supplierName: json['supplier_name'] as String,
      businessName: json['business_name'] as String? ?? '',
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      email: json['email_address'] as String?,
      lastCollectedDate: json['last_collected_date'] as String?,
      primaryAddress: json['primary_address'] as String? ?? '',
      lastBuyWeight: (json['last_weight'] as num?)?.toDouble() ?? 0.0,
      lastBuyPrice: json['last_buy_amount'] as num? ?? 0.0,
      avgPrice: (json['average_price'] as num?)?.toDouble() ?? 0.0,
      avgWeight: (json['average_weight'] as num?)?.toDouble() ?? 0.0,
      pricePerKg: (json['custom_pricekg'] as num).toDouble(),
      noOfCans: (json['no_of_cans'] as num?)?.toDouble(),
      lastBuyDate: json['last_buy_date'] as String?,
      taxId: json['tax_id'] as String?,
      followUpDate: json['follow_up_date'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      pan: json['pan'] as String?,
      route: json['custom_route'] as String?,
      ifsc: json['ifsc_code'] as String?,
      canReqId: json['can_request_id'] as String?,
      active: json['custom_active'] == null
          ? false
          : const BoolenAPIConverter()
              .fromJson((json['custom_active'] as num).toInt()),
      remarks: json['custom_remarks'] as String?,
      scheduledDate: json['scheduled_date'] as String?,
      visitRemarks: json['visit_remarks'] as String?,
      otherRemarks: json['other_visit_remarks'] as String?,
      fssaiNumber: json['fssai_number'] as String?,
      updateFssaiNo: json['custom_fssai_no'] as String?,
      certificateImage: json['custom_fssai_certificate_image'] as String?,
      certificateImageUrl: json['certificateImageUrl'] as String?,
    );

Map<String, dynamic> _$$FBOImplToJson(_$FBOImpl instance) => <String, dynamic>{
      'name': instance.fboName,
      'supplier_name': instance.supplierName,
      'business_name': instance.businessName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'email_address': instance.email,
      'last_collected_date': instance.lastCollectedDate,
      'primary_address': instance.primaryAddress,
      'last_weight': instance.lastBuyWeight,
      'last_buy_amount': instance.lastBuyPrice,
      'average_price': instance.avgPrice,
      'average_weight': instance.avgWeight,
      'no_of_cans': instance.noOfCans,
      'last_buy_date': instance.lastBuyDate,
      'tax_id': instance.taxId,
      'follow_up_date': instance.followUpDate,
      'mobile_number': instance.mobileNumber,
      'pan': instance.pan,
      'custom_route': instance.route,
      'ifsc_code': instance.ifsc,
      'can_request_id': instance.canReqId,
      'custom_remarks': instance.remarks,
      'scheduled_date': instance.scheduledDate,
      'visit_remarks': instance.visitRemarks,
      'other_visit_remarks': instance.otherRemarks,
      'fssai_number': instance.fssaiNumber,
      'custom_fssai_no': instance.updateFssaiNo,
      'custom_fssai_certificate_image': instance.certificateImage,
      'certificateImageUrl': instance.certificateImageUrl,
    };
