// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deo_montly_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DEOMonthlyReport _$DEOMonthlyReportFromJson(Map<String, dynamic> json) {
  return _DEOMonthlyReport.fromJson(json);
}

/// @nodoc
mixin _$DEOMonthlyReport {
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_entry')
  double get gateEntry => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_exit')
  double get gateExit => throw _privateConstructorUsedError;
  @JsonKey(name: 'uco_deposit')
  double get ucoDeposit => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_requests')
  double get canRequests => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DEOMonthlyReportCopyWith<DEOMonthlyReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DEOMonthlyReportCopyWith<$Res> {
  factory $DEOMonthlyReportCopyWith(
          DEOMonthlyReport value, $Res Function(DEOMonthlyReport) then) =
      _$DEOMonthlyReportCopyWithImpl<$Res, DEOMonthlyReport>;
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'gate_entry') double gateEntry,
      @JsonKey(name: 'gate_exit') double gateExit,
      @JsonKey(name: 'uco_deposit') double ucoDeposit,
      @JsonKey(name: 'can_requests') double canRequests});
}

/// @nodoc
class _$DEOMonthlyReportCopyWithImpl<$Res, $Val extends DEOMonthlyReport>
    implements $DEOMonthlyReportCopyWith<$Res> {
  _$DEOMonthlyReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? gateEntry = null,
    Object? gateExit = null,
    Object? ucoDeposit = null,
    Object? canRequests = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      gateEntry: null == gateEntry
          ? _value.gateEntry
          : gateEntry // ignore: cast_nullable_to_non_nullable
              as double,
      gateExit: null == gateExit
          ? _value.gateExit
          : gateExit // ignore: cast_nullable_to_non_nullable
              as double,
      ucoDeposit: null == ucoDeposit
          ? _value.ucoDeposit
          : ucoDeposit // ignore: cast_nullable_to_non_nullable
              as double,
      canRequests: null == canRequests
          ? _value.canRequests
          : canRequests // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DEOMonthlyReportImplCopyWith<$Res>
    implements $DEOMonthlyReportCopyWith<$Res> {
  factory _$$DEOMonthlyReportImplCopyWith(_$DEOMonthlyReportImpl value,
          $Res Function(_$DEOMonthlyReportImpl) then) =
      __$$DEOMonthlyReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      @JsonKey(name: 'gate_entry') double gateEntry,
      @JsonKey(name: 'gate_exit') double gateExit,
      @JsonKey(name: 'uco_deposit') double ucoDeposit,
      @JsonKey(name: 'can_requests') double canRequests});
}

/// @nodoc
class __$$DEOMonthlyReportImplCopyWithImpl<$Res>
    extends _$DEOMonthlyReportCopyWithImpl<$Res, _$DEOMonthlyReportImpl>
    implements _$$DEOMonthlyReportImplCopyWith<$Res> {
  __$$DEOMonthlyReportImplCopyWithImpl(_$DEOMonthlyReportImpl _value,
      $Res Function(_$DEOMonthlyReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? gateEntry = null,
    Object? gateExit = null,
    Object? ucoDeposit = null,
    Object? canRequests = null,
  }) {
    return _then(_$DEOMonthlyReportImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      gateEntry: null == gateEntry
          ? _value.gateEntry
          : gateEntry // ignore: cast_nullable_to_non_nullable
              as double,
      gateExit: null == gateExit
          ? _value.gateExit
          : gateExit // ignore: cast_nullable_to_non_nullable
              as double,
      ucoDeposit: null == ucoDeposit
          ? _value.ucoDeposit
          : ucoDeposit // ignore: cast_nullable_to_non_nullable
              as double,
      canRequests: null == canRequests
          ? _value.canRequests
          : canRequests // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DEOMonthlyReportImpl implements _DEOMonthlyReport {
  _$DEOMonthlyReportImpl(
      {required this.date,
      @JsonKey(name: 'gate_entry') required this.gateEntry,
      @JsonKey(name: 'gate_exit') required this.gateExit,
      @JsonKey(name: 'uco_deposit') required this.ucoDeposit,
      @JsonKey(name: 'can_requests') required this.canRequests});

  factory _$DEOMonthlyReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$DEOMonthlyReportImplFromJson(json);

  @override
  final String date;
  @override
  @JsonKey(name: 'gate_entry')
  final double gateEntry;
  @override
  @JsonKey(name: 'gate_exit')
  final double gateExit;
  @override
  @JsonKey(name: 'uco_deposit')
  final double ucoDeposit;
  @override
  @JsonKey(name: 'can_requests')
  final double canRequests;

  @override
  String toString() {
    return 'DEOMonthlyReport(date: $date, gateEntry: $gateEntry, gateExit: $gateExit, ucoDeposit: $ucoDeposit, canRequests: $canRequests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DEOMonthlyReportImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.gateEntry, gateEntry) ||
                other.gateEntry == gateEntry) &&
            (identical(other.gateExit, gateExit) ||
                other.gateExit == gateExit) &&
            (identical(other.ucoDeposit, ucoDeposit) ||
                other.ucoDeposit == ucoDeposit) &&
            (identical(other.canRequests, canRequests) ||
                other.canRequests == canRequests));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, gateEntry, gateExit, ucoDeposit, canRequests);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DEOMonthlyReportImplCopyWith<_$DEOMonthlyReportImpl> get copyWith =>
      __$$DEOMonthlyReportImplCopyWithImpl<_$DEOMonthlyReportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DEOMonthlyReportImplToJson(
      this,
    );
  }
}

abstract class _DEOMonthlyReport implements DEOMonthlyReport {
  factory _DEOMonthlyReport(
          {required final String date,
          @JsonKey(name: 'gate_entry') required final double gateEntry,
          @JsonKey(name: 'gate_exit') required final double gateExit,
          @JsonKey(name: 'uco_deposit') required final double ucoDeposit,
          @JsonKey(name: 'can_requests') required final double canRequests}) =
      _$DEOMonthlyReportImpl;

  factory _DEOMonthlyReport.fromJson(Map<String, dynamic> json) =
      _$DEOMonthlyReportImpl.fromJson;

  @override
  String get date;
  @override
  @JsonKey(name: 'gate_entry')
  double get gateEntry;
  @override
  @JsonKey(name: 'gate_exit')
  double get gateExit;
  @override
  @JsonKey(name: 'uco_deposit')
  double get ucoDeposit;
  @override
  @JsonKey(name: 'can_requests')
  double get canRequests;
  @override
  @JsonKey(ignore: true)
  _$$DEOMonthlyReportImplCopyWith<_$DEOMonthlyReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
