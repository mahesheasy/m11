// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gate_entry_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GateEntryForm _$GateEntryFormFromJson(Map<String, dynamic> json) {
  return _GateEntryForm.fromJson(json);
}

/// @nodoc
mixin _$GateEntryForm {
  @JsonKey(name: 'vehicle_track_id')
  String? get vehicleTrackId => throw _privateConstructorUsedError;
  double? get vehicleOutReading => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_in_reading')
  double? get vehicleInReading => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_kms')
  double? get actualKms => throw _privateConstructorUsedError;
  @JsonKey(
      includeIfNull: false,
      toJson: toNull,
      fromJson: toNull,
      includeToJson: false)
  File? get odoMeter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GateEntryFormCopyWith<GateEntryForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GateEntryFormCopyWith<$Res> {
  factory $GateEntryFormCopyWith(
          GateEntryForm value, $Res Function(GateEntryForm) then) =
      _$GateEntryFormCopyWithImpl<$Res, GateEntryForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'vehicle_track_id') String? vehicleTrackId,
      double? vehicleOutReading,
      @JsonKey(name: 'vehicle_in_reading') double? vehicleInReading,
      @JsonKey(name: 'actual_kms') double? actualKms,
      @JsonKey(
          includeIfNull: false,
          toJson: toNull,
          fromJson: toNull,
          includeToJson: false)
      File? odoMeter});
}

/// @nodoc
class _$GateEntryFormCopyWithImpl<$Res, $Val extends GateEntryForm>
    implements $GateEntryFormCopyWith<$Res> {
  _$GateEntryFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleTrackId = freezed,
    Object? vehicleOutReading = freezed,
    Object? vehicleInReading = freezed,
    Object? actualKms = freezed,
    Object? odoMeter = freezed,
  }) {
    return _then(_value.copyWith(
      vehicleTrackId: freezed == vehicleTrackId
          ? _value.vehicleTrackId
          : vehicleTrackId // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleOutReading: freezed == vehicleOutReading
          ? _value.vehicleOutReading
          : vehicleOutReading // ignore: cast_nullable_to_non_nullable
              as double?,
      vehicleInReading: freezed == vehicleInReading
          ? _value.vehicleInReading
          : vehicleInReading // ignore: cast_nullable_to_non_nullable
              as double?,
      actualKms: freezed == actualKms
          ? _value.actualKms
          : actualKms // ignore: cast_nullable_to_non_nullable
              as double?,
      odoMeter: freezed == odoMeter
          ? _value.odoMeter
          : odoMeter // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GateEntryFormImplCopyWith<$Res>
    implements $GateEntryFormCopyWith<$Res> {
  factory _$$GateEntryFormImplCopyWith(
          _$GateEntryFormImpl value, $Res Function(_$GateEntryFormImpl) then) =
      __$$GateEntryFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'vehicle_track_id') String? vehicleTrackId,
      double? vehicleOutReading,
      @JsonKey(name: 'vehicle_in_reading') double? vehicleInReading,
      @JsonKey(name: 'actual_kms') double? actualKms,
      @JsonKey(
          includeIfNull: false,
          toJson: toNull,
          fromJson: toNull,
          includeToJson: false)
      File? odoMeter});
}

/// @nodoc
class __$$GateEntryFormImplCopyWithImpl<$Res>
    extends _$GateEntryFormCopyWithImpl<$Res, _$GateEntryFormImpl>
    implements _$$GateEntryFormImplCopyWith<$Res> {
  __$$GateEntryFormImplCopyWithImpl(
      _$GateEntryFormImpl _value, $Res Function(_$GateEntryFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleTrackId = freezed,
    Object? vehicleOutReading = freezed,
    Object? vehicleInReading = freezed,
    Object? actualKms = freezed,
    Object? odoMeter = freezed,
  }) {
    return _then(_$GateEntryFormImpl(
      vehicleTrackId: freezed == vehicleTrackId
          ? _value.vehicleTrackId
          : vehicleTrackId // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleOutReading: freezed == vehicleOutReading
          ? _value.vehicleOutReading
          : vehicleOutReading // ignore: cast_nullable_to_non_nullable
              as double?,
      vehicleInReading: freezed == vehicleInReading
          ? _value.vehicleInReading
          : vehicleInReading // ignore: cast_nullable_to_non_nullable
              as double?,
      actualKms: freezed == actualKms
          ? _value.actualKms
          : actualKms // ignore: cast_nullable_to_non_nullable
              as double?,
      odoMeter: freezed == odoMeter
          ? _value.odoMeter
          : odoMeter // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GateEntryFormImpl implements _GateEntryForm {
  _$GateEntryFormImpl(
      {@JsonKey(name: 'vehicle_track_id') this.vehicleTrackId,
      this.vehicleOutReading,
      @JsonKey(name: 'vehicle_in_reading') this.vehicleInReading,
      @JsonKey(name: 'actual_kms') this.actualKms,
      @JsonKey(
          includeIfNull: false,
          toJson: toNull,
          fromJson: toNull,
          includeToJson: false)
      this.odoMeter});

  factory _$GateEntryFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$GateEntryFormImplFromJson(json);

  @override
  @JsonKey(name: 'vehicle_track_id')
  final String? vehicleTrackId;
  @override
  final double? vehicleOutReading;
  @override
  @JsonKey(name: 'vehicle_in_reading')
  final double? vehicleInReading;
  @override
  @JsonKey(name: 'actual_kms')
  final double? actualKms;
  @override
  @JsonKey(
      includeIfNull: false,
      toJson: toNull,
      fromJson: toNull,
      includeToJson: false)
  final File? odoMeter;

  @override
  String toString() {
    return 'GateEntryForm(vehicleTrackId: $vehicleTrackId, vehicleOutReading: $vehicleOutReading, vehicleInReading: $vehicleInReading, actualKms: $actualKms, odoMeter: $odoMeter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GateEntryFormImpl &&
            (identical(other.vehicleTrackId, vehicleTrackId) ||
                other.vehicleTrackId == vehicleTrackId) &&
            (identical(other.vehicleOutReading, vehicleOutReading) ||
                other.vehicleOutReading == vehicleOutReading) &&
            (identical(other.vehicleInReading, vehicleInReading) ||
                other.vehicleInReading == vehicleInReading) &&
            (identical(other.actualKms, actualKms) ||
                other.actualKms == actualKms) &&
            (identical(other.odoMeter, odoMeter) ||
                other.odoMeter == odoMeter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, vehicleTrackId,
      vehicleOutReading, vehicleInReading, actualKms, odoMeter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GateEntryFormImplCopyWith<_$GateEntryFormImpl> get copyWith =>
      __$$GateEntryFormImplCopyWithImpl<_$GateEntryFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GateEntryFormImplToJson(
      this,
    );
  }
}

abstract class _GateEntryForm implements GateEntryForm {
  factory _GateEntryForm(
      {@JsonKey(name: 'vehicle_track_id') final String? vehicleTrackId,
      final double? vehicleOutReading,
      @JsonKey(name: 'vehicle_in_reading') final double? vehicleInReading,
      @JsonKey(name: 'actual_kms') final double? actualKms,
      @JsonKey(
          includeIfNull: false,
          toJson: toNull,
          fromJson: toNull,
          includeToJson: false)
      final File? odoMeter}) = _$GateEntryFormImpl;

  factory _GateEntryForm.fromJson(Map<String, dynamic> json) =
      _$GateEntryFormImpl.fromJson;

  @override
  @JsonKey(name: 'vehicle_track_id')
  String? get vehicleTrackId;
  @override
  double? get vehicleOutReading;
  @override
  @JsonKey(name: 'vehicle_in_reading')
  double? get vehicleInReading;
  @override
  @JsonKey(name: 'actual_kms')
  double? get actualKms;
  @override
  @JsonKey(
      includeIfNull: false,
      toJson: toNull,
      fromJson: toNull,
      includeToJson: false)
  File? get odoMeter;
  @override
  @JsonKey(ignore: true)
  _$$GateEntryFormImplCopyWith<_$GateEntryFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
