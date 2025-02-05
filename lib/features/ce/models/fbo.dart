import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m11_ind/core/core.dart';

part 'fbo.freezed.dart';
part 'fbo.g.dart';

@freezed
class FBO with _$FBO {
  factory FBO({
    @JsonKey(name: 'name') required String fboName,
    @JsonKey(name: 'supplier_name') required String supplierName,
    @JsonKey(name: 'business_name', defaultValue: '') required String businessName,
    String? latitude,
    String? longitude,
    @JsonKey(name: 'email_address') String? email,
    @JsonKey(name: 'last_collected_date') String? lastCollectedDate,
    @JsonKey(name: 'primary_address', defaultValue: '') required String primaryAddress,
    @JsonKey(name: 'last_weight', defaultValue: 0.0) required double lastBuyWeight,
    @JsonKey(name: 'last_buy_amount', defaultValue: 0.0) required num lastBuyPrice,
    @JsonKey(name: 'average_price', defaultValue: 0.0) required double avgPrice,
    @JsonKey(name: 'average_weight', defaultValue: 0.0) required double avgWeight,
    @JsonKey(name: 'custom_pricekg', includeToJson: false) required double pricePerKg,
    @JsonKey(name: 'no_of_cans') double? noOfCans,
    @JsonKey(name: 'last_buy_date') String? lastBuyDate,
    @JsonKey(name: 'tax_id') String? taxId,
    @JsonKey(name: 'follow_up_date') String? followUpDate,
    @JsonKey(name: 'mobile_number') String? mobileNumber,
    @JsonKey(name: 'pan') String? pan,
    @JsonKey(name: 'custom_route') String? route,
    @JsonKey(name: 'ifsc_code') String? ifsc,
    @JsonKey(name: 'can_request_id') String? canReqId,
    @BoolenAPIConverter() @JsonKey(name: 'custom_active',defaultValue: false, includeToJson: false) required bool active,
    @JsonKey(name: 'custom_remarks') String? remarks,
    @JsonKey(name: 'scheduled_date') String? scheduledDate,
    @JsonKey(name: 'visit_remarks') String? visitRemarks,
    @JsonKey(name: 'other_visit_remarks') String? otherRemarks,
    @JsonKey(name: 'fssai_number') String? fssaiNumber,
    @JsonKey(name: 'custom_fssai_no') String? updateFssaiNo,
    @JsonKey(name: 'custom_fssai_certificate_image') String? certificateImage,
    String? certificateImageUrl,
  }) = _FBO;
  
  factory FBO.fromJson(Map<String, dynamic> json) => _$FBOFromJson(json);
}

extension FBOApi on FBO {
  bool get isNewVisit => remarks == 'New Visit';
  bool get isFollowUp => remarks == 'Follow up';
  bool get isEnrolled => active.isTrue;
  bool get isNotIntrested => remarks == 'Not Intrested';
}
