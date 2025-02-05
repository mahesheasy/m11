// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uco_deposit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UCODeposit _$UCODepositFromJson(Map<String, dynamic> json) {
  return _UCODeposit.fromJson(json);
}

/// @nodoc
mixin _$UCODeposit {
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'fbo_id')
  String? get fboId => throw _privateConstructorUsedError;
  @JsonKey(name: 'fbo_name')
  String? get fboName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'collected_qty_in_kgs')
  double get collQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_type')
  String? get paymentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_of_cans')
  double get noOfCans => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_weight_with_oil')
  double get weightWithOil => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_weight_without_oil')
  double get weightWithoutOil => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_weight')
  double get totalWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  double get totalAmt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UCODepositCopyWith<UCODeposit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UCODepositCopyWith<$Res> {
  factory $UCODepositCopyWith(
          UCODeposit value, $Res Function(UCODeposit) then) =
      _$UCODepositCopyWithImpl<$Res, UCODeposit>;
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'fbo_id') String? fboId,
      @JsonKey(name: 'fbo_name') String? fboName,
      String? address,
      @JsonKey(name: 'collected_qty_in_kgs') double collQty,
      @JsonKey(name: 'payment_type') String? paymentType,
      @JsonKey(name: 'no_of_cans') double noOfCans,
      @JsonKey(name: 'can_weight_with_oil') double weightWithOil,
      @JsonKey(name: 'can_weight_without_oil') double weightWithoutOil,
      @JsonKey(name: 'total_weight') double totalWeight,
      @JsonKey(name: 'total_amount') double totalAmt});
}

/// @nodoc
class _$UCODepositCopyWithImpl<$Res, $Val extends UCODeposit>
    implements $UCODepositCopyWith<$Res> {
  _$UCODepositCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? fboId = freezed,
    Object? fboName = freezed,
    Object? address = freezed,
    Object? collQty = null,
    Object? paymentType = freezed,
    Object? noOfCans = null,
    Object? weightWithOil = null,
    Object? weightWithoutOil = null,
    Object? totalWeight = null,
    Object? totalAmt = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      fboId: freezed == fboId
          ? _value.fboId
          : fboId // ignore: cast_nullable_to_non_nullable
              as String?,
      fboName: freezed == fboName
          ? _value.fboName
          : fboName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      collQty: null == collQty
          ? _value.collQty
          : collQty // ignore: cast_nullable_to_non_nullable
              as double,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      noOfCans: null == noOfCans
          ? _value.noOfCans
          : noOfCans // ignore: cast_nullable_to_non_nullable
              as double,
      weightWithOil: null == weightWithOil
          ? _value.weightWithOil
          : weightWithOil // ignore: cast_nullable_to_non_nullable
              as double,
      weightWithoutOil: null == weightWithoutOil
          ? _value.weightWithoutOil
          : weightWithoutOil // ignore: cast_nullable_to_non_nullable
              as double,
      totalWeight: null == totalWeight
          ? _value.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmt: null == totalAmt
          ? _value.totalAmt
          : totalAmt // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UCODepositImplCopyWith<$Res>
    implements $UCODepositCopyWith<$Res> {
  factory _$$UCODepositImplCopyWith(
          _$UCODepositImpl value, $Res Function(_$UCODepositImpl) then) =
      __$$UCODepositImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'fbo_id') String? fboId,
      @JsonKey(name: 'fbo_name') String? fboName,
      String? address,
      @JsonKey(name: 'collected_qty_in_kgs') double collQty,
      @JsonKey(name: 'payment_type') String? paymentType,
      @JsonKey(name: 'no_of_cans') double noOfCans,
      @JsonKey(name: 'can_weight_with_oil') double weightWithOil,
      @JsonKey(name: 'can_weight_without_oil') double weightWithoutOil,
      @JsonKey(name: 'total_weight') double totalWeight,
      @JsonKey(name: 'total_amount') double totalAmt});
}

/// @nodoc
class __$$UCODepositImplCopyWithImpl<$Res>
    extends _$UCODepositCopyWithImpl<$Res, _$UCODepositImpl>
    implements _$$UCODepositImplCopyWith<$Res> {
  __$$UCODepositImplCopyWithImpl(
      _$UCODepositImpl _value, $Res Function(_$UCODepositImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? fboId = freezed,
    Object? fboName = freezed,
    Object? address = freezed,
    Object? collQty = null,
    Object? paymentType = freezed,
    Object? noOfCans = null,
    Object? weightWithOil = null,
    Object? weightWithoutOil = null,
    Object? totalWeight = null,
    Object? totalAmt = null,
  }) {
    return _then(_$UCODepositImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      fboId: freezed == fboId
          ? _value.fboId
          : fboId // ignore: cast_nullable_to_non_nullable
              as String?,
      fboName: freezed == fboName
          ? _value.fboName
          : fboName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      collQty: null == collQty
          ? _value.collQty
          : collQty // ignore: cast_nullable_to_non_nullable
              as double,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      noOfCans: null == noOfCans
          ? _value.noOfCans
          : noOfCans // ignore: cast_nullable_to_non_nullable
              as double,
      weightWithOil: null == weightWithOil
          ? _value.weightWithOil
          : weightWithOil // ignore: cast_nullable_to_non_nullable
              as double,
      weightWithoutOil: null == weightWithoutOil
          ? _value.weightWithoutOil
          : weightWithoutOil // ignore: cast_nullable_to_non_nullable
              as double,
      totalWeight: null == totalWeight
          ? _value.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmt: null == totalAmt
          ? _value.totalAmt
          : totalAmt // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UCODepositImpl implements _UCODeposit {
  _$UCODepositImpl(
      {required this.date,
      @JsonKey(name: 'fbo_id') this.fboId,
      @JsonKey(name: 'fbo_name') this.fboName,
      this.address,
      @JsonKey(name: 'collected_qty_in_kgs') required this.collQty,
      @JsonKey(name: 'payment_type') this.paymentType,
      @JsonKey(name: 'no_of_cans') required this.noOfCans,
      @JsonKey(name: 'can_weight_with_oil') required this.weightWithOil,
      @JsonKey(name: 'can_weight_without_oil') required this.weightWithoutOil,
      @JsonKey(name: 'total_weight') required this.totalWeight,
      @JsonKey(name: 'total_amount') required this.totalAmt});

  factory _$UCODepositImpl.fromJson(Map<String, dynamic> json) =>
      _$$UCODepositImplFromJson(json);

  @override
  final String date;
  @override
  @JsonKey(name: 'fbo_id')
  final String? fboId;
  @override
  @JsonKey(name: 'fbo_name')
  final String? fboName;
  @override
  final String? address;
  @override
  @JsonKey(name: 'collected_qty_in_kgs')
  final double collQty;
  @override
  @JsonKey(name: 'payment_type')
  final String? paymentType;
  @override
  @JsonKey(name: 'no_of_cans')
  final double noOfCans;
  @override
  @JsonKey(name: 'can_weight_with_oil')
  final double weightWithOil;
  @override
  @JsonKey(name: 'can_weight_without_oil')
  final double weightWithoutOil;
  @override
  @JsonKey(name: 'total_weight')
  final double totalWeight;
  @override
  @JsonKey(name: 'total_amount')
  final double totalAmt;

  @override
  String toString() {
    return 'UCODeposit(date: $date, fboId: $fboId, fboName: $fboName, address: $address, collQty: $collQty, paymentType: $paymentType, noOfCans: $noOfCans, weightWithOil: $weightWithOil, weightWithoutOil: $weightWithoutOil, totalWeight: $totalWeight, totalAmt: $totalAmt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UCODepositImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.fboId, fboId) || other.fboId == fboId) &&
            (identical(other.fboName, fboName) || other.fboName == fboName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.collQty, collQty) || other.collQty == collQty) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.noOfCans, noOfCans) ||
                other.noOfCans == noOfCans) &&
            (identical(other.weightWithOil, weightWithOil) ||
                other.weightWithOil == weightWithOil) &&
            (identical(other.weightWithoutOil, weightWithoutOil) ||
                other.weightWithoutOil == weightWithoutOil) &&
            (identical(other.totalWeight, totalWeight) ||
                other.totalWeight == totalWeight) &&
            (identical(other.totalAmt, totalAmt) ||
                other.totalAmt == totalAmt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      fboId,
      fboName,
      address,
      collQty,
      paymentType,
      noOfCans,
      weightWithOil,
      weightWithoutOil,
      totalWeight,
      totalAmt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UCODepositImplCopyWith<_$UCODepositImpl> get copyWith =>
      __$$UCODepositImplCopyWithImpl<_$UCODepositImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UCODepositImplToJson(
      this,
    );
  }
}

abstract class _UCODeposit implements UCODeposit {
  factory _UCODeposit(
      {required final String date,
      @JsonKey(name: 'fbo_id') final String? fboId,
      @JsonKey(name: 'fbo_name') final String? fboName,
      final String? address,
      @JsonKey(name: 'collected_qty_in_kgs') required final double collQty,
      @JsonKey(name: 'payment_type') final String? paymentType,
      @JsonKey(name: 'no_of_cans') required final double noOfCans,
      @JsonKey(name: 'can_weight_with_oil') required final double weightWithOil,
      @JsonKey(name: 'can_weight_without_oil')
      required final double weightWithoutOil,
      @JsonKey(name: 'total_weight') required final double totalWeight,
      @JsonKey(name: 'total_amount')
      required final double totalAmt}) = _$UCODepositImpl;

  factory _UCODeposit.fromJson(Map<String, dynamic> json) =
      _$UCODepositImpl.fromJson;

  @override
  String get date;
  @override
  @JsonKey(name: 'fbo_id')
  String? get fboId;
  @override
  @JsonKey(name: 'fbo_name')
  String? get fboName;
  @override
  String? get address;
  @override
  @JsonKey(name: 'collected_qty_in_kgs')
  double get collQty;
  @override
  @JsonKey(name: 'payment_type')
  String? get paymentType;
  @override
  @JsonKey(name: 'no_of_cans')
  double get noOfCans;
  @override
  @JsonKey(name: 'can_weight_with_oil')
  double get weightWithOil;
  @override
  @JsonKey(name: 'can_weight_without_oil')
  double get weightWithoutOil;
  @override
  @JsonKey(name: 'total_weight')
  double get totalWeight;
  @override
  @JsonKey(name: 'total_amount')
  double get totalAmt;
  @override
  @JsonKey(ignore: true)
  _$$UCODepositImplCopyWith<_$UCODepositImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
