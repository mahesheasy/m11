// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fbo_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FBODetailsImpl _$$FBODetailsImplFromJson(Map<String, dynamic> json) =>
    _$FBODetailsImpl(
      name: json['name'] as String,
      supplierName: json['supplier_name'] as String?,
      businessName: json['business_name'] as String?,
      mobileNo: json['mobile_no'] as String?,
      supplierType: json['supplier_type'] as String?,
      type: json['custom_fbo_type'] as String?,
      taxId: json['tax_id'] as String?,
      route: json['custom_route'] as String?,
      managerName: json['manager_name'] as String?,
      managerContactNo: json['manager_contact_no'] as String?,
      active: _$JsonConverterFromJson<int, bool>(
          json['active'], const BoolenAPIConverter().fromJson),
      pricekg: (json['custom_pricekg'] as num?)?.toDouble(),
      noOfItems: (json['custom_no_of_items_in_the_menu'] as num?)?.toInt(),
      noOfFriedItems:
          (json['custom_no_of_fried_items_in_the_menu'] as num?)?.toInt(),
      seatingCapacity: (json['custom_seating_capacity'] as num?)?.toInt(),
      cansGiven: (json['total_cans_given'] as num?)?.toInt(),
      depot: json['depot'] as String?,
      email: json['email_address'] as String?,
      upiId: json['upi_id'] as String?,
      pan: json['pan_number'] as String?,
      gstNumber: json['gst_number'] as String?,
      remarks: json['custom_remarks'] as String?,
      enrollDate: json['date_of_enrollment'] as String?,
      followupDate: json['follow_up_date'] as String?,
      paymentType: json['payment_type'] as String?,
      primaryAddress: json['primary_address'] as String?,
      address: json['address'] as String?,
      creationDate: json['creation_date'] as String?,
      ucoCOllDate: json['uco_collection_date'] as String?,
      restaurantType: json['restaurant_type'] as String?,
      fssaiNumber: json['fssai_number'] as String?,
      updateFssaiNo: json['custom_fssai_no'] as String?,
      certificateImage: json['custom_fssai_certificate_image'] as String?,
      certificateImageUrl: json['certificateImageUrl'] as String?,
      photo: json['photo'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      pincode: json['pincode'] as String?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$$FBODetailsImplToJson(_$FBODetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'supplier_name': instance.supplierName,
      'business_name': instance.businessName,
      'mobile_no': instance.mobileNo,
      'supplier_type': instance.supplierType,
      'custom_fbo_type': instance.type,
      'tax_id': instance.taxId,
      'custom_route': instance.route,
      'manager_name': instance.managerName,
      'manager_contact_no': instance.managerContactNo,
      'active': _$JsonConverterToJson<int, bool>(
          instance.active, const BoolenAPIConverter().toJson),
      'custom_pricekg': instance.pricekg,
      'custom_no_of_items_in_the_menu': instance.noOfItems,
      'custom_no_of_fried_items_in_the_menu': instance.noOfFriedItems,
      'custom_seating_capacity': instance.seatingCapacity,
      'total_cans_given': instance.cansGiven,
      'depot': instance.depot,
      'email_address': instance.email,
      'upi_id': instance.upiId,
      'pan_number': instance.pan,
      'gst_number': instance.gstNumber,
      'custom_remarks': instance.remarks,
      'date_of_enrollment': instance.enrollDate,
      'follow_up_date': instance.followupDate,
      'payment_type': instance.paymentType,
      'primary_address': instance.primaryAddress,
      'address': instance.address,
      'creation_date': instance.creationDate,
      'uco_collection_date': instance.ucoCOllDate,
      'restaurant_type': instance.restaurantType,
      'fssai_number': instance.fssaiNumber,
      'custom_fssai_no': instance.updateFssaiNo,
      'custom_fssai_certificate_image': instance.certificateImage,
      'certificateImageUrl': instance.certificateImageUrl,
      'photo': instance.photo,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'state': instance.state,
      'city': instance.city,
      'pincode': instance.pincode,
      'website': instance.website,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
