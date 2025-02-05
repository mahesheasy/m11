// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gate_exit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GateExit _$GateExitFromJson(Map<String, dynamic> json) {
  return _GateExits.fromJson(json);
}

/// @nodoc
mixin _$GateExit {
  @JsonKey(name: 'name')
  String get gateExitNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'collection_executive')
  String get executive => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_out_reading')
  double? get vehicleOutReading => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_in_reading')
  double? get vehicleInReading => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_kms')
  double? get actualKms => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_out_reading_photo')
  String? get outReadingImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_in_reading_photo')
  String? get inReadingImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle')
  String? get vehicle => throw _privateConstructorUsedError;
  @BoolenAPIConverter()
  @JsonKey(name: 'is_gate_entry')
  bool get isGateEntry => throw _privateConstructorUsedError;
  @BoolenAPIConverter()
  @JsonKey(name: 'is_gate_exit')
  bool get isGateExit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GateExitCopyWith<GateExit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GateExitCopyWith<$Res> {
  factory $GateExitCopyWith(GateExit value, $Res Function(GateExit) then) =
      _$GateExitCopyWithImpl<$Res, GateExit>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String gateExitNo,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'collection_executive') String executive,
      @JsonKey(name: 'vehicle_out_reading') double? vehicleOutReading,
      @JsonKey(name: 'vehicle_in_reading') double? vehicleInReading,
      @JsonKey(name: 'actual_kms') double? actualKms,
      @JsonKey(name: 'vehicle_out_reading_photo') String? outReadingImage,
      @JsonKey(name: 'vehicle_in_reading_photo') String? inReadingImage,
      @JsonKey(name: 'vehicle') String? vehicle,
      @BoolenAPIConverter() @JsonKey(name: 'is_gate_entry') bool isGateEntry,
      @BoolenAPIConverter() @JsonKey(name: 'is_gate_exit') bool isGateExit});
}

/// @nodoc
class _$GateExitCopyWithImpl<$Res, $Val extends GateExit>
    implements $GateExitCopyWith<$Res> {
  _$GateExitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gateExitNo = null,
    Object? date = freezed,
    Object? executive = null,
    Object? vehicleOutReading = freezed,
    Object? vehicleInReading = freezed,
    Object? actualKms = freezed,
    Object? outReadingImage = freezed,
    Object? inReadingImage = freezed,
    Object? vehicle = freezed,
    Object? isGateEntry = null,
    Object? isGateExit = null,
  }) {
    return _then(_value.copyWith(
      gateExitNo: null == gateExitNo
          ? _value.gateExitNo
          : gateExitNo // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      executive: null == executive
          ? _value.executive
          : executive // ignore: cast_nullable_to_non_nullable
              as String,
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
      outReadingImage: freezed == outReadingImage
          ? _value.outReadingImage
          : outReadingImage // ignore: cast_nullable_to_non_nullable
              as String?,
      inReadingImage: freezed == inReadingImage
          ? _value.inReadingImage
          : inReadingImage // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as String?,
      isGateEntry: null == isGateEntry
          ? _value.isGateEntry
          : isGateEntry // ignore: cast_nullable_to_non_nullable
              as bool,
      isGateExit: null == isGateExit
          ? _value.isGateExit
          : isGateExit // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GateExitsImplCopyWith<$Res>
    implements $GateExitCopyWith<$Res> {
  factory _$$GateExitsImplCopyWith(
          _$GateExitsImpl value, $Res Function(_$GateExitsImpl) then) =
      __$$GateExitsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String gateExitNo,
      @JsonKey(name: 'date') String? date,
      @JsonKey(name: 'collection_executive') String executive,
      @JsonKey(name: 'vehicle_out_reading') double? vehicleOutReading,
      @JsonKey(name: 'vehicle_in_reading') double? vehicleInReading,
      @JsonKey(name: 'actual_kms') double? actualKms,
      @JsonKey(name: 'vehicle_out_reading_photo') String? outReadingImage,
      @JsonKey(name: 'vehicle_in_reading_photo') String? inReadingImage,
      @JsonKey(name: 'vehicle') String? vehicle,
      @BoolenAPIConverter() @JsonKey(name: 'is_gate_entry') bool isGateEntry,
      @BoolenAPIConverter() @JsonKey(name: 'is_gate_exit') bool isGateExit});
}

/// @nodoc
class __$$GateExitsImplCopyWithImpl<$Res>
    extends _$GateExitCopyWithImpl<$Res, _$GateExitsImpl>
    implements _$$GateExitsImplCopyWith<$Res> {
  __$$GateExitsImplCopyWithImpl(
      _$GateExitsImpl _value, $Res Function(_$GateExitsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gateExitNo = null,
    Object? date = freezed,
    Object? executive = null,
    Object? vehicleOutReading = freezed,
    Object? vehicleInReading = freezed,
    Object? actualKms = freezed,
    Object? outReadingImage = freezed,
    Object? inReadingImage = freezed,
    Object? vehicle = freezed,
    Object? isGateEntry = null,
    Object? isGateExit = null,
  }) {
    return _then(_$GateExitsImpl(
      gateExitNo: null == gateExitNo
          ? _value.gateExitNo
          : gateExitNo // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      executive: null == executive
          ? _value.executive
          : executive // ignore: cast_nullable_to_non_nullable
              as String,
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
      outReadingImage: freezed == outReadingImage
          ? _value.outReadingImage
          : outReadingImage // ignore: cast_nullable_to_non_nullable
              as String?,
      inReadingImage: freezed == inReadingImage
          ? _value.inReadingImage
          : inReadingImage // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as String?,
      isGateEntry: null == isGateEntry
          ? _value.isGateEntry
          : isGateEntry // ignore: cast_nullable_to_non_nullable
              as bool,
      isGateExit: null == isGateExit
          ? _value.isGateExit
          : isGateExit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GateExitsImpl implements _GateExits {
  _$GateExitsImpl(
      {@JsonKey(name: 'name') required this.gateExitNo,
      @JsonKey(name: 'date') this.date,
      @JsonKey(name: 'collection_executive') required this.executive,
      @JsonKey(name: 'vehicle_out_reading') this.vehicleOutReading,
      @JsonKey(name: 'vehicle_in_reading') this.vehicleInReading,
      @JsonKey(name: 'actual_kms') this.actualKms,
      @JsonKey(name: 'vehicle_out_reading_photo') this.outReadingImage,
      @JsonKey(name: 'vehicle_in_reading_photo') this.inReadingImage,
      @JsonKey(name: 'vehicle') required this.vehicle,
      @BoolenAPIConverter()
      @JsonKey(name: 'is_gate_entry')
      required this.isGateEntry,
      @BoolenAPIConverter()
      @JsonKey(name: 'is_gate_exit')
      required this.isGateExit});

  factory _$GateExitsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GateExitsImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String gateExitNo;
  @override
  @JsonKey(name: 'date')
  final String? date;
  @override
  @JsonKey(name: 'collection_executive')
  final String executive;
  @override
  @JsonKey(name: 'vehicle_out_reading')
  final double? vehicleOutReading;
  @override
  @JsonKey(name: 'vehicle_in_reading')
  final double? vehicleInReading;
  @override
  @JsonKey(name: 'actual_kms')
  final double? actualKms;
  @override
  @JsonKey(name: 'vehicle_out_reading_photo')
  final String? outReadingImage;
  @override
  @JsonKey(name: 'vehicle_in_reading_photo')
  final String? inReadingImage;
  @override
  @JsonKey(name: 'vehicle')
  final String? vehicle;
  @override
  @BoolenAPIConverter()
  @JsonKey(name: 'is_gate_entry')
  final bool isGateEntry;
  @override
  @BoolenAPIConverter()
  @JsonKey(name: 'is_gate_exit')
  final bool isGateExit;

  @override
  String toString() {
    return 'GateExit(gateExitNo: $gateExitNo, date: $date, executive: $executive, vehicleOutReading: $vehicleOutReading, vehicleInReading: $vehicleInReading, actualKms: $actualKms, outReadingImage: $outReadingImage, inReadingImage: $inReadingImage, vehicle: $vehicle, isGateEntry: $isGateEntry, isGateExit: $isGateExit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GateExitsImpl &&
            (identical(other.gateExitNo, gateExitNo) ||
                other.gateExitNo == gateExitNo) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.executive, executive) ||
                other.executive == executive) &&
            (identical(other.vehicleOutReading, vehicleOutReading) ||
                other.vehicleOutReading == vehicleOutReading) &&
            (identical(other.vehicleInReading, vehicleInReading) ||
                other.vehicleInReading == vehicleInReading) &&
            (identical(other.actualKms, actualKms) ||
                other.actualKms == actualKms) &&
            (identical(other.outReadingImage, outReadingImage) ||
                other.outReadingImage == outReadingImage) &&
            (identical(other.inReadingImage, inReadingImage) ||
                other.inReadingImage == inReadingImage) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.isGateEntry, isGateEntry) ||
                other.isGateEntry == isGateEntry) &&
            (identical(other.isGateExit, isGateExit) ||
                other.isGateExit == isGateExit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gateExitNo,
      date,
      executive,
      vehicleOutReading,
      vehicleInReading,
      actualKms,
      outReadingImage,
      inReadingImage,
      vehicle,
      isGateEntry,
      isGateExit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GateExitsImplCopyWith<_$GateExitsImpl> get copyWith =>
      __$$GateExitsImplCopyWithImpl<_$GateExitsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GateExitsImplToJson(
      this,
    );
  }
}

abstract class _GateExits implements GateExit {
  factory _GateExits(
      {@JsonKey(name: 'name') required final String gateExitNo,
      @JsonKey(name: 'date') final String? date,
      @JsonKey(name: 'collection_executive') required final String executive,
      @JsonKey(name: 'vehicle_out_reading') final double? vehicleOutReading,
      @JsonKey(name: 'vehicle_in_reading') final double? vehicleInReading,
      @JsonKey(name: 'actual_kms') final double? actualKms,
      @JsonKey(name: 'vehicle_out_reading_photo') final String? outReadingImage,
      @JsonKey(name: 'vehicle_in_reading_photo') final String? inReadingImage,
      @JsonKey(name: 'vehicle') required final String? vehicle,
      @BoolenAPIConverter()
      @JsonKey(name: 'is_gate_entry')
      required final bool isGateEntry,
      @BoolenAPIConverter()
      @JsonKey(name: 'is_gate_exit')
      required final bool isGateExit}) = _$GateExitsImpl;

  factory _GateExits.fromJson(Map<String, dynamic> json) =
      _$GateExitsImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get gateExitNo;
  @override
  @JsonKey(name: 'date')
  String? get date;
  @override
  @JsonKey(name: 'collection_executive')
  String get executive;
  @override
  @JsonKey(name: 'vehicle_out_reading')
  double? get vehicleOutReading;
  @override
  @JsonKey(name: 'vehicle_in_reading')
  double? get vehicleInReading;
  @override
  @JsonKey(name: 'actual_kms')
  double? get actualKms;
  @override
  @JsonKey(name: 'vehicle_out_reading_photo')
  String? get outReadingImage;
  @override
  @JsonKey(name: 'vehicle_in_reading_photo')
  String? get inReadingImage;
  @override
  @JsonKey(name: 'vehicle')
  String? get vehicle;
  @override
  @BoolenAPIConverter()
  @JsonKey(name: 'is_gate_entry')
  bool get isGateEntry;
  @override
  @BoolenAPIConverter()
  @JsonKey(name: 'is_gate_exit')
  bool get isGateExit;
  @override
  @JsonKey(ignore: true)
  _$$GateExitsImplCopyWith<_$GateExitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
