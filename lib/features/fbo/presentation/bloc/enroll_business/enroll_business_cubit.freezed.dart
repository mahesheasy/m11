// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enroll_business_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EnrollBusinessState {
  EnrollBusinessForm get form => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EnrollBusinessStateCopyWith<EnrollBusinessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollBusinessStateCopyWith<$Res> {
  factory $EnrollBusinessStateCopyWith(
          EnrollBusinessState value, $Res Function(EnrollBusinessState) then) =
      _$EnrollBusinessStateCopyWithImpl<$Res, EnrollBusinessState>;
  @useResult
  $Res call(
      {EnrollBusinessForm form,
      bool isLoading,
      bool isSuccess,
      Failure? error});

  $EnrollBusinessFormCopyWith<$Res> get form;
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$EnrollBusinessStateCopyWithImpl<$Res, $Val extends EnrollBusinessState>
    implements $EnrollBusinessStateCopyWith<$Res> {
  _$EnrollBusinessStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as EnrollBusinessForm,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EnrollBusinessFormCopyWith<$Res> get form {
    return $EnrollBusinessFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
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
abstract class _$$EnrollBusinessStateImplCopyWith<$Res>
    implements $EnrollBusinessStateCopyWith<$Res> {
  factory _$$EnrollBusinessStateImplCopyWith(_$EnrollBusinessStateImpl value,
          $Res Function(_$EnrollBusinessStateImpl) then) =
      __$$EnrollBusinessStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EnrollBusinessForm form,
      bool isLoading,
      bool isSuccess,
      Failure? error});

  @override
  $EnrollBusinessFormCopyWith<$Res> get form;
  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$EnrollBusinessStateImplCopyWithImpl<$Res>
    extends _$EnrollBusinessStateCopyWithImpl<$Res, _$EnrollBusinessStateImpl>
    implements _$$EnrollBusinessStateImplCopyWith<$Res> {
  __$$EnrollBusinessStateImplCopyWithImpl(_$EnrollBusinessStateImpl _value,
      $Res Function(_$EnrollBusinessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? error = freezed,
  }) {
    return _then(_$EnrollBusinessStateImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as EnrollBusinessForm,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$EnrollBusinessStateImpl implements _EnrollBusinessState {
  const _$EnrollBusinessStateImpl(
      {required this.form,
      required this.isLoading,
      required this.isSuccess,
      this.error});

  @override
  final EnrollBusinessForm form;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final Failure? error;

  @override
  String toString() {
    return 'EnrollBusinessState(form: $form, isLoading: $isLoading, isSuccess: $isSuccess, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollBusinessStateImpl &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, form, isLoading, isSuccess, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollBusinessStateImplCopyWith<_$EnrollBusinessStateImpl> get copyWith =>
      __$$EnrollBusinessStateImplCopyWithImpl<_$EnrollBusinessStateImpl>(
          this, _$identity);
}

abstract class _EnrollBusinessState implements EnrollBusinessState {
  const factory _EnrollBusinessState(
      {required final EnrollBusinessForm form,
      required final bool isLoading,
      required final bool isSuccess,
      final Failure? error}) = _$EnrollBusinessStateImpl;

  @override
  EnrollBusinessForm get form;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  Failure? get error;
  @override
  @JsonKey(ignore: true)
  _$$EnrollBusinessStateImplCopyWith<_$EnrollBusinessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
