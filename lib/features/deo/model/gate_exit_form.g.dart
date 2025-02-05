// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gate_exit_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GateExitFormImpl _$$GateExitFormImplFromJson(Map<String, dynamic> json) =>
    _$GateExitFormImpl(
      exitDate: json['gate_exit_date'] as String,
      vehicleNumber: json['vehicle_number'] as String?,
      address: json['depo_address'] as String?,
      ceName: json['ce_name'] as String?,
      startKmReading: json['start_km_reading'] as String?,
      odoMeter: toNull(json['odoMeter']),
    );

Map<String, dynamic> _$$GateExitFormImplToJson(_$GateExitFormImpl instance) =>
    <String, dynamic>{
      'gate_exit_date': instance.exitDate,
      'vehicle_number': instance.vehicleNumber,
      'depo_address': instance.address,
      'ce_name': instance.ceName,
      'start_km_reading': instance.startKmReading,
    };
