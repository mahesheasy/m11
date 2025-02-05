// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gate_entry_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GateEntryFormImpl _$$GateEntryFormImplFromJson(Map<String, dynamic> json) =>
    _$GateEntryFormImpl(
      vehicleTrackId: json['vehicle_track_id'] as String?,
      vehicleOutReading: (json['vehicleOutReading'] as num?)?.toDouble(),
      vehicleInReading: (json['vehicle_in_reading'] as num?)?.toDouble(),
      actualKms: (json['actual_kms'] as num?)?.toDouble(),
      odoMeter: toNull(json['odoMeter']),
    );

Map<String, dynamic> _$$GateEntryFormImplToJson(_$GateEntryFormImpl instance) =>
    <String, dynamic>{
      'vehicle_track_id': instance.vehicleTrackId,
      'vehicleOutReading': instance.vehicleOutReading,
      'vehicle_in_reading': instance.vehicleInReading,
      'actual_kms': instance.actualKms,
    };
