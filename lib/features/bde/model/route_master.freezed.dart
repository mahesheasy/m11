// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_master.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RouteMaster _$RouteMasterFromJson(Map<String, dynamic> json) {
  return _RouteMaster.fromJson(json);
}

/// @nodoc
mixin _$RouteMaster {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'depot_name')
  String get depo => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_code')
  String get routeCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'route_name')
  String get routeName => throw _privateConstructorUsedError;
  String get day => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteMasterCopyWith<RouteMaster> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteMasterCopyWith<$Res> {
  factory $RouteMasterCopyWith(
          RouteMaster value, $Res Function(RouteMaster) then) =
      _$RouteMasterCopyWithImpl<$Res, RouteMaster>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'depot_name') String depo,
      @JsonKey(name: 'route_code') String routeCode,
      @JsonKey(name: 'route_name') String routeName,
      String day});
}

/// @nodoc
class _$RouteMasterCopyWithImpl<$Res, $Val extends RouteMaster>
    implements $RouteMasterCopyWith<$Res> {
  _$RouteMasterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? depo = null,
    Object? routeCode = null,
    Object? routeName = null,
    Object? day = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      depo: null == depo
          ? _value.depo
          : depo // ignore: cast_nullable_to_non_nullable
              as String,
      routeCode: null == routeCode
          ? _value.routeCode
          : routeCode // ignore: cast_nullable_to_non_nullable
              as String,
      routeName: null == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteMasterImplCopyWith<$Res>
    implements $RouteMasterCopyWith<$Res> {
  factory _$$RouteMasterImplCopyWith(
          _$RouteMasterImpl value, $Res Function(_$RouteMasterImpl) then) =
      __$$RouteMasterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'depot_name') String depo,
      @JsonKey(name: 'route_code') String routeCode,
      @JsonKey(name: 'route_name') String routeName,
      String day});
}

/// @nodoc
class __$$RouteMasterImplCopyWithImpl<$Res>
    extends _$RouteMasterCopyWithImpl<$Res, _$RouteMasterImpl>
    implements _$$RouteMasterImplCopyWith<$Res> {
  __$$RouteMasterImplCopyWithImpl(
      _$RouteMasterImpl _value, $Res Function(_$RouteMasterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? depo = null,
    Object? routeCode = null,
    Object? routeName = null,
    Object? day = null,
  }) {
    return _then(_$RouteMasterImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      depo: null == depo
          ? _value.depo
          : depo // ignore: cast_nullable_to_non_nullable
              as String,
      routeCode: null == routeCode
          ? _value.routeCode
          : routeCode // ignore: cast_nullable_to_non_nullable
              as String,
      routeName: null == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteMasterImpl implements _RouteMaster {
  const _$RouteMasterImpl(
      {required this.name,
      @JsonKey(name: 'depot_name') required this.depo,
      @JsonKey(name: 'route_code') required this.routeCode,
      @JsonKey(name: 'route_name') required this.routeName,
      required this.day});

  factory _$RouteMasterImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteMasterImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'depot_name')
  final String depo;
  @override
  @JsonKey(name: 'route_code')
  final String routeCode;
  @override
  @JsonKey(name: 'route_name')
  final String routeName;
  @override
  final String day;

  @override
  String toString() {
    return 'RouteMaster(name: $name, depo: $depo, routeCode: $routeCode, routeName: $routeName, day: $day)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteMasterImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.depo, depo) || other.depo == depo) &&
            (identical(other.routeCode, routeCode) ||
                other.routeCode == routeCode) &&
            (identical(other.routeName, routeName) ||
                other.routeName == routeName) &&
            (identical(other.day, day) || other.day == day));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, depo, routeCode, routeName, day);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteMasterImplCopyWith<_$RouteMasterImpl> get copyWith =>
      __$$RouteMasterImplCopyWithImpl<_$RouteMasterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteMasterImplToJson(
      this,
    );
  }
}

abstract class _RouteMaster implements RouteMaster {
  const factory _RouteMaster(
      {required final String name,
      @JsonKey(name: 'depot_name') required final String depo,
      @JsonKey(name: 'route_code') required final String routeCode,
      @JsonKey(name: 'route_name') required final String routeName,
      required final String day}) = _$RouteMasterImpl;

  factory _RouteMaster.fromJson(Map<String, dynamic> json) =
      _$RouteMasterImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'depot_name')
  String get depo;
  @override
  @JsonKey(name: 'route_code')
  String get routeCode;
  @override
  @JsonKey(name: 'route_name')
  String get routeName;
  @override
  String get day;
  @override
  @JsonKey(ignore: true)
  _$$RouteMasterImplCopyWith<_$RouteMasterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
