// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BankDetails _$BankDetailsFromJson(Map<String, dynamic> json) {
  return _BankDetails.fromJson(json);
}

/// @nodoc
mixin _$BankDetails {
  @JsonKey(name: 'payment_type')
  String? get paymentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_name')
  String? get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_number')
  String? get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ifsc_code')
  String? get ifscCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'reenter_account_number')
  String? get reenterAccNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'benificiary_name')
  String? get beneficiaryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'upi_id')
  String? get upiId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankDetailsCopyWith<BankDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankDetailsCopyWith<$Res> {
  factory $BankDetailsCopyWith(
          BankDetails value, $Res Function(BankDetails) then) =
      _$BankDetailsCopyWithImpl<$Res, BankDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'payment_type') String? paymentType,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'account_number') String? accountNumber,
      @JsonKey(name: 'ifsc_code') String? ifscCode,
      @JsonKey(name: 'reenter_account_number') String? reenterAccNumber,
      @JsonKey(name: 'benificiary_name') String? beneficiaryName,
      @JsonKey(name: 'upi_id') String? upiId});
}

/// @nodoc
class _$BankDetailsCopyWithImpl<$Res, $Val extends BankDetails>
    implements $BankDetailsCopyWith<$Res> {
  _$BankDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentType = freezed,
    Object? bankName = freezed,
    Object? accountNumber = freezed,
    Object? ifscCode = freezed,
    Object? reenterAccNumber = freezed,
    Object? beneficiaryName = freezed,
    Object? upiId = freezed,
  }) {
    return _then(_value.copyWith(
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      ifscCode: freezed == ifscCode
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String?,
      reenterAccNumber: freezed == reenterAccNumber
          ? _value.reenterAccNumber
          : reenterAccNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryName: freezed == beneficiaryName
          ? _value.beneficiaryName
          : beneficiaryName // ignore: cast_nullable_to_non_nullable
              as String?,
      upiId: freezed == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankDetailsImplCopyWith<$Res>
    implements $BankDetailsCopyWith<$Res> {
  factory _$$BankDetailsImplCopyWith(
          _$BankDetailsImpl value, $Res Function(_$BankDetailsImpl) then) =
      __$$BankDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'payment_type') String? paymentType,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'account_number') String? accountNumber,
      @JsonKey(name: 'ifsc_code') String? ifscCode,
      @JsonKey(name: 'reenter_account_number') String? reenterAccNumber,
      @JsonKey(name: 'benificiary_name') String? beneficiaryName,
      @JsonKey(name: 'upi_id') String? upiId});
}

/// @nodoc
class __$$BankDetailsImplCopyWithImpl<$Res>
    extends _$BankDetailsCopyWithImpl<$Res, _$BankDetailsImpl>
    implements _$$BankDetailsImplCopyWith<$Res> {
  __$$BankDetailsImplCopyWithImpl(
      _$BankDetailsImpl _value, $Res Function(_$BankDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentType = freezed,
    Object? bankName = freezed,
    Object? accountNumber = freezed,
    Object? ifscCode = freezed,
    Object? reenterAccNumber = freezed,
    Object? beneficiaryName = freezed,
    Object? upiId = freezed,
  }) {
    return _then(_$BankDetailsImpl(
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      ifscCode: freezed == ifscCode
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String?,
      reenterAccNumber: freezed == reenterAccNumber
          ? _value.reenterAccNumber
          : reenterAccNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryName: freezed == beneficiaryName
          ? _value.beneficiaryName
          : beneficiaryName // ignore: cast_nullable_to_non_nullable
              as String?,
      upiId: freezed == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankDetailsImpl implements _BankDetails {
  _$BankDetailsImpl(
      {@JsonKey(name: 'payment_type') this.paymentType,
      @JsonKey(name: 'bank_name') this.bankName,
      @JsonKey(name: 'account_number') this.accountNumber,
      @JsonKey(name: 'ifsc_code') this.ifscCode,
      @JsonKey(name: 'reenter_account_number') this.reenterAccNumber,
      @JsonKey(name: 'benificiary_name') this.beneficiaryName,
      @JsonKey(name: 'upi_id') this.upiId});

  factory _$BankDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankDetailsImplFromJson(json);

  @override
  @JsonKey(name: 'payment_type')
  final String? paymentType;
  @override
  @JsonKey(name: 'bank_name')
  final String? bankName;
  @override
  @JsonKey(name: 'account_number')
  final String? accountNumber;
  @override
  @JsonKey(name: 'ifsc_code')
  final String? ifscCode;
  @override
  @JsonKey(name: 'reenter_account_number')
  final String? reenterAccNumber;
  @override
  @JsonKey(name: 'benificiary_name')
  final String? beneficiaryName;
  @override
  @JsonKey(name: 'upi_id')
  final String? upiId;

  @override
  String toString() {
    return 'BankDetails(paymentType: $paymentType, bankName: $bankName, accountNumber: $accountNumber, ifscCode: $ifscCode, reenterAccNumber: $reenterAccNumber, beneficiaryName: $beneficiaryName, upiId: $upiId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankDetailsImpl &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.ifscCode, ifscCode) ||
                other.ifscCode == ifscCode) &&
            (identical(other.reenterAccNumber, reenterAccNumber) ||
                other.reenterAccNumber == reenterAccNumber) &&
            (identical(other.beneficiaryName, beneficiaryName) ||
                other.beneficiaryName == beneficiaryName) &&
            (identical(other.upiId, upiId) || other.upiId == upiId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, paymentType, bankName,
      accountNumber, ifscCode, reenterAccNumber, beneficiaryName, upiId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankDetailsImplCopyWith<_$BankDetailsImpl> get copyWith =>
      __$$BankDetailsImplCopyWithImpl<_$BankDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankDetailsImplToJson(
      this,
    );
  }
}

abstract class _BankDetails implements BankDetails {
  factory _BankDetails(
      {@JsonKey(name: 'payment_type') final String? paymentType,
      @JsonKey(name: 'bank_name') final String? bankName,
      @JsonKey(name: 'account_number') final String? accountNumber,
      @JsonKey(name: 'ifsc_code') final String? ifscCode,
      @JsonKey(name: 'reenter_account_number') final String? reenterAccNumber,
      @JsonKey(name: 'benificiary_name') final String? beneficiaryName,
      @JsonKey(name: 'upi_id') final String? upiId}) = _$BankDetailsImpl;

  factory _BankDetails.fromJson(Map<String, dynamic> json) =
      _$BankDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'payment_type')
  String? get paymentType;
  @override
  @JsonKey(name: 'bank_name')
  String? get bankName;
  @override
  @JsonKey(name: 'account_number')
  String? get accountNumber;
  @override
  @JsonKey(name: 'ifsc_code')
  String? get ifscCode;
  @override
  @JsonKey(name: 'reenter_account_number')
  String? get reenterAccNumber;
  @override
  @JsonKey(name: 'benificiary_name')
  String? get beneficiaryName;
  @override
  @JsonKey(name: 'upi_id')
  String? get upiId;
  @override
  @JsonKey(ignore: true)
  _$$BankDetailsImplCopyWith<_$BankDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
