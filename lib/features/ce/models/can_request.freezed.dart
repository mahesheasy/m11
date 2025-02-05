// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'can_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CanRequest _$CanRequestFromJson(Map<String, dynamic> json) {
  return _CanRequest.fromJson(json);
}

/// @nodoc
mixin _$CanRequest {
  @JsonKey(name: 'fbo_name')
  String get fbo => throw _privateConstructorUsedError;
  @JsonKey(name: 'req_date')
  String get reqDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_of_cans')
  int get requestedCans => throw _privateConstructorUsedError;
  @JsonKey(name: 'issued_noof_cans_by_de', defaultValue: 0)
  int get approvedcans => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_deo')
  String? get approvedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejected_deo')
  String? get rejectedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'deo_delivery_date')
  String? get deliveryDate => throw _privateConstructorUsedError;
  @BoolenAPIConverter()
  bool get approve => throw _privateConstructorUsedError;
  @BoolenAPIConverter()
  bool get reject => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CanRequestCopyWith<CanRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CanRequestCopyWith<$Res> {
  factory $CanRequestCopyWith(
          CanRequest value, $Res Function(CanRequest) then) =
      _$CanRequestCopyWithImpl<$Res, CanRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'fbo_name') String fbo,
      @JsonKey(name: 'req_date') String reqDate,
      @JsonKey(name: 'no_of_cans') int requestedCans,
      @JsonKey(name: 'issued_noof_cans_by_de', defaultValue: 0)
      int approvedcans,
      @JsonKey(name: 'approved_deo') String? approvedBy,
      @JsonKey(name: 'rejected_deo') String? rejectedBy,
      @JsonKey(name: 'deo_delivery_date') String? deliveryDate,
      @BoolenAPIConverter() bool approve,
      @BoolenAPIConverter() bool reject});
}

/// @nodoc
class _$CanRequestCopyWithImpl<$Res, $Val extends CanRequest>
    implements $CanRequestCopyWith<$Res> {
  _$CanRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fbo = null,
    Object? reqDate = null,
    Object? requestedCans = null,
    Object? approvedcans = null,
    Object? approvedBy = freezed,
    Object? rejectedBy = freezed,
    Object? deliveryDate = freezed,
    Object? approve = null,
    Object? reject = null,
  }) {
    return _then(_value.copyWith(
      fbo: null == fbo
          ? _value.fbo
          : fbo // ignore: cast_nullable_to_non_nullable
              as String,
      reqDate: null == reqDate
          ? _value.reqDate
          : reqDate // ignore: cast_nullable_to_non_nullable
              as String,
      requestedCans: null == requestedCans
          ? _value.requestedCans
          : requestedCans // ignore: cast_nullable_to_non_nullable
              as int,
      approvedcans: null == approvedcans
          ? _value.approvedcans
          : approvedcans // ignore: cast_nullable_to_non_nullable
              as int,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectedBy: freezed == rejectedBy
          ? _value.rejectedBy
          : rejectedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      approve: null == approve
          ? _value.approve
          : approve // ignore: cast_nullable_to_non_nullable
              as bool,
      reject: null == reject
          ? _value.reject
          : reject // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CanRequestImplCopyWith<$Res>
    implements $CanRequestCopyWith<$Res> {
  factory _$$CanRequestImplCopyWith(
          _$CanRequestImpl value, $Res Function(_$CanRequestImpl) then) =
      __$$CanRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'fbo_name') String fbo,
      @JsonKey(name: 'req_date') String reqDate,
      @JsonKey(name: 'no_of_cans') int requestedCans,
      @JsonKey(name: 'issued_noof_cans_by_de', defaultValue: 0)
      int approvedcans,
      @JsonKey(name: 'approved_deo') String? approvedBy,
      @JsonKey(name: 'rejected_deo') String? rejectedBy,
      @JsonKey(name: 'deo_delivery_date') String? deliveryDate,
      @BoolenAPIConverter() bool approve,
      @BoolenAPIConverter() bool reject});
}

/// @nodoc
class __$$CanRequestImplCopyWithImpl<$Res>
    extends _$CanRequestCopyWithImpl<$Res, _$CanRequestImpl>
    implements _$$CanRequestImplCopyWith<$Res> {
  __$$CanRequestImplCopyWithImpl(
      _$CanRequestImpl _value, $Res Function(_$CanRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fbo = null,
    Object? reqDate = null,
    Object? requestedCans = null,
    Object? approvedcans = null,
    Object? approvedBy = freezed,
    Object? rejectedBy = freezed,
    Object? deliveryDate = freezed,
    Object? approve = null,
    Object? reject = null,
  }) {
    return _then(_$CanRequestImpl(
      fbo: null == fbo
          ? _value.fbo
          : fbo // ignore: cast_nullable_to_non_nullable
              as String,
      reqDate: null == reqDate
          ? _value.reqDate
          : reqDate // ignore: cast_nullable_to_non_nullable
              as String,
      requestedCans: null == requestedCans
          ? _value.requestedCans
          : requestedCans // ignore: cast_nullable_to_non_nullable
              as int,
      approvedcans: null == approvedcans
          ? _value.approvedcans
          : approvedcans // ignore: cast_nullable_to_non_nullable
              as int,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectedBy: freezed == rejectedBy
          ? _value.rejectedBy
          : rejectedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      approve: null == approve
          ? _value.approve
          : approve // ignore: cast_nullable_to_non_nullable
              as bool,
      reject: null == reject
          ? _value.reject
          : reject // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CanRequestImpl implements _CanRequest {
  const _$CanRequestImpl(
      {@JsonKey(name: 'fbo_name') required this.fbo,
      @JsonKey(name: 'req_date') required this.reqDate,
      @JsonKey(name: 'no_of_cans') required this.requestedCans,
      @JsonKey(name: 'issued_noof_cans_by_de', defaultValue: 0)
      required this.approvedcans,
      @JsonKey(name: 'approved_deo') this.approvedBy,
      @JsonKey(name: 'rejected_deo') this.rejectedBy,
      @JsonKey(name: 'deo_delivery_date') this.deliveryDate,
      @BoolenAPIConverter() required this.approve,
      @BoolenAPIConverter() required this.reject});

  factory _$CanRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CanRequestImplFromJson(json);

  @override
  @JsonKey(name: 'fbo_name')
  final String fbo;
  @override
  @JsonKey(name: 'req_date')
  final String reqDate;
  @override
  @JsonKey(name: 'no_of_cans')
  final int requestedCans;
  @override
  @JsonKey(name: 'issued_noof_cans_by_de', defaultValue: 0)
  final int approvedcans;
  @override
  @JsonKey(name: 'approved_deo')
  final String? approvedBy;
  @override
  @JsonKey(name: 'rejected_deo')
  final String? rejectedBy;
  @override
  @JsonKey(name: 'deo_delivery_date')
  final String? deliveryDate;
  @override
  @BoolenAPIConverter()
  final bool approve;
  @override
  @BoolenAPIConverter()
  final bool reject;

  @override
  String toString() {
    return 'CanRequest(fbo: $fbo, reqDate: $reqDate, requestedCans: $requestedCans, approvedcans: $approvedcans, approvedBy: $approvedBy, rejectedBy: $rejectedBy, deliveryDate: $deliveryDate, approve: $approve, reject: $reject)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CanRequestImpl &&
            (identical(other.fbo, fbo) || other.fbo == fbo) &&
            (identical(other.reqDate, reqDate) || other.reqDate == reqDate) &&
            (identical(other.requestedCans, requestedCans) ||
                other.requestedCans == requestedCans) &&
            (identical(other.approvedcans, approvedcans) ||
                other.approvedcans == approvedcans) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.rejectedBy, rejectedBy) ||
                other.rejectedBy == rejectedBy) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.approve, approve) || other.approve == approve) &&
            (identical(other.reject, reject) || other.reject == reject));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fbo, reqDate, requestedCans,
      approvedcans, approvedBy, rejectedBy, deliveryDate, approve, reject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CanRequestImplCopyWith<_$CanRequestImpl> get copyWith =>
      __$$CanRequestImplCopyWithImpl<_$CanRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CanRequestImplToJson(
      this,
    );
  }
}

abstract class _CanRequest implements CanRequest {
  const factory _CanRequest(
      {@JsonKey(name: 'fbo_name') required final String fbo,
      @JsonKey(name: 'req_date') required final String reqDate,
      @JsonKey(name: 'no_of_cans') required final int requestedCans,
      @JsonKey(name: 'issued_noof_cans_by_de', defaultValue: 0)
      required final int approvedcans,
      @JsonKey(name: 'approved_deo') final String? approvedBy,
      @JsonKey(name: 'rejected_deo') final String? rejectedBy,
      @JsonKey(name: 'deo_delivery_date') final String? deliveryDate,
      @BoolenAPIConverter() required final bool approve,
      @BoolenAPIConverter() required final bool reject}) = _$CanRequestImpl;

  factory _CanRequest.fromJson(Map<String, dynamic> json) =
      _$CanRequestImpl.fromJson;

  @override
  @JsonKey(name: 'fbo_name')
  String get fbo;
  @override
  @JsonKey(name: 'req_date')
  String get reqDate;
  @override
  @JsonKey(name: 'no_of_cans')
  int get requestedCans;
  @override
  @JsonKey(name: 'issued_noof_cans_by_de', defaultValue: 0)
  int get approvedcans;
  @override
  @JsonKey(name: 'approved_deo')
  String? get approvedBy;
  @override
  @JsonKey(name: 'rejected_deo')
  String? get rejectedBy;
  @override
  @JsonKey(name: 'deo_delivery_date')
  String? get deliveryDate;
  @override
  @BoolenAPIConverter()
  bool get approve;
  @override
  @BoolenAPIConverter()
  bool get reject;
  @override
  @JsonKey(ignore: true)
  _$$CanRequestImplCopyWith<_$CanRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
