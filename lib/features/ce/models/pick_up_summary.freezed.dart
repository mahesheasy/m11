// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pick_up_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewPickUpSummary {
  List<NewPickUpSummaryForm> get forms => throw _privateConstructorUsedError;
  NewPickUpSummaryForm? get activeForm => throw _privateConstructorUsedError;
  FBODetails? get fbo => throw _privateConstructorUsedError;
  String? get upiId => throw _privateConstructorUsedError;
  String? get paymentType => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get totalAmount => throw _privateConstructorUsedError;
  double? get netAmount => throw _privateConstructorUsedError;
  double? get totalWeight => throw _privateConstructorUsedError;
  double? get netWeight => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewPickUpSummaryCopyWith<NewPickUpSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPickUpSummaryCopyWith<$Res> {
  factory $NewPickUpSummaryCopyWith(
          NewPickUpSummary value, $Res Function(NewPickUpSummary) then) =
      _$NewPickUpSummaryCopyWithImpl<$Res, NewPickUpSummary>;
  @useResult
  $Res call(
      {List<NewPickUpSummaryForm> forms,
      NewPickUpSummaryForm? activeForm,
      FBODetails? fbo,
      String? upiId,
      String? paymentType,
      double? price,
      double? totalAmount,
      double? netAmount,
      double? totalWeight,
      double? netWeight});

  $NewPickUpSummaryFormCopyWith<$Res>? get activeForm;
  $FBODetailsCopyWith<$Res>? get fbo;
}

/// @nodoc
class _$NewPickUpSummaryCopyWithImpl<$Res, $Val extends NewPickUpSummary>
    implements $NewPickUpSummaryCopyWith<$Res> {
  _$NewPickUpSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forms = null,
    Object? activeForm = freezed,
    Object? fbo = freezed,
    Object? upiId = freezed,
    Object? paymentType = freezed,
    Object? price = freezed,
    Object? totalAmount = freezed,
    Object? netAmount = freezed,
    Object? totalWeight = freezed,
    Object? netWeight = freezed,
  }) {
    return _then(_value.copyWith(
      forms: null == forms
          ? _value.forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<NewPickUpSummaryForm>,
      activeForm: freezed == activeForm
          ? _value.activeForm
          : activeForm // ignore: cast_nullable_to_non_nullable
              as NewPickUpSummaryForm?,
      fbo: freezed == fbo
          ? _value.fbo
          : fbo // ignore: cast_nullable_to_non_nullable
              as FBODetails?,
      upiId: freezed == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      netAmount: freezed == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      totalWeight: freezed == totalWeight
          ? _value.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      netWeight: freezed == netWeight
          ? _value.netWeight
          : netWeight // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NewPickUpSummaryFormCopyWith<$Res>? get activeForm {
    if (_value.activeForm == null) {
      return null;
    }

    return $NewPickUpSummaryFormCopyWith<$Res>(_value.activeForm!, (value) {
      return _then(_value.copyWith(activeForm: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FBODetailsCopyWith<$Res>? get fbo {
    if (_value.fbo == null) {
      return null;
    }

    return $FBODetailsCopyWith<$Res>(_value.fbo!, (value) {
      return _then(_value.copyWith(fbo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewPickUpSummaryImplCopyWith<$Res>
    implements $NewPickUpSummaryCopyWith<$Res> {
  factory _$$NewPickUpSummaryImplCopyWith(_$NewPickUpSummaryImpl value,
          $Res Function(_$NewPickUpSummaryImpl) then) =
      __$$NewPickUpSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<NewPickUpSummaryForm> forms,
      NewPickUpSummaryForm? activeForm,
      FBODetails? fbo,
      String? upiId,
      String? paymentType,
      double? price,
      double? totalAmount,
      double? netAmount,
      double? totalWeight,
      double? netWeight});

  @override
  $NewPickUpSummaryFormCopyWith<$Res>? get activeForm;
  @override
  $FBODetailsCopyWith<$Res>? get fbo;
}

/// @nodoc
class __$$NewPickUpSummaryImplCopyWithImpl<$Res>
    extends _$NewPickUpSummaryCopyWithImpl<$Res, _$NewPickUpSummaryImpl>
    implements _$$NewPickUpSummaryImplCopyWith<$Res> {
  __$$NewPickUpSummaryImplCopyWithImpl(_$NewPickUpSummaryImpl _value,
      $Res Function(_$NewPickUpSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forms = null,
    Object? activeForm = freezed,
    Object? fbo = freezed,
    Object? upiId = freezed,
    Object? paymentType = freezed,
    Object? price = freezed,
    Object? totalAmount = freezed,
    Object? netAmount = freezed,
    Object? totalWeight = freezed,
    Object? netWeight = freezed,
  }) {
    return _then(_$NewPickUpSummaryImpl(
      forms: null == forms
          ? _value._forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<NewPickUpSummaryForm>,
      activeForm: freezed == activeForm
          ? _value.activeForm
          : activeForm // ignore: cast_nullable_to_non_nullable
              as NewPickUpSummaryForm?,
      fbo: freezed == fbo
          ? _value.fbo
          : fbo // ignore: cast_nullable_to_non_nullable
              as FBODetails?,
      upiId: freezed == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      netAmount: freezed == netAmount
          ? _value.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      totalWeight: freezed == totalWeight
          ? _value.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      netWeight: freezed == netWeight
          ? _value.netWeight
          : netWeight // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$NewPickUpSummaryImpl implements _NewPickUpSummary {
  const _$NewPickUpSummaryImpl(
      {required final List<NewPickUpSummaryForm> forms,
      this.activeForm,
      this.fbo,
      this.upiId,
      this.paymentType,
      this.price,
      this.totalAmount,
      this.netAmount,
      this.totalWeight,
      this.netWeight})
      : _forms = forms;

  final List<NewPickUpSummaryForm> _forms;
  @override
  List<NewPickUpSummaryForm> get forms {
    if (_forms is EqualUnmodifiableListView) return _forms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forms);
  }

  @override
  final NewPickUpSummaryForm? activeForm;
  @override
  final FBODetails? fbo;
  @override
  final String? upiId;
  @override
  final String? paymentType;
  @override
  final double? price;
  @override
  final double? totalAmount;
  @override
  final double? netAmount;
  @override
  final double? totalWeight;
  @override
  final double? netWeight;

  @override
  String toString() {
    return 'NewPickUpSummary(forms: $forms, activeForm: $activeForm, fbo: $fbo, upiId: $upiId, paymentType: $paymentType, price: $price, totalAmount: $totalAmount, netAmount: $netAmount, totalWeight: $totalWeight, netWeight: $netWeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewPickUpSummaryImpl &&
            const DeepCollectionEquality().equals(other._forms, _forms) &&
            (identical(other.activeForm, activeForm) ||
                other.activeForm == activeForm) &&
            (identical(other.fbo, fbo) || other.fbo == fbo) &&
            (identical(other.upiId, upiId) || other.upiId == upiId) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.totalWeight, totalWeight) ||
                other.totalWeight == totalWeight) &&
            (identical(other.netWeight, netWeight) ||
                other.netWeight == netWeight));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_forms),
      activeForm,
      fbo,
      upiId,
      paymentType,
      price,
      totalAmount,
      netAmount,
      totalWeight,
      netWeight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewPickUpSummaryImplCopyWith<_$NewPickUpSummaryImpl> get copyWith =>
      __$$NewPickUpSummaryImplCopyWithImpl<_$NewPickUpSummaryImpl>(
          this, _$identity);
}

abstract class _NewPickUpSummary implements NewPickUpSummary {
  const factory _NewPickUpSummary(
      {required final List<NewPickUpSummaryForm> forms,
      final NewPickUpSummaryForm? activeForm,
      final FBODetails? fbo,
      final String? upiId,
      final String? paymentType,
      final double? price,
      final double? totalAmount,
      final double? netAmount,
      final double? totalWeight,
      final double? netWeight}) = _$NewPickUpSummaryImpl;

  @override
  List<NewPickUpSummaryForm> get forms;
  @override
  NewPickUpSummaryForm? get activeForm;
  @override
  FBODetails? get fbo;
  @override
  String? get upiId;
  @override
  String? get paymentType;
  @override
  double? get price;
  @override
  double? get totalAmount;
  @override
  double? get netAmount;
  @override
  double? get totalWeight;
  @override
  double? get netWeight;
  @override
  @JsonKey(ignore: true)
  _$$NewPickUpSummaryImplCopyWith<_$NewPickUpSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
