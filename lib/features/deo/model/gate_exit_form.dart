
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m11_ind/core/core.dart';

part 'gate_exit_form.freezed.dart';
part 'gate_exit_form.g.dart';

@freezed
class GateExitForm with _$GateExitForm {
  factory GateExitForm({
    @JsonKey(name: 'gate_exit_date') required String exitDate,
    @JsonKey(name: 'vehicle_number') String? vehicleNumber,
    @JsonKey(name: 'depo_address') String? address,
    @JsonKey(name: 'ce_name') String? ceName,
    @JsonKey(name: 'start_km_reading') String? startKmReading,
    @JsonKey(includeIfNull: false, toJson: toNull, fromJson: toNull, includeToJson: false) File? odoMeter,
  }) = _GateExitForm;

  factory GateExitForm.fromJson(Map<String, dynamic> json) => _$GateExitFormFromJson(json);
}

extension GateExitFormApi on GateExitForm {
  bool get _isValidDetails => [exitDate, address, ceName, startKmReading].where((e) => e.doesNotHaveValue).isEmpty;
  bool get isValid => _isValidDetails && odoMeter.isNotNull;
}