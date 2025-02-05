import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/model/bank_details.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';

part 'enroll_fbo.freezed.dart';
part 'enroll_fbo.g.dart';

@freezed
class EnrollFBO with _$EnrollFBO {
  factory EnrollFBO({
    @JsonKey(name: 'name') String? id,
    @JsonKey(name: 'manager_name') String? managerName,
    @JsonKey(name: 'manager_contact_no') String? managerContactNum,
    @JsonKey(name: 'business_name') String? businessName,
    @JsonKey(name: 'fbo_name') String? fboName,
    @JsonKey(name: 'supplier_type') String? supplierType,
    @JsonKey(name: 'payment_type') String? paymentType,
    @JsonKey(name: 'address_line_1') String? addressLine1,
    @JsonKey(name: 'primary_address') String? address,
    @JsonKey(name: 'custom_route') String? route,
    String? country,
    String? state,
    String? city,
    String? pincode,
    String? remarks,
    @JsonKey(name: 'fbo_type') String? fboType,
    @JsonKey(name: 'other_remarks') String? otherRemarks,
    @JsonKey(name: 'follow_up_date') String? followupDate,
    @JsonKey(name: 'uco_collection_date') String? ucoCollectionDate,
    @JsonKey(name: 'uco_collection_time', includeToJson: false) String? ucoCollectionTime,
    @JsonKey(name: 'mobile_no') String? mobileNumber,
    @JsonKey(name: 'land_line_number') String? landLineNumber,
    @JsonKey(name: 'email_id') String? email,
    @JsonKey(name: 'gstin_number') String? gstinNumber,
    @JsonKey(name: 'fssai_no') String? fssaiNumber,
    @JsonKey(name: 'is_enrolling', defaultValue: false) bool? isEnrolling,
    @JsonKey(name: 'is_not_interested', defaultValue: false) bool? isNotInterested,
    @JsonKey(name: 'is_follow_up', defaultValue: false) bool? isFollowUp,
    String? website,
    @JsonKey(name: 'pricekg') double? ratePerKilogram,
    double? latitude,
    double? longitude,
    String? location,
    @JsonKey(name: 'photo') String? photo,
    @JsonKey(name: 'fssai_certificate_image') String? certificateImage,
    String? certificateImageUrl,
    @JsonKey(name: 'restaurant_type') String? restaurantType,
    String? photoUrl,
    @JsonKey(name: 'bank_details') BankDetails? bankDetails,
    @JsonKey(includeToJson: false, defaultValue: 0) double? basePrice,
    @JsonKey(includeToJson: false, defaultValue: 0) double? gstPercent,
    @JsonKey(name: 'custom_no_of_items_in_the_menu') int? noOfMenuItems,
    @JsonKey(name: 'custom_no_of_fried_items_in_the_menu') int? noOfFriedItems,
    @JsonKey(name: 'custom_seating_capacity') int? seatingCapacity,
  }) = _EnrollBusinessForm;

  factory EnrollFBO.fromJson(Map<String, dynamic> json) => _$EnrollFBOFromJson(json);

  factory EnrollFBO.fromDetails(FBODetails fbo) {
    return EnrollFBO(
      isEnrolling: false, 
      isNotInterested: false, 
      isFollowUp: false,
      id: fbo.name,
      address: fbo.primaryAddress,
      businessName: fbo.businessName,
      fboName: fbo.businessName,
      managerContactNum: fbo.managerContactNo?.replaceAll('+91-', ''),
      paymentType: fbo.paymentType,
      managerName: fbo.managerName,
      email: fbo.email,
      mobileNumber: fbo.mobileNo?.replaceAll('+91-', ''),
      ratePerKilogram: fbo.pricekg,
      noOfMenuItems: fbo.noOfItems,
      noOfFriedItems: fbo.noOfFriedItems,
      seatingCapacity: fbo.seatingCapacity,
      supplierType: fbo.supplierType,
      state: fbo.state,
      city: fbo.city,
      addressLine1: fbo.address ?? fbo.primaryAddress,
      location: fbo.primaryAddress,
      pincode: fbo.pincode,
      gstinNumber: fbo.gstNumber,
      website: fbo.website,
      fboType: fbo.type,
      photoUrl: fbo.photo,
      latitude: double.tryParse(fbo.latitude.valueOrEmpty),
      longitude: double.tryParse(fbo.longitude.valueOrEmpty),
      remarks: fbo.remarks,
      route: fbo.route,
      restaurantType: fbo.restaurantType,
      fssaiNumber: fbo.fssaiNumber,
      followupDate: fbo.followupDate,
      certificateImageUrl: fbo.certificateImage,
    );
  }

  factory EnrollFBO.fromFBO(FBO fbo) {
    return EnrollFBO(
      isEnrolling: false, 
      isNotInterested: false, 
      isFollowUp: false,
      id: fbo.fboName,
      address: fbo.primaryAddress,
      businessName: fbo.businessName,
      fboName: fbo.businessName,
      email: fbo.email,
      latitude: double.tryParse(fbo.latitude.valueOrEmpty),
      longitude: double.tryParse(fbo.longitude.valueOrEmpty),
      remarks: fbo.remarks,
      route: fbo.route,
      ratePerKilogram: fbo.pricePerKg,
      followupDate: fbo.followUpDate,
    );
  }
  static Map<String, dynamic> toEncodedFormJson(final EnrollFBO form) {
    final json = form.toJson();


    return json;
  }
}

extension EnrollFBOApi on EnrollFBO {
  bool get isRegistered => fboType == 'Registered';
  bool get isUnRegistered => !isRegistered;
  bool get isAgreegator => supplierType.containsValidValue && supplierType == 'Aggregator';
}