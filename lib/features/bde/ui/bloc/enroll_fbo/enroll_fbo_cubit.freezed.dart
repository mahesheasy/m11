// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enroll_fbo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EnrollFboState {
  EnrollFBO get form => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isOTPSent => throw _privateConstructorUsedError;
  bool get isOTPVerified => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  EnrollStage get stage => throw _privateConstructorUsedError;
  EnrollStage get finishedStage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EnrollFboStateCopyWith<EnrollFboState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollFboStateCopyWith<$Res> {
  factory $EnrollFboStateCopyWith(
          EnrollFboState value, $Res Function(EnrollFboState) then) =
      _$EnrollFboStateCopyWithImpl<$Res, EnrollFboState>;
  @useResult
  $Res call(
      {EnrollFBO form,
      bool isLoading,
      bool isSuccess,
      bool isOTPSent,
      bool isOTPVerified,
      Failure? error,
      EnrollStage stage,
      EnrollStage finishedStage});

  $EnrollFBOCopyWith<$Res> get form;
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$EnrollFboStateCopyWithImpl<$Res, $Val extends EnrollFboState>
    implements $EnrollFboStateCopyWith<$Res> {
  _$EnrollFboStateCopyWithImpl(this._value, this._then);

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
    Object? isOTPSent = null,
    Object? isOTPVerified = null,
    Object? error = freezed,
    Object? stage = null,
    Object? finishedStage = null,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as EnrollFBO,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPSent: null == isOTPSent
          ? _value.isOTPSent
          : isOTPSent // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPVerified: null == isOTPVerified
          ? _value.isOTPVerified
          : isOTPVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as EnrollStage,
      finishedStage: null == finishedStage
          ? _value.finishedStage
          : finishedStage // ignore: cast_nullable_to_non_nullable
              as EnrollStage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EnrollFBOCopyWith<$Res> get form {
    return $EnrollFBOCopyWith<$Res>(_value.form, (value) {
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
    implements $EnrollFboStateCopyWith<$Res> {
  factory _$$EnrollBusinessStateImplCopyWith(_$EnrollBusinessStateImpl value,
          $Res Function(_$EnrollBusinessStateImpl) then) =
      __$$EnrollBusinessStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EnrollFBO form,
      bool isLoading,
      bool isSuccess,
      bool isOTPSent,
      bool isOTPVerified,
      Failure? error,
      EnrollStage stage,
      EnrollStage finishedStage});

  @override
  $EnrollFBOCopyWith<$Res> get form;
  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$EnrollBusinessStateImplCopyWithImpl<$Res>
    extends _$EnrollFboStateCopyWithImpl<$Res, _$EnrollBusinessStateImpl>
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
    Object? isOTPSent = null,
    Object? isOTPVerified = null,
    Object? error = freezed,
    Object? stage = null,
    Object? finishedStage = null,
  }) {
    return _then(_$EnrollBusinessStateImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as EnrollFBO,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPSent: null == isOTPSent
          ? _value.isOTPSent
          : isOTPSent // ignore: cast_nullable_to_non_nullable
              as bool,
      isOTPVerified: null == isOTPVerified
          ? _value.isOTPVerified
          : isOTPVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as EnrollStage,
      finishedStage: null == finishedStage
          ? _value.finishedStage
          : finishedStage // ignore: cast_nullable_to_non_nullable
              as EnrollStage,
    ));
  }
}

/// @nodoc

class _$EnrollBusinessStateImpl implements _EnrollBusinessState {
  const _$EnrollBusinessStateImpl(
      {required this.form,
      required this.isLoading,
      required this.isSuccess,
      required this.isOTPSent,
      required this.isOTPVerified,
      this.error,
      required this.stage,
      required this.finishedStage});

  @override
  final EnrollFBO form;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isOTPSent;
  @override
  final bool isOTPVerified;
  @override
  final Failure? error;
  @override
  final EnrollStage stage;
  @override
  final EnrollStage finishedStage;

  @override
  String toString() {
    return 'EnrollFboState(form: $form, isLoading: $isLoading, isSuccess: $isSuccess, isOTPSent: $isOTPSent, isOTPVerified: $isOTPVerified, error: $error, stage: $stage, finishedStage: $finishedStage)';
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
            (identical(other.isOTPSent, isOTPSent) ||
                other.isOTPSent == isOTPSent) &&
            (identical(other.isOTPVerified, isOTPVerified) ||
                other.isOTPVerified == isOTPVerified) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.finishedStage, finishedStage) ||
                other.finishedStage == finishedStage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form, isLoading, isSuccess,
      isOTPSent, isOTPVerified, error, stage, finishedStage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollBusinessStateImplCopyWith<_$EnrollBusinessStateImpl> get copyWith =>
      __$$EnrollBusinessStateImplCopyWithImpl<_$EnrollBusinessStateImpl>(
          this, _$identity);
}

abstract class _EnrollBusinessState implements EnrollFboState {
  const factory _EnrollBusinessState(
      {required final EnrollFBO form,
      required final bool isLoading,
      required final bool isSuccess,
      required final bool isOTPSent,
      required final bool isOTPVerified,
      final Failure? error,
      required final EnrollStage stage,
      required final EnrollStage finishedStage}) = _$EnrollBusinessStateImpl;

  @override
  EnrollFBO get form;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isOTPSent;
  @override
  bool get isOTPVerified;
  @override
  Failure? get error;
  @override
  EnrollStage get stage;
  @override
  EnrollStage get finishedStage;
  @override
  @JsonKey(ignore: true)
  _$$EnrollBusinessStateImplCopyWith<_$EnrollBusinessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
