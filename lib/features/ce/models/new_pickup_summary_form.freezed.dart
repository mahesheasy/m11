// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_pickup_summary_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewPickUpSummaryForm _$NewPickUpSummaryFormFromJson(Map<String, dynamic> json) {
  return _NewPickUpSummary.fromJson(json);
}

/// @nodoc
mixin _$NewPickUpSummaryForm {
  @JsonKey(includeToJson: false)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_weight', defaultValue: 0.0)
  double? get totalWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'empty_can_weight', defaultValue: 0.0)
  double? get emptyCanWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'net_weight', defaultValue: 0.0)
  double? get netWeight => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false, includeToJson: false)
  bool get isProcessed => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false, includeToJson: false)
  bool get isFileCaptured => throw _privateConstructorUsedError;
  @JsonKey(
      includeIfNull: false,
      toJson: toNull,
      fromJson: toNull,
      includeToJson: false)
  File? get canWeightImg => throw _privateConstructorUsedError;
  @JsonKey(
      includeIfNull: false,
      toJson: toNull,
      fromJson: toNull,
      includeToJson: false)
  File? get emptyCanWeightImg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewPickUpSummaryFormCopyWith<NewPickUpSummaryForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPickUpSummaryFormCopyWith<$Res> {
  factory $NewPickUpSummaryFormCopyWith(NewPickUpSummaryForm value,
          $Res Function(NewPickUpSummaryForm) then) =
      _$NewPickUpSummaryFormCopyWithImpl<$Res, NewPickUpSummaryForm>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int id,
      @JsonKey(name: 'total_weight', defaultValue: 0.0) double? totalWeight,
      @JsonKey(name: 'empty_can_weight', defaultValue: 0.0)
      double? emptyCanWeight,
      @JsonKey(name: 'net_weight', defaultValue: 0.0) double? netWeight,
      @JsonKey(defaultValue: false, includeToJson: false) bool isProcessed,
      @JsonKey(defaultValue: false, includeToJson: false) bool isFileCaptured,
      @JsonKey(
          includeIfNull: false,
          toJson: toNull,
          fromJson: toNull,
          includeToJson: false)
      File? canWeightImg,
      @JsonKey(
          includeIfNull: false,
          toJson: toNull,
          fromJson: toNull,
          includeToJson: false)
      File? emptyCanWeightImg});
}

/// @nodoc
class _$NewPickUpSummaryFormCopyWithImpl<$Res,
        $Val extends NewPickUpSummaryForm>
    implements $NewPickUpSummaryFormCopyWith<$Res> {
  _$NewPickUpSummaryFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalWeight = freezed,
    Object? emptyCanWeight = freezed,
    Object? netWeight = freezed,
    Object? isProcessed = null,
    Object? isFileCaptured = null,
    Object? canWeightImg = freezed,
    Object? emptyCanWeightImg = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      totalWeight: freezed == totalWeight
          ? _value.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      emptyCanWeight: freezed == emptyCanWeight
          ? _value.emptyCanWeight
          : emptyCanWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      netWeight: freezed == netWeight
          ? _value.netWeight
          : netWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      isProcessed: null == isProcessed
          ? _value.isProcessed
          : isProcessed // ignore: cast_nullable_to_non_nullable
              as bool,
      isFileCaptured: null == isFileCaptured
          ? _value.isFileCaptured
          : isFileCaptured // ignore: cast_nullable_to_non_nullable
              as bool,
      canWeightImg: freezed == canWeightImg
          ? _value.canWeightImg
          : canWeightImg // ignore: cast_nullable_to_non_nullable
              as File?,
      emptyCanWeightImg: freezed == emptyCanWeightImg
          ? _value.emptyCanWeightImg
          : emptyCanWeightImg // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewPickUpSummaryImplCopyWith<$Res>
    implements $NewPickUpSummaryFormCopyWith<$Res> {
  factory _$$NewPickUpSummaryImplCopyWith(_$NewPickUpSummaryImpl value,
          $Res Function(_$NewPickUpSummaryImpl) then) =
      __$$NewPickUpSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int id,
      @JsonKey(name: 'total_weight', defaultValue: 0.0) double? totalWeight,
      @JsonKey(name: 'empty_can_weight', defaultValue: 0.0)
      double? emptyCanWeight,
      @JsonKey(name: 'net_weight', defaultValue: 0.0) double? netWeight,
      @JsonKey(defaultValue: false, includeToJson: false) bool isProcessed,
      @JsonKey(defaultValue: false, includeToJson: false) bool isFileCaptured,
      @JsonKey(
          includeIfNull: false,
          toJson: toNull,
          fromJson: toNull,
          includeToJson: false)
      File? canWeightImg,
      @JsonKey(
          includeIfNull: false,
          toJson: toNull,
          fromJson: toNull,
          includeToJson: false)
      File? emptyCanWeightImg});
}

/// @nodoc
class __$$NewPickUpSummaryImplCopyWithImpl<$Res>
    extends _$NewPickUpSummaryFormCopyWithImpl<$Res, _$NewPickUpSummaryImpl>
    implements _$$NewPickUpSummaryImplCopyWith<$Res> {
  __$$NewPickUpSummaryImplCopyWithImpl(_$NewPickUpSummaryImpl _value,
      $Res Function(_$NewPickUpSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalWeight = freezed,
    Object? emptyCanWeight = freezed,
    Object? netWeight = freezed,
    Object? isProcessed = null,
    Object? isFileCaptured = null,
    Object? canWeightImg = freezed,
    Object? emptyCanWeightImg = freezed,
  }) {
    return _then(_$NewPickUpSummaryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      totalWeight: freezed == totalWeight
          ? _value.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      emptyCanWeight: freezed == emptyCanWeight
          ? _value.emptyCanWeight
          : emptyCanWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      netWeight: freezed == netWeight
          ? _value.netWeight
          : netWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      isProcessed: null == isProcessed
          ? _value.isProcessed
          : isProcessed // ignore: cast_nullable_to_non_nullable
              as bool,
      isFileCaptured: null == isFileCaptured
          ? _value.isFileCaptured
          : isFileCaptured // ignore: cast_nullable_to_non_nullable
              as bool,
      canWeightImg: freezed == canWeightImg
          ? _value.canWeightImg
          : canWeightImg // ignore: cast_nullable_to_non_nullable
              as File?,
      emptyCanWeightImg: freezed == emptyCanWeightImg
          ? _value.emptyCanWeightImg
          : emptyCanWeightImg // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewPickUpSummaryImpl implements _NewPickUpSummary {
  _$NewPickUpSummaryImpl(
      {@JsonKey(includeToJson: false) required this.id,
      @JsonKey(name: 'total_weight', defaultValue: 0.0) this.totalWeight,
      @JsonKey(name: 'empty_can_weight', defaultValue: 0.0) this.emptyCanWeight,
      @JsonKey(name: 'net_weight', defaultValue: 0.0) this.netWeight,
      @JsonKey(defaultValue: false, includeToJson: false)
      required this.isProcessed,
      @JsonKey(defaultValue: false, includeToJson: false)
      required this.isFileCaptured,
      @JsonKey(
          includeIfNull: false,
          toJson: toNull,
          fromJson: toNull,
          includeToJson: false)
      this.canWeightImg,
      @JsonKey(
          includeIfNull: false,
          toJson: toNull,
          fromJson: toNull,
          includeToJson: false)
      this.emptyCanWeightImg});

  factory _$NewPickUpSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewPickUpSummaryImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final int id;
  @override
  @JsonKey(name: 'total_weight', defaultValue: 0.0)
  final double? totalWeight;
  @override
  @JsonKey(name: 'empty_can_weight', defaultValue: 0.0)
  final double? emptyCanWeight;
  @override
  @JsonKey(name: 'net_weight', defaultValue: 0.0)
  final double? netWeight;
  @override
  @JsonKey(defaultValue: false, includeToJson: false)
  final bool isProcessed;
  @override
  @JsonKey(defaultValue: false, includeToJson: false)
  final bool isFileCaptured;
  @override
  @JsonKey(
      includeIfNull: false,
      toJson: toNull,
      fromJson: toNull,
      includeToJson: false)
  final File? canWeightImg;
  @override
  @JsonKey(
      includeIfNull: false,
      toJson: toNull,
      fromJson: toNull,
      includeToJson: false)
  final File? emptyCanWeightImg;

  @override
  String toString() {
    return 'NewPickUpSummaryForm(id: $id, totalWeight: $totalWeight, emptyCanWeight: $emptyCanWeight, netWeight: $netWeight, isProcessed: $isProcessed, isFileCaptured: $isFileCaptured, canWeightImg: $canWeightImg, emptyCanWeightImg: $emptyCanWeightImg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewPickUpSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalWeight, totalWeight) ||
                other.totalWeight == totalWeight) &&
            (identical(other.emptyCanWeight, emptyCanWeight) ||
                other.emptyCanWeight == emptyCanWeight) &&
            (identical(other.netWeight, netWeight) ||
                other.netWeight == netWeight) &&
            (identical(other.isProcessed, isProcessed) ||
                other.isProcessed == isProcessed) &&
            (identical(other.isFileCaptured, isFileCaptured) ||
                other.isFileCaptured == isFileCaptured) &&
            (identical(other.canWeightImg, canWeightImg) ||
                other.canWeightImg == canWeightImg) &&
            (identical(other.emptyCanWeightImg, emptyCanWeightImg) ||
                other.emptyCanWeightImg == emptyCanWeightImg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, totalWeight, emptyCanWeight,
      netWeight, isProcessed, isFileCaptured, canWeightImg, emptyCanWeightImg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewPickUpSummaryImplCopyWith<_$NewPickUpSummaryImpl> get copyWith =>
      __$$NewPickUpSummaryImplCopyWithImpl<_$NewPickUpSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewPickUpSummaryImplToJson(
      this,
    );
  }
}

abstract class _NewPickUpSummary implements NewPickUpSummaryForm {
  factory _NewPickUpSummary(
      {@JsonKey(includeToJson: false) required final int id,
      @JsonKey(name: 'total_weight', defaultValue: 0.0)
      final double? totalWeight,
      @JsonKey(name: 'empty_can_weight', defaultValue: 0.0)
      final double? emptyCanWeight,
      @JsonKey(name: 'net_weight', defaultValue: 0.0) final double? netWeight,
      @JsonKey(defaultValue: false, includeToJson: false)
      required final bool isProcessed,
      @JsonKey(defaultValue: false, includeToJson: false)
      required final bool isFileCaptured,
      @JsonKey(
          includeIfNull: false,
          toJson: toNull,
          fromJson: toNull,
          includeToJson: false)
      final File? canWeightImg,
      @JsonKey(
          includeIfNull: false,
          toJson: toNull,
          fromJson: toNull,
          includeToJson: false)
      final File? emptyCanWeightImg}) = _$NewPickUpSummaryImpl;

  factory _NewPickUpSummary.fromJson(Map<String, dynamic> json) =
      _$NewPickUpSummaryImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  int get id;
  @override
  @JsonKey(name: 'total_weight', defaultValue: 0.0)
  double? get totalWeight;
  @override
  @JsonKey(name: 'empty_can_weight', defaultValue: 0.0)
  double? get emptyCanWeight;
  @override
  @JsonKey(name: 'net_weight', defaultValue: 0.0)
  double? get netWeight;
  @override
  @JsonKey(defaultValue: false, includeToJson: false)
  bool get isProcessed;
  @override
  @JsonKey(defaultValue: false, includeToJson: false)
  bool get isFileCaptured;
  @override
  @JsonKey(
      includeIfNull: false,
      toJson: toNull,
      fromJson: toNull,
      includeToJson: false)
  File? get canWeightImg;
  @override
  @JsonKey(
      includeIfNull: false,
      toJson: toNull,
      fromJson: toNull,
      includeToJson: false)
  File? get emptyCanWeightImg;
  @override
  @JsonKey(ignore: true)
  _$$NewPickUpSummaryImplCopyWith<_$NewPickUpSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
