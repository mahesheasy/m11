// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deo_montly_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DEOMonthlyReportImpl _$$DEOMonthlyReportImplFromJson(
        Map<String, dynamic> json) =>
    _$DEOMonthlyReportImpl(
      date: json['date'] as String,
      gateEntry: (json['gate_entry'] as num).toDouble(),
      gateExit: (json['gate_exit'] as num).toDouble(),
      ucoDeposit: (json['uco_deposit'] as num).toDouble(),
      canRequests: (json['can_requests'] as num).toDouble(),
    );

Map<String, dynamic> _$$DEOMonthlyReportImplToJson(
        _$DEOMonthlyReportImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'gate_entry': instance.gateEntry,
      'gate_exit': instance.gateExit,
      'uco_deposit': instance.ucoDeposit,
      'can_requests': instance.canRequests,
    };
