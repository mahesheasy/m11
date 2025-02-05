// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gate_exit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GateExitsImpl _$$GateExitsImplFromJson(Map<String, dynamic> json) =>
    _$GateExitsImpl(
      gateExitNo: json['name'] as String,
      date: json['date'] as String?,
      executive: json['collection_executive'] as String,
      vehicleOutReading: (json['vehicle_out_reading'] as num?)?.toDouble(),
      vehicleInReading: (json['vehicle_in_reading'] as num?)?.toDouble(),
      actualKms: (json['actual_kms'] as num?)?.toDouble(),
      outReadingImage: json['vehicle_out_reading_photo'] as String?,
      inReadingImage: json['vehicle_in_reading_photo'] as String?,
      vehicle: json['vehicle'] as String?,
      isGateEntry: const BoolenAPIConverter()
          .fromJson((json['is_gate_entry'] as num).toInt()),
      isGateExit: const BoolenAPIConverter()
          .fromJson((json['is_gate_exit'] as num).toInt()),
    );

Map<String, dynamic> _$$GateExitsImplToJson(_$GateExitsImpl instance) =>
    <String, dynamic>{
      'name': instance.gateExitNo,
      'date': instance.date,
      'collection_executive': instance.executive,
      'vehicle_out_reading': instance.vehicleOutReading,
      'vehicle_in_reading': instance.vehicleInReading,
      'actual_kms': instance.actualKms,
      'vehicle_out_reading_photo': instance.outReadingImage,
      'vehicle_in_reading_photo': instance.inReadingImage,
      'vehicle': instance.vehicle,
      'is_gate_entry': const BoolenAPIConverter().toJson(instance.isGateEntry),
      'is_gate_exit': const BoolenAPIConverter().toJson(instance.isGateExit),
    };
