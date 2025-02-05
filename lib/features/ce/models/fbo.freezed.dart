// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fbo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FBO _$FBOFromJson(Map<String, dynamic> json) {
  return _FBO.fromJson(json);
}

/// @nodoc
mixin _$FBO {
  @JsonKey(name: 'name')
  String get fboName => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String get supplierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_name', defaultValue: '')
  String get businessName => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_address')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_collected_date')
  String? get lastCollectedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'primary_address', defaultValue: '')
  String get primaryAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_weight', defaultValue: 0.0)
  double get lastBuyWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_buy_amount', defaultValue: 0.0)
  num get lastBuyPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_price', defaultValue: 0.0)
  double get avgPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_weight', defaultValue: 0.0)
  double get avgWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_pricekg', includeToJson: false)
  double get pricePerKg => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_of_cans')
  double? get noOfCans => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_buy_date')
  String? get lastBuyDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_id')
  String? get taxId => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_up_date')
  String? get followUpDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_number')
  String? get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'pan')
  String? get pan => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_route')
  String? get route => throw _privateConstructorUsedError;
  @JsonKey(name: 'ifsc_code')
  String? get ifsc => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_request_id')
  String? get canReqId => throw _privateConstructorUsedError;
  @BoolenAPIConverter()
  @JsonKey(name: 'custom_active', defaultValue: false, includeToJson: false)
  bool get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_remarks')
  String? get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduled_date')
  String? get scheduledDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'visit_remarks')
  String? get visitRemarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'other_visit_remarks')
  String? get otherRemarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'fssai_number')
  String? get fssaiNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_fssai_no')
  String? get updateFssaiNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_fssai_certificate_image')
  String? get certificateImage => throw _privateConstructorUsedError;
  String? get certificateImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FBOCopyWith<FBO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FBOCopyWith<$Res> {
  factory $FBOCopyWith(FBO value, $Res Function(FBO) then) =
      _$FBOCopyWithImpl<$Res, FBO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String fboName,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'business_name', defaultValue: '') String businessName,
      String? latitude,
      String? longitude,
      @JsonKey(name: 'email_address') String? email,
      @JsonKey(name: 'last_collected_date') String? lastCollectedDate,
      @JsonKey(name: 'primary_address', defaultValue: '') String primaryAddress,
      @JsonKey(name: 'last_weight', defaultValue: 0.0) double lastBuyWeight,
      @JsonKey(name: 'last_buy_amount', defaultValue: 0.0) num lastBuyPrice,
      @JsonKey(name: 'average_price', defaultValue: 0.0) double avgPrice,
      @JsonKey(name: 'average_weight', defaultValue: 0.0) double avgWeight,
      @JsonKey(name: 'custom_pricekg', includeToJson: false) double pricePerKg,
      @JsonKey(name: 'no_of_cans') double? noOfCans,
      @JsonKey(name: 'last_buy_date') String? lastBuyDate,
      @JsonKey(name: 'tax_id') String? taxId,
      @JsonKey(name: 'follow_up_date') String? followUpDate,
      @JsonKey(name: 'mobile_number') String? mobileNumber,
      @JsonKey(name: 'pan') String? pan,
      @JsonKey(name: 'custom_route') String? route,
      @JsonKey(name: 'ifsc_code') String? ifsc,
      @JsonKey(name: 'can_request_id') String? canReqId,
      @BoolenAPIConverter()
      @JsonKey(name: 'custom_active', defaultValue: false, includeToJson: false)
      bool active,
      @JsonKey(name: 'custom_remarks') String? remarks,
      @JsonKey(name: 'scheduled_date') String? scheduledDate,
      @JsonKey(name: 'visit_remarks') String? visitRemarks,
      @JsonKey(name: 'other_visit_remarks') String? otherRemarks,
      @JsonKey(name: 'fssai_number') String? fssaiNumber,
      @JsonKey(name: 'custom_fssai_no') String? updateFssaiNo,
      @JsonKey(name: 'custom_fssai_certificate_image') String? certificateImage,
      String? certificateImageUrl});
}

/// @nodoc
class _$FBOCopyWithImpl<$Res, $Val extends FBO> implements $FBOCopyWith<$Res> {
  _$FBOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fboName = null,
    Object? supplierName = null,
    Object? businessName = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? email = freezed,
    Object? lastCollectedDate = freezed,
    Object? primaryAddress = null,
    Object? lastBuyWeight = null,
    Object? lastBuyPrice = null,
    Object? avgPrice = null,
    Object? avgWeight = null,
    Object? pricePerKg = null,
    Object? noOfCans = freezed,
    Object? lastBuyDate = freezed,
    Object? taxId = freezed,
    Object? followUpDate = freezed,
    Object? mobileNumber = freezed,
    Object? pan = freezed,
    Object? route = freezed,
    Object? ifsc = freezed,
    Object? canReqId = freezed,
    Object? active = null,
    Object? remarks = freezed,
    Object? scheduledDate = freezed,
    Object? visitRemarks = freezed,
    Object? otherRemarks = freezed,
    Object? fssaiNumber = freezed,
    Object? updateFssaiNo = freezed,
    Object? certificateImage = freezed,
    Object? certificateImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      fboName: null == fboName
          ? _value.fboName
          : fboName // ignore: cast_nullable_to_non_nullable
              as String,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      lastCollectedDate: freezed == lastCollectedDate
          ? _value.lastCollectedDate
          : lastCollectedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAddress: null == primaryAddress
          ? _value.primaryAddress
          : primaryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      lastBuyWeight: null == lastBuyWeight
          ? _value.lastBuyWeight
          : lastBuyWeight // ignore: cast_nullable_to_non_nullable
              as double,
      lastBuyPrice: null == lastBuyPrice
          ? _value.lastBuyPrice
          : lastBuyPrice // ignore: cast_nullable_to_non_nullable
              as num,
      avgPrice: null == avgPrice
          ? _value.avgPrice
          : avgPrice // ignore: cast_nullable_to_non_nullable
              as double,
      avgWeight: null == avgWeight
          ? _value.avgWeight
          : avgWeight // ignore: cast_nullable_to_non_nullable
              as double,
      pricePerKg: null == pricePerKg
          ? _value.pricePerKg
          : pricePerKg // ignore: cast_nullable_to_non_nullable
              as double,
      noOfCans: freezed == noOfCans
          ? _value.noOfCans
          : noOfCans // ignore: cast_nullable_to_non_nullable
              as double?,
      lastBuyDate: freezed == lastBuyDate
          ? _value.lastBuyDate
          : lastBuyDate // ignore: cast_nullable_to_non_nullable
              as String?,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String?,
      followUpDate: freezed == followUpDate
          ? _value.followUpDate
          : followUpDate // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pan: freezed == pan
          ? _value.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      ifsc: freezed == ifsc
          ? _value.ifsc
          : ifsc // ignore: cast_nullable_to_non_nullable
              as String?,
      canReqId: freezed == canReqId
          ? _value.canReqId
          : canReqId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledDate: freezed == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as String?,
      visitRemarks: freezed == visitRemarks
          ? _value.visitRemarks
          : visitRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
      otherRemarks: freezed == otherRemarks
          ? _value.otherRemarks
          : otherRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
      fssaiNumber: freezed == fssaiNumber
          ? _value.fssaiNumber
          : fssaiNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      updateFssaiNo: freezed == updateFssaiNo
          ? _value.updateFssaiNo
          : updateFssaiNo // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateImage: freezed == certificateImage
          ? _value.certificateImage
          : certificateImage // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateImageUrl: freezed == certificateImageUrl
          ? _value.certificateImageUrl
          : certificateImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FBOImplCopyWith<$Res> implements $FBOCopyWith<$Res> {
  factory _$$FBOImplCopyWith(_$FBOImpl value, $Res Function(_$FBOImpl) then) =
      __$$FBOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String fboName,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'business_name', defaultValue: '') String businessName,
      String? latitude,
      String? longitude,
      @JsonKey(name: 'email_address') String? email,
      @JsonKey(name: 'last_collected_date') String? lastCollectedDate,
      @JsonKey(name: 'primary_address', defaultValue: '') String primaryAddress,
      @JsonKey(name: 'last_weight', defaultValue: 0.0) double lastBuyWeight,
      @JsonKey(name: 'last_buy_amount', defaultValue: 0.0) num lastBuyPrice,
      @JsonKey(name: 'average_price', defaultValue: 0.0) double avgPrice,
      @JsonKey(name: 'average_weight', defaultValue: 0.0) double avgWeight,
      @JsonKey(name: 'custom_pricekg', includeToJson: false) double pricePerKg,
      @JsonKey(name: 'no_of_cans') double? noOfCans,
      @JsonKey(name: 'last_buy_date') String? lastBuyDate,
      @JsonKey(name: 'tax_id') String? taxId,
      @JsonKey(name: 'follow_up_date') String? followUpDate,
      @JsonKey(name: 'mobile_number') String? mobileNumber,
      @JsonKey(name: 'pan') String? pan,
      @JsonKey(name: 'custom_route') String? route,
      @JsonKey(name: 'ifsc_code') String? ifsc,
      @JsonKey(name: 'can_request_id') String? canReqId,
      @BoolenAPIConverter()
      @JsonKey(name: 'custom_active', defaultValue: false, includeToJson: false)
      bool active,
      @JsonKey(name: 'custom_remarks') String? remarks,
      @JsonKey(name: 'scheduled_date') String? scheduledDate,
      @JsonKey(name: 'visit_remarks') String? visitRemarks,
      @JsonKey(name: 'other_visit_remarks') String? otherRemarks,
      @JsonKey(name: 'fssai_number') String? fssaiNumber,
      @JsonKey(name: 'custom_fssai_no') String? updateFssaiNo,
      @JsonKey(name: 'custom_fssai_certificate_image') String? certificateImage,
      String? certificateImageUrl});
}

/// @nodoc
class __$$FBOImplCopyWithImpl<$Res> extends _$FBOCopyWithImpl<$Res, _$FBOImpl>
    implements _$$FBOImplCopyWith<$Res> {
  __$$FBOImplCopyWithImpl(_$FBOImpl _value, $Res Function(_$FBOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fboName = null,
    Object? supplierName = null,
    Object? businessName = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? email = freezed,
    Object? lastCollectedDate = freezed,
    Object? primaryAddress = null,
    Object? lastBuyWeight = null,
    Object? lastBuyPrice = null,
    Object? avgPrice = null,
    Object? avgWeight = null,
    Object? pricePerKg = null,
    Object? noOfCans = freezed,
    Object? lastBuyDate = freezed,
    Object? taxId = freezed,
    Object? followUpDate = freezed,
    Object? mobileNumber = freezed,
    Object? pan = freezed,
    Object? route = freezed,
    Object? ifsc = freezed,
    Object? canReqId = freezed,
    Object? active = null,
    Object? remarks = freezed,
    Object? scheduledDate = freezed,
    Object? visitRemarks = freezed,
    Object? otherRemarks = freezed,
    Object? fssaiNumber = freezed,
    Object? updateFssaiNo = freezed,
    Object? certificateImage = freezed,
    Object? certificateImageUrl = freezed,
  }) {
    return _then(_$FBOImpl(
      fboName: null == fboName
          ? _value.fboName
          : fboName // ignore: cast_nullable_to_non_nullable
              as String,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: null == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      lastCollectedDate: freezed == lastCollectedDate
          ? _value.lastCollectedDate
          : lastCollectedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryAddress: null == primaryAddress
          ? _value.primaryAddress
          : primaryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      lastBuyWeight: null == lastBuyWeight
          ? _value.lastBuyWeight
          : lastBuyWeight // ignore: cast_nullable_to_non_nullable
              as double,
      lastBuyPrice: null == lastBuyPrice
          ? _value.lastBuyPrice
          : lastBuyPrice // ignore: cast_nullable_to_non_nullable
              as num,
      avgPrice: null == avgPrice
          ? _value.avgPrice
          : avgPrice // ignore: cast_nullable_to_non_nullable
              as double,
      avgWeight: null == avgWeight
          ? _value.avgWeight
          : avgWeight // ignore: cast_nullable_to_non_nullable
              as double,
      pricePerKg: null == pricePerKg
          ? _value.pricePerKg
          : pricePerKg // ignore: cast_nullable_to_non_nullable
              as double,
      noOfCans: freezed == noOfCans
          ? _value.noOfCans
          : noOfCans // ignore: cast_nullable_to_non_nullable
              as double?,
      lastBuyDate: freezed == lastBuyDate
          ? _value.lastBuyDate
          : lastBuyDate // ignore: cast_nullable_to_non_nullable
              as String?,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String?,
      followUpDate: freezed == followUpDate
          ? _value.followUpDate
          : followUpDate // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pan: freezed == pan
          ? _value.pan
          : pan // ignore: cast_nullable_to_non_nullable
              as String?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      ifsc: freezed == ifsc
          ? _value.ifsc
          : ifsc // ignore: cast_nullable_to_non_nullable
              as String?,
      canReqId: freezed == canReqId
          ? _value.canReqId
          : canReqId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledDate: freezed == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as String?,
      visitRemarks: freezed == visitRemarks
          ? _value.visitRemarks
          : visitRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
      otherRemarks: freezed == otherRemarks
          ? _value.otherRemarks
          : otherRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
      fssaiNumber: freezed == fssaiNumber
          ? _value.fssaiNumber
          : fssaiNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      updateFssaiNo: freezed == updateFssaiNo
          ? _value.updateFssaiNo
          : updateFssaiNo // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateImage: freezed == certificateImage
          ? _value.certificateImage
          : certificateImage // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateImageUrl: freezed == certificateImageUrl
          ? _value.certificateImageUrl
          : certificateImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FBOImpl implements _FBO {
  _$FBOImpl(
      {@JsonKey(name: 'name') required this.fboName,
      @JsonKey(name: 'supplier_name') required this.supplierName,
      @JsonKey(name: 'business_name', defaultValue: '')
      required this.businessName,
      this.latitude,
      this.longitude,
      @JsonKey(name: 'email_address') this.email,
      @JsonKey(name: 'last_collected_date') this.lastCollectedDate,
      @JsonKey(name: 'primary_address', defaultValue: '')
      required this.primaryAddress,
      @JsonKey(name: 'last_weight', defaultValue: 0.0)
      required this.lastBuyWeight,
      @JsonKey(name: 'last_buy_amount', defaultValue: 0.0)
      required this.lastBuyPrice,
      @JsonKey(name: 'average_price', defaultValue: 0.0) required this.avgPrice,
      @JsonKey(name: 'average_weight', defaultValue: 0.0)
      required this.avgWeight,
      @JsonKey(name: 'custom_pricekg', includeToJson: false)
      required this.pricePerKg,
      @JsonKey(name: 'no_of_cans') this.noOfCans,
      @JsonKey(name: 'last_buy_date') this.lastBuyDate,
      @JsonKey(name: 'tax_id') this.taxId,
      @JsonKey(name: 'follow_up_date') this.followUpDate,
      @JsonKey(name: 'mobile_number') this.mobileNumber,
      @JsonKey(name: 'pan') this.pan,
      @JsonKey(name: 'custom_route') this.route,
      @JsonKey(name: 'ifsc_code') this.ifsc,
      @JsonKey(name: 'can_request_id') this.canReqId,
      @BoolenAPIConverter()
      @JsonKey(name: 'custom_active', defaultValue: false, includeToJson: false)
      required this.active,
      @JsonKey(name: 'custom_remarks') this.remarks,
      @JsonKey(name: 'scheduled_date') this.scheduledDate,
      @JsonKey(name: 'visit_remarks') this.visitRemarks,
      @JsonKey(name: 'other_visit_remarks') this.otherRemarks,
      @JsonKey(name: 'fssai_number') this.fssaiNumber,
      @JsonKey(name: 'custom_fssai_no') this.updateFssaiNo,
      @JsonKey(name: 'custom_fssai_certificate_image') this.certificateImage,
      this.certificateImageUrl});

  factory _$FBOImpl.fromJson(Map<String, dynamic> json) =>
      _$$FBOImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String fboName;
  @override
  @JsonKey(name: 'supplier_name')
  final String supplierName;
  @override
  @JsonKey(name: 'business_name', defaultValue: '')
  final String businessName;
  @override
  final String? latitude;
  @override
  final String? longitude;
  @override
  @JsonKey(name: 'email_address')
  final String? email;
  @override
  @JsonKey(name: 'last_collected_date')
  final String? lastCollectedDate;
  @override
  @JsonKey(name: 'primary_address', defaultValue: '')
  final String primaryAddress;
  @override
  @JsonKey(name: 'last_weight', defaultValue: 0.0)
  final double lastBuyWeight;
  @override
  @JsonKey(name: 'last_buy_amount', defaultValue: 0.0)
  final num lastBuyPrice;
  @override
  @JsonKey(name: 'average_price', defaultValue: 0.0)
  final double avgPrice;
  @override
  @JsonKey(name: 'average_weight', defaultValue: 0.0)
  final double avgWeight;
  @override
  @JsonKey(name: 'custom_pricekg', includeToJson: false)
  final double pricePerKg;
  @override
  @JsonKey(name: 'no_of_cans')
  final double? noOfCans;
  @override
  @JsonKey(name: 'last_buy_date')
  final String? lastBuyDate;
  @override
  @JsonKey(name: 'tax_id')
  final String? taxId;
  @override
  @JsonKey(name: 'follow_up_date')
  final String? followUpDate;
  @override
  @JsonKey(name: 'mobile_number')
  final String? mobileNumber;
  @override
  @JsonKey(name: 'pan')
  final String? pan;
  @override
  @JsonKey(name: 'custom_route')
  final String? route;
  @override
  @JsonKey(name: 'ifsc_code')
  final String? ifsc;
  @override
  @JsonKey(name: 'can_request_id')
  final String? canReqId;
  @override
  @BoolenAPIConverter()
  @JsonKey(name: 'custom_active', defaultValue: false, includeToJson: false)
  final bool active;
  @override
  @JsonKey(name: 'custom_remarks')
  final String? remarks;
  @override
  @JsonKey(name: 'scheduled_date')
  final String? scheduledDate;
  @override
  @JsonKey(name: 'visit_remarks')
  final String? visitRemarks;
  @override
  @JsonKey(name: 'other_visit_remarks')
  final String? otherRemarks;
  @override
  @JsonKey(name: 'fssai_number')
  final String? fssaiNumber;
  @override
  @JsonKey(name: 'custom_fssai_no')
  final String? updateFssaiNo;
  @override
  @JsonKey(name: 'custom_fssai_certificate_image')
  final String? certificateImage;
  @override
  final String? certificateImageUrl;

  @override
  String toString() {
    return 'FBO(fboName: $fboName, supplierName: $supplierName, businessName: $businessName, latitude: $latitude, longitude: $longitude, email: $email, lastCollectedDate: $lastCollectedDate, primaryAddress: $primaryAddress, lastBuyWeight: $lastBuyWeight, lastBuyPrice: $lastBuyPrice, avgPrice: $avgPrice, avgWeight: $avgWeight, pricePerKg: $pricePerKg, noOfCans: $noOfCans, lastBuyDate: $lastBuyDate, taxId: $taxId, followUpDate: $followUpDate, mobileNumber: $mobileNumber, pan: $pan, route: $route, ifsc: $ifsc, canReqId: $canReqId, active: $active, remarks: $remarks, scheduledDate: $scheduledDate, visitRemarks: $visitRemarks, otherRemarks: $otherRemarks, fssaiNumber: $fssaiNumber, updateFssaiNo: $updateFssaiNo, certificateImage: $certificateImage, certificateImageUrl: $certificateImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FBOImpl &&
            (identical(other.fboName, fboName) || other.fboName == fboName) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.lastCollectedDate, lastCollectedDate) ||
                other.lastCollectedDate == lastCollectedDate) &&
            (identical(other.primaryAddress, primaryAddress) ||
                other.primaryAddress == primaryAddress) &&
            (identical(other.lastBuyWeight, lastBuyWeight) ||
                other.lastBuyWeight == lastBuyWeight) &&
            (identical(other.lastBuyPrice, lastBuyPrice) ||
                other.lastBuyPrice == lastBuyPrice) &&
            (identical(other.avgPrice, avgPrice) ||
                other.avgPrice == avgPrice) &&
            (identical(other.avgWeight, avgWeight) ||
                other.avgWeight == avgWeight) &&
            (identical(other.pricePerKg, pricePerKg) ||
                other.pricePerKg == pricePerKg) &&
            (identical(other.noOfCans, noOfCans) ||
                other.noOfCans == noOfCans) &&
            (identical(other.lastBuyDate, lastBuyDate) ||
                other.lastBuyDate == lastBuyDate) &&
            (identical(other.taxId, taxId) || other.taxId == taxId) &&
            (identical(other.followUpDate, followUpDate) ||
                other.followUpDate == followUpDate) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.pan, pan) || other.pan == pan) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.ifsc, ifsc) || other.ifsc == ifsc) &&
            (identical(other.canReqId, canReqId) ||
                other.canReqId == canReqId) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.visitRemarks, visitRemarks) ||
                other.visitRemarks == visitRemarks) &&
            (identical(other.otherRemarks, otherRemarks) ||
                other.otherRemarks == otherRemarks) &&
            (identical(other.fssaiNumber, fssaiNumber) ||
                other.fssaiNumber == fssaiNumber) &&
            (identical(other.updateFssaiNo, updateFssaiNo) ||
                other.updateFssaiNo == updateFssaiNo) &&
            (identical(other.certificateImage, certificateImage) ||
                other.certificateImage == certificateImage) &&
            (identical(other.certificateImageUrl, certificateImageUrl) ||
                other.certificateImageUrl == certificateImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        fboName,
        supplierName,
        businessName,
        latitude,
        longitude,
        email,
        lastCollectedDate,
        primaryAddress,
        lastBuyWeight,
        lastBuyPrice,
        avgPrice,
        avgWeight,
        pricePerKg,
        noOfCans,
        lastBuyDate,
        taxId,
        followUpDate,
        mobileNumber,
        pan,
        route,
        ifsc,
        canReqId,
        active,
        remarks,
        scheduledDate,
        visitRemarks,
        otherRemarks,
        fssaiNumber,
        updateFssaiNo,
        certificateImage,
        certificateImageUrl
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FBOImplCopyWith<_$FBOImpl> get copyWith =>
      __$$FBOImplCopyWithImpl<_$FBOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FBOImplToJson(
      this,
    );
  }
}

abstract class _FBO implements FBO {
  factory _FBO(
      {@JsonKey(name: 'name') required final String fboName,
      @JsonKey(name: 'supplier_name') required final String supplierName,
      @JsonKey(name: 'business_name', defaultValue: '')
      required final String businessName,
      final String? latitude,
      final String? longitude,
      @JsonKey(name: 'email_address') final String? email,
      @JsonKey(name: 'last_collected_date') final String? lastCollectedDate,
      @JsonKey(name: 'primary_address', defaultValue: '')
      required final String primaryAddress,
      @JsonKey(name: 'last_weight', defaultValue: 0.0)
      required final double lastBuyWeight,
      @JsonKey(name: 'last_buy_amount', defaultValue: 0.0)
      required final num lastBuyPrice,
      @JsonKey(name: 'average_price', defaultValue: 0.0)
      required final double avgPrice,
      @JsonKey(name: 'average_weight', defaultValue: 0.0)
      required final double avgWeight,
      @JsonKey(name: 'custom_pricekg', includeToJson: false)
      required final double pricePerKg,
      @JsonKey(name: 'no_of_cans') final double? noOfCans,
      @JsonKey(name: 'last_buy_date') final String? lastBuyDate,
      @JsonKey(name: 'tax_id') final String? taxId,
      @JsonKey(name: 'follow_up_date') final String? followUpDate,
      @JsonKey(name: 'mobile_number') final String? mobileNumber,
      @JsonKey(name: 'pan') final String? pan,
      @JsonKey(name: 'custom_route') final String? route,
      @JsonKey(name: 'ifsc_code') final String? ifsc,
      @JsonKey(name: 'can_request_id') final String? canReqId,
      @BoolenAPIConverter()
      @JsonKey(name: 'custom_active', defaultValue: false, includeToJson: false)
      required final bool active,
      @JsonKey(name: 'custom_remarks') final String? remarks,
      @JsonKey(name: 'scheduled_date') final String? scheduledDate,
      @JsonKey(name: 'visit_remarks') final String? visitRemarks,
      @JsonKey(name: 'other_visit_remarks') final String? otherRemarks,
      @JsonKey(name: 'fssai_number') final String? fssaiNumber,
      @JsonKey(name: 'custom_fssai_no') final String? updateFssaiNo,
      @JsonKey(name: 'custom_fssai_certificate_image')
      final String? certificateImage,
      final String? certificateImageUrl}) = _$FBOImpl;

  factory _FBO.fromJson(Map<String, dynamic> json) = _$FBOImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get fboName;
  @override
  @JsonKey(name: 'supplier_name')
  String get supplierName;
  @override
  @JsonKey(name: 'business_name', defaultValue: '')
  String get businessName;
  @override
  String? get latitude;
  @override
  String? get longitude;
  @override
  @JsonKey(name: 'email_address')
  String? get email;
  @override
  @JsonKey(name: 'last_collected_date')
  String? get lastCollectedDate;
  @override
  @JsonKey(name: 'primary_address', defaultValue: '')
  String get primaryAddress;
  @override
  @JsonKey(name: 'last_weight', defaultValue: 0.0)
  double get lastBuyWeight;
  @override
  @JsonKey(name: 'last_buy_amount', defaultValue: 0.0)
  num get lastBuyPrice;
  @override
  @JsonKey(name: 'average_price', defaultValue: 0.0)
  double get avgPrice;
  @override
  @JsonKey(name: 'average_weight', defaultValue: 0.0)
  double get avgWeight;
  @override
  @JsonKey(name: 'custom_pricekg', includeToJson: false)
  double get pricePerKg;
  @override
  @JsonKey(name: 'no_of_cans')
  double? get noOfCans;
  @override
  @JsonKey(name: 'last_buy_date')
  String? get lastBuyDate;
  @override
  @JsonKey(name: 'tax_id')
  String? get taxId;
  @override
  @JsonKey(name: 'follow_up_date')
  String? get followUpDate;
  @override
  @JsonKey(name: 'mobile_number')
  String? get mobileNumber;
  @override
  @JsonKey(name: 'pan')
  String? get pan;
  @override
  @JsonKey(name: 'custom_route')
  String? get route;
  @override
  @JsonKey(name: 'ifsc_code')
  String? get ifsc;
  @override
  @JsonKey(name: 'can_request_id')
  String? get canReqId;
  @override
  @BoolenAPIConverter()
  @JsonKey(name: 'custom_active', defaultValue: false, includeToJson: false)
  bool get active;
  @override
  @JsonKey(name: 'custom_remarks')
  String? get remarks;
  @override
  @JsonKey(name: 'scheduled_date')
  String? get scheduledDate;
  @override
  @JsonKey(name: 'visit_remarks')
  String? get visitRemarks;
  @override
  @JsonKey(name: 'other_visit_remarks')
  String? get otherRemarks;
  @override
  @JsonKey(name: 'fssai_number')
  String? get fssaiNumber;
  @override
  @JsonKey(name: 'custom_fssai_no')
  String? get updateFssaiNo;
  @override
  @JsonKey(name: 'custom_fssai_certificate_image')
  String? get certificateImage;
  @override
  String? get certificateImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$FBOImplCopyWith<_$FBOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
