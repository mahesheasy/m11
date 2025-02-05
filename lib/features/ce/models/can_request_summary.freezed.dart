// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'can_request_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CanRequestSummary _$CanRequestSummaryFromJson(Map<String, dynamic> json) {
  return _CanRequestSummary.fromJson(json);
}

/// @nodoc
mixin _$CanRequestSummary {
  @JsonKey(name: 'fbo_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_of_cans_approved', defaultValue: 0)
  int get noOfCans => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_purchase_date')
  String? get lastPurchaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_purchase_rate', defaultValue: 0.0)
  double? get lastPurchaseRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_purchase_weight', defaultValue: 0.0)
  double? get lastPurchaseWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_cans_issued')
  String? get cansIssuedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CanRequestSummaryCopyWith<CanRequestSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CanRequestSummaryCopyWith<$Res> {
  factory $CanRequestSummaryCopyWith(
          CanRequestSummary value, $Res Function(CanRequestSummary) then) =
      _$CanRequestSummaryCopyWithImpl<$Res, CanRequestSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'fbo_name') String name,
      @JsonKey(name: 'no_of_cans_approved', defaultValue: 0) int noOfCans,
      @JsonKey(name: 'last_purchase_date') String? lastPurchaseDate,
      @JsonKey(name: 'last_purchase_rate', defaultValue: 0.0)
      double? lastPurchaseRate,
      @JsonKey(name: 'last_purchase_weight', defaultValue: 0.0)
      double? lastPurchaseWeight,
      @JsonKey(name: 'date_of_cans_issued') String? cansIssuedDate});
}

/// @nodoc
class _$CanRequestSummaryCopyWithImpl<$Res, $Val extends CanRequestSummary>
    implements $CanRequestSummaryCopyWith<$Res> {
  _$CanRequestSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? noOfCans = null,
    Object? lastPurchaseDate = freezed,
    Object? lastPurchaseRate = freezed,
    Object? lastPurchaseWeight = freezed,
    Object? cansIssuedDate = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      noOfCans: null == noOfCans
          ? _value.noOfCans
          : noOfCans // ignore: cast_nullable_to_non_nullable
              as int,
      lastPurchaseDate: freezed == lastPurchaseDate
          ? _value.lastPurchaseDate
          : lastPurchaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastPurchaseRate: freezed == lastPurchaseRate
          ? _value.lastPurchaseRate
          : lastPurchaseRate // ignore: cast_nullable_to_non_nullable
              as double?,
      lastPurchaseWeight: freezed == lastPurchaseWeight
          ? _value.lastPurchaseWeight
          : lastPurchaseWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      cansIssuedDate: freezed == cansIssuedDate
          ? _value.cansIssuedDate
          : cansIssuedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CanRequestSummaryImplCopyWith<$Res>
    implements $CanRequestSummaryCopyWith<$Res> {
  factory _$$CanRequestSummaryImplCopyWith(_$CanRequestSummaryImpl value,
          $Res Function(_$CanRequestSummaryImpl) then) =
      __$$CanRequestSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'fbo_name') String name,
      @JsonKey(name: 'no_of_cans_approved', defaultValue: 0) int noOfCans,
      @JsonKey(name: 'last_purchase_date') String? lastPurchaseDate,
      @JsonKey(name: 'last_purchase_rate', defaultValue: 0.0)
      double? lastPurchaseRate,
      @JsonKey(name: 'last_purchase_weight', defaultValue: 0.0)
      double? lastPurchaseWeight,
      @JsonKey(name: 'date_of_cans_issued') String? cansIssuedDate});
}

/// @nodoc
class __$$CanRequestSummaryImplCopyWithImpl<$Res>
    extends _$CanRequestSummaryCopyWithImpl<$Res, _$CanRequestSummaryImpl>
    implements _$$CanRequestSummaryImplCopyWith<$Res> {
  __$$CanRequestSummaryImplCopyWithImpl(_$CanRequestSummaryImpl _value,
      $Res Function(_$CanRequestSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? noOfCans = null,
    Object? lastPurchaseDate = freezed,
    Object? lastPurchaseRate = freezed,
    Object? lastPurchaseWeight = freezed,
    Object? cansIssuedDate = freezed,
  }) {
    return _then(_$CanRequestSummaryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      noOfCans: null == noOfCans
          ? _value.noOfCans
          : noOfCans // ignore: cast_nullable_to_non_nullable
              as int,
      lastPurchaseDate: freezed == lastPurchaseDate
          ? _value.lastPurchaseDate
          : lastPurchaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastPurchaseRate: freezed == lastPurchaseRate
          ? _value.lastPurchaseRate
          : lastPurchaseRate // ignore: cast_nullable_to_non_nullable
              as double?,
      lastPurchaseWeight: freezed == lastPurchaseWeight
          ? _value.lastPurchaseWeight
          : lastPurchaseWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      cansIssuedDate: freezed == cansIssuedDate
          ? _value.cansIssuedDate
          : cansIssuedDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CanRequestSummaryImpl implements _CanRequestSummary {
  _$CanRequestSummaryImpl(
      {@JsonKey(name: 'fbo_name') required this.name,
      @JsonKey(name: 'no_of_cans_approved', defaultValue: 0)
      required this.noOfCans,
      @JsonKey(name: 'last_purchase_date') this.lastPurchaseDate,
      @JsonKey(name: 'last_purchase_rate', defaultValue: 0.0)
      this.lastPurchaseRate,
      @JsonKey(name: 'last_purchase_weight', defaultValue: 0.0)
      this.lastPurchaseWeight,
      @JsonKey(name: 'date_of_cans_issued') this.cansIssuedDate});

  factory _$CanRequestSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CanRequestSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'fbo_name')
  final String name;
  @override
  @JsonKey(name: 'no_of_cans_approved', defaultValue: 0)
  final int noOfCans;
  @override
  @JsonKey(name: 'last_purchase_date')
  final String? lastPurchaseDate;
  @override
  @JsonKey(name: 'last_purchase_rate', defaultValue: 0.0)
  final double? lastPurchaseRate;
  @override
  @JsonKey(name: 'last_purchase_weight', defaultValue: 0.0)
  final double? lastPurchaseWeight;
  @override
  @JsonKey(name: 'date_of_cans_issued')
  final String? cansIssuedDate;

  @override
  String toString() {
    return 'CanRequestSummary(name: $name, noOfCans: $noOfCans, lastPurchaseDate: $lastPurchaseDate, lastPurchaseRate: $lastPurchaseRate, lastPurchaseWeight: $lastPurchaseWeight, cansIssuedDate: $cansIssuedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CanRequestSummaryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.noOfCans, noOfCans) ||
                other.noOfCans == noOfCans) &&
            (identical(other.lastPurchaseDate, lastPurchaseDate) ||
                other.lastPurchaseDate == lastPurchaseDate) &&
            (identical(other.lastPurchaseRate, lastPurchaseRate) ||
                other.lastPurchaseRate == lastPurchaseRate) &&
            (identical(other.lastPurchaseWeight, lastPurchaseWeight) ||
                other.lastPurchaseWeight == lastPurchaseWeight) &&
            (identical(other.cansIssuedDate, cansIssuedDate) ||
                other.cansIssuedDate == cansIssuedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, noOfCans, lastPurchaseDate,
      lastPurchaseRate, lastPurchaseWeight, cansIssuedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CanRequestSummaryImplCopyWith<_$CanRequestSummaryImpl> get copyWith =>
      __$$CanRequestSummaryImplCopyWithImpl<_$CanRequestSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CanRequestSummaryImplToJson(
      this,
    );
  }
}

abstract class _CanRequestSummary implements CanRequestSummary {
  factory _CanRequestSummary(
          {@JsonKey(name: 'fbo_name') required final String name,
          @JsonKey(name: 'no_of_cans_approved', defaultValue: 0)
          required final int noOfCans,
          @JsonKey(name: 'last_purchase_date') final String? lastPurchaseDate,
          @JsonKey(name: 'last_purchase_rate', defaultValue: 0.0)
          final double? lastPurchaseRate,
          @JsonKey(name: 'last_purchase_weight', defaultValue: 0.0)
          final double? lastPurchaseWeight,
          @JsonKey(name: 'date_of_cans_issued') final String? cansIssuedDate}) =
      _$CanRequestSummaryImpl;

  factory _CanRequestSummary.fromJson(Map<String, dynamic> json) =
      _$CanRequestSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'fbo_name')
  String get name;
  @override
  @JsonKey(name: 'no_of_cans_approved', defaultValue: 0)
  int get noOfCans;
  @override
  @JsonKey(name: 'last_purchase_date')
  String? get lastPurchaseDate;
  @override
  @JsonKey(name: 'last_purchase_rate', defaultValue: 0.0)
  double? get lastPurchaseRate;
  @override
  @JsonKey(name: 'last_purchase_weight', defaultValue: 0.0)
  double? get lastPurchaseWeight;
  @override
  @JsonKey(name: 'date_of_cans_issued')
  String? get cansIssuedDate;
  @override
  @JsonKey(ignore: true)
  _$$CanRequestSummaryImplCopyWith<_$CanRequestSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
