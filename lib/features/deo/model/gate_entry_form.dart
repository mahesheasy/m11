
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m11_ind/core/core.dart';

part 'gate_entry_form.freezed.dart';
part 'gate_entry_form.g.dart';

@freezed
class GateEntryForm with _$GateEntryForm {
  factory GateEntryForm({
    @JsonKey(name: 'vehicle_track_id') String? vehicleTrackId,
    double? vehicleOutReading,
    @JsonKey(name: 'vehicle_in_reading') double? vehicleInReading,
    @JsonKey(name: 'actual_kms') double? actualKms,
    @JsonKey(includeIfNull: false, toJson: toNull, fromJson: toNull, includeToJson: false) File? odoMeter,
  }) = _GateEntryForm;

  factory GateEntryForm.fromJson(Map<String, dynamic> json) => _$GateEntryFormFromJson(json);
}

extension GateEntryFormApi on GateEntryForm {
  bool get _isValidDetails => [vehicleInReading,  vehicleTrackId,].where((e) => e.isNull).isEmpty;
  bool get _isUploadedFiles => [odoMeter].where((e) => e.isNull).isEmpty;
  bool get isValid => _isValidDetails && _isUploadedFiles;
}