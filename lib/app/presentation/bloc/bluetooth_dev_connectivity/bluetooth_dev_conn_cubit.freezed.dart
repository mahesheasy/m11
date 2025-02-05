// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_dev_conn_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BluetoothDevConState {
  BluetoothAdapterState get adapterState => throw _privateConstructorUsedError;
  List<BluetoothDevice> get devices => throw _privateConstructorUsedError;
  BluetoothDevice? get device => throw _privateConstructorUsedError;
  BluetoothConnectionState get connectionState =>
      throw _privateConstructorUsedError;
  ScanningState? get scanningState => throw _privateConstructorUsedError;
  List<BluetoothService> get services => throw _privateConstructorUsedError;
  BluetoothCharacteristic? get characteristic =>
      throw _privateConstructorUsedError;
  List<int> get value => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  String? get info => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothDevConStateCopyWith<BluetoothDevConState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothDevConStateCopyWith<$Res> {
  factory $BluetoothDevConStateCopyWith(BluetoothDevConState value,
          $Res Function(BluetoothDevConState) then) =
      _$BluetoothDevConStateCopyWithImpl<$Res, BluetoothDevConState>;
  @useResult
  $Res call(
      {BluetoothAdapterState adapterState,
      List<BluetoothDevice> devices,
      BluetoothDevice? device,
      BluetoothConnectionState connectionState,
      ScanningState? scanningState,
      List<BluetoothService> services,
      BluetoothCharacteristic? characteristic,
      List<int> value,
      Failure? error,
      String? info});

  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$BluetoothDevConStateCopyWithImpl<$Res,
        $Val extends BluetoothDevConState>
    implements $BluetoothDevConStateCopyWith<$Res> {
  _$BluetoothDevConStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adapterState = null,
    Object? devices = null,
    Object? device = freezed,
    Object? connectionState = null,
    Object? scanningState = freezed,
    Object? services = null,
    Object? characteristic = freezed,
    Object? value = null,
    Object? error = freezed,
    Object? info = freezed,
  }) {
    return _then(_value.copyWith(
      adapterState: null == adapterState
          ? _value.adapterState
          : adapterState // ignore: cast_nullable_to_non_nullable
              as BluetoothAdapterState,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<BluetoothDevice>,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice?,
      connectionState: null == connectionState
          ? _value.connectionState
          : connectionState // ignore: cast_nullable_to_non_nullable
              as BluetoothConnectionState,
      scanningState: freezed == scanningState
          ? _value.scanningState
          : scanningState // ignore: cast_nullable_to_non_nullable
              as ScanningState?,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<BluetoothService>,
      characteristic: freezed == characteristic
          ? _value.characteristic
          : characteristic // ignore: cast_nullable_to_non_nullable
              as BluetoothCharacteristic?,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<int>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BluetoothDevConStateImplCopyWith<$Res>
    implements $BluetoothDevConStateCopyWith<$Res> {
  factory _$$BluetoothDevConStateImplCopyWith(_$BluetoothDevConStateImpl value,
          $Res Function(_$BluetoothDevConStateImpl) then) =
      __$$BluetoothDevConStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BluetoothAdapterState adapterState,
      List<BluetoothDevice> devices,
      BluetoothDevice? device,
      BluetoothConnectionState connectionState,
      ScanningState? scanningState,
      List<BluetoothService> services,
      BluetoothCharacteristic? characteristic,
      List<int> value,
      Failure? error,
      String? info});

  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$BluetoothDevConStateImplCopyWithImpl<$Res>
    extends _$BluetoothDevConStateCopyWithImpl<$Res, _$BluetoothDevConStateImpl>
    implements _$$BluetoothDevConStateImplCopyWith<$Res> {
  __$$BluetoothDevConStateImplCopyWithImpl(_$BluetoothDevConStateImpl _value,
      $Res Function(_$BluetoothDevConStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adapterState = null,
    Object? devices = null,
    Object? device = freezed,
    Object? connectionState = null,
    Object? scanningState = freezed,
    Object? services = null,
    Object? characteristic = freezed,
    Object? value = null,
    Object? error = freezed,
    Object? info = freezed,
  }) {
    return _then(_$BluetoothDevConStateImpl(
      adapterState: null == adapterState
          ? _value.adapterState
          : adapterState // ignore: cast_nullable_to_non_nullable
              as BluetoothAdapterState,
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<BluetoothDevice>,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BluetoothDevice?,
      connectionState: null == connectionState
          ? _value.connectionState
          : connectionState // ignore: cast_nullable_to_non_nullable
              as BluetoothConnectionState,
      scanningState: freezed == scanningState
          ? _value.scanningState
          : scanningState // ignore: cast_nullable_to_non_nullable
              as ScanningState?,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<BluetoothService>,
      characteristic: freezed == characteristic
          ? _value.characteristic
          : characteristic // ignore: cast_nullable_to_non_nullable
              as BluetoothCharacteristic?,
      value: null == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<int>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BluetoothDevConStateImpl implements _BluetoothDevConState {
  _$BluetoothDevConStateImpl(
      {required this.adapterState,
      required final List<BluetoothDevice> devices,
      this.device,
      required this.connectionState,
      this.scanningState,
      required final List<BluetoothService> services,
      this.characteristic,
      required final List<int> value,
      this.error,
      this.info})
      : _devices = devices,
        _services = services,
        _value = value;

  @override
  final BluetoothAdapterState adapterState;
  final List<BluetoothDevice> _devices;
  @override
  List<BluetoothDevice> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  final BluetoothDevice? device;
  @override
  final BluetoothConnectionState connectionState;
  @override
  final ScanningState? scanningState;
  final List<BluetoothService> _services;
  @override
  List<BluetoothService> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  final BluetoothCharacteristic? characteristic;
  final List<int> _value;
  @override
  List<int> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  @override
  final Failure? error;
  @override
  final String? info;

  @override
  String toString() {
    return 'BluetoothDevConState(adapterState: $adapterState, devices: $devices, device: $device, connectionState: $connectionState, scanningState: $scanningState, services: $services, characteristic: $characteristic, value: $value, error: $error, info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothDevConStateImpl &&
            (identical(other.adapterState, adapterState) ||
                other.adapterState == adapterState) &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.connectionState, connectionState) ||
                other.connectionState == connectionState) &&
            (identical(other.scanningState, scanningState) ||
                other.scanningState == scanningState) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.characteristic, characteristic) ||
                other.characteristic == characteristic) &&
            const DeepCollectionEquality().equals(other._value, _value) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      adapterState,
      const DeepCollectionEquality().hash(_devices),
      device,
      connectionState,
      scanningState,
      const DeepCollectionEquality().hash(_services),
      characteristic,
      const DeepCollectionEquality().hash(_value),
      error,
      info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothDevConStateImplCopyWith<_$BluetoothDevConStateImpl>
      get copyWith =>
          __$$BluetoothDevConStateImplCopyWithImpl<_$BluetoothDevConStateImpl>(
              this, _$identity);
}

abstract class _BluetoothDevConState implements BluetoothDevConState {
  factory _BluetoothDevConState(
      {required final BluetoothAdapterState adapterState,
      required final List<BluetoothDevice> devices,
      final BluetoothDevice? device,
      required final BluetoothConnectionState connectionState,
      final ScanningState? scanningState,
      required final List<BluetoothService> services,
      final BluetoothCharacteristic? characteristic,
      required final List<int> value,
      final Failure? error,
      final String? info}) = _$BluetoothDevConStateImpl;

  @override
  BluetoothAdapterState get adapterState;
  @override
  List<BluetoothDevice> get devices;
  @override
  BluetoothDevice? get device;
  @override
  BluetoothConnectionState get connectionState;
  @override
  ScanningState? get scanningState;
  @override
  List<BluetoothService> get services;
  @override
  BluetoothCharacteristic? get characteristic;
  @override
  List<int> get value;
  @override
  Failure? get error;
  @override
  String? get info;
  @override
  @JsonKey(ignore: true)
  _$$BluetoothDevConStateImplCopyWith<_$BluetoothDevConStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
