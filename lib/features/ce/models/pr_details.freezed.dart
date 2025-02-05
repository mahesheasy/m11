// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pr_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PRDetails _$PRDetailsFromJson(Map<String, dynamic> json) {
  return _PRDetails.fromJson(json);
}

/// @nodoc
mixin _$PRDetails {
  @JsonKey(name: 'pr_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'pr_print_file_path')
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PRDetailsCopyWith<PRDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PRDetailsCopyWith<$Res> {
  factory $PRDetailsCopyWith(PRDetails value, $Res Function(PRDetails) then) =
      _$PRDetailsCopyWithImpl<$Res, PRDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pr_id') String id,
      @JsonKey(name: 'pr_print_file_path') String url});
}

/// @nodoc
class _$PRDetailsCopyWithImpl<$Res, $Val extends PRDetails>
    implements $PRDetailsCopyWith<$Res> {
  _$PRDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PRDetailsImplCopyWith<$Res>
    implements $PRDetailsCopyWith<$Res> {
  factory _$$PRDetailsImplCopyWith(
          _$PRDetailsImpl value, $Res Function(_$PRDetailsImpl) then) =
      __$$PRDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pr_id') String id,
      @JsonKey(name: 'pr_print_file_path') String url});
}

/// @nodoc
class __$$PRDetailsImplCopyWithImpl<$Res>
    extends _$PRDetailsCopyWithImpl<$Res, _$PRDetailsImpl>
    implements _$$PRDetailsImplCopyWith<$Res> {
  __$$PRDetailsImplCopyWithImpl(
      _$PRDetailsImpl _value, $Res Function(_$PRDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_$PRDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PRDetailsImpl implements _PRDetails {
  const _$PRDetailsImpl(
      {@JsonKey(name: 'pr_id') required this.id,
      @JsonKey(name: 'pr_print_file_path') required this.url});

  factory _$PRDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PRDetailsImplFromJson(json);

  @override
  @JsonKey(name: 'pr_id')
  final String id;
  @override
  @JsonKey(name: 'pr_print_file_path')
  final String url;

  @override
  String toString() {
    return 'PRDetails(id: $id, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PRDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PRDetailsImplCopyWith<_$PRDetailsImpl> get copyWith =>
      __$$PRDetailsImplCopyWithImpl<_$PRDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PRDetailsImplToJson(
      this,
    );
  }
}

abstract class _PRDetails implements PRDetails {
  const factory _PRDetails(
          {@JsonKey(name: 'pr_id') required final String id,
          @JsonKey(name: 'pr_print_file_path') required final String url}) =
      _$PRDetailsImpl;

  factory _PRDetails.fromJson(Map<String, dynamic> json) =
      _$PRDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'pr_id')
  String get id;
  @override
  @JsonKey(name: 'pr_print_file_path')
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$PRDetailsImplCopyWith<_$PRDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
