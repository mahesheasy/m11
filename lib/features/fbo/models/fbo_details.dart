import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';

part 'fbo_details.freezed.dart';
part 'fbo_details.g.dart';

@freezed
class FBODetails with _$FBODetails {
  const factory FBODetails({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'supplier_name') String? supplierName,
    @JsonKey(name: 'business_name') String? businessName,
    @JsonKey(name: 'mobile_no') String? mobileNo,
    @JsonKey(name: 'supplier_type') String? supplierType,
    @JsonKey(name: 'custom_fbo_type') String? type,
    @JsonKey(name: 'tax_id') String? taxId,
    @JsonKey(name: 'custom_route') String? route,
    @JsonKey(name: 'manager_name') String? managerName,
    @JsonKey(name: 'manager_contact_no') String? managerContactNo,
    @BoolenAPIConverter() bool? active,
    @JsonKey(name: 'custom_pricekg') double? pricekg,
    @JsonKey(name: 'custom_no_of_items_in_the_menu') int? noOfItems,
    @JsonKey(name: 'custom_no_of_fried_items_in_the_menu') int? noOfFriedItems,
    @JsonKey(name: 'custom_seating_capacity') int? seatingCapacity,
    @JsonKey(name: 'total_cans_given') int? cansGiven,
    String? depot,
    @JsonKey(name: 'email_address') String? email,
    @JsonKey(name: 'upi_id') String? upiId,
    @JsonKey(name: 'pan_number') String? pan,
    @JsonKey(name: 'gst_number') String? gstNumber,
    @JsonKey(name: 'custom_remarks') String? remarks,
    @JsonKey(name: 'date_of_enrollment') String? enrollDate,
    @JsonKey(name: 'follow_up_date') String? followupDate,
    @JsonKey(name: 'payment_type') String? paymentType,
    @JsonKey(name: 'primary_address') String? primaryAddress,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'creation_date') String? creationDate,
    @JsonKey(name: 'uco_collection_date') String? ucoCOllDate,
    @JsonKey(name: 'restaurant_type') String? restaurantType,
    @JsonKey(name: 'fssai_number') String? fssaiNumber,
    @JsonKey(name: 'custom_fssai_no') String? updateFssaiNo,
    @JsonKey(name: 'custom_fssai_certificate_image') String? certificateImage,
    String? certificateImageUrl,
    String? photo,
    String? latitude,
    String? longitude,

    String? state,
    String? city,
    String? pincode,
    String? website,
  }) = _FBODetails;

  factory FBODetails.fromJson(Map<String, dynamic> json) => _$FBODetailsFromJson(json);

  static FBODetails fromFOB(FBO fbo) => FBODetails(
    name: fbo.fboName,
    supplierName: fbo.supplierName,
    businessName: fbo.businessName,
    primaryAddress: fbo.primaryAddress,
    managerContactNo: fbo.mobileNumber,
    email: fbo.email,
    cansGiven: (fbo.noOfCans ?? 0).toInt(),
    pricekg: fbo.pricePerKg,
    remarks: fbo.remarks,
    fssaiNumber: fbo.fssaiNumber,
    updateFssaiNo: fbo.updateFssaiNo,
    certificateImage: fbo.certificateImage,
  );
}

extension FBOApi on FBODetails {
  bool get isNewVisit => remarks == 'New Visit';
  bool get isFollowUp => remarks == 'Follow Up';
  bool get isEnrolled => remarks == 'Enrolled';
  bool get isNotIntrested => remarks == 'Not Intrested';

  bool get isRegistered => type == 'Registered';

  bool get isValidCoordinates => double.tryParse(latitude.valueOrEmpty) != null && double.tryParse(longitude.valueOrEmpty) != null;
}
