import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m11_ind/core/core.dart';
part 'gate_exit.freezed.dart';
part 'gate_exit.g.dart';

@freezed
class GateExit with _$GateExit{
  factory GateExit({
    @JsonKey(name: 'name') required String gateExitNo,
    @JsonKey(name: 'date') String? date,
    @JsonKey(name: 'collection_executive') required String executive,
    @JsonKey(name: 'vehicle_out_reading') double? vehicleOutReading,
    @JsonKey(name: 'vehicle_in_reading') double? vehicleInReading,
    @JsonKey(name: 'actual_kms') double? actualKms,
    @JsonKey(name: 'vehicle_out_reading_photo') String? outReadingImage,
    @JsonKey(name: 'vehicle_in_reading_photo') String? inReadingImage,
    @JsonKey(name: 'vehicle') required String? vehicle,
    @BoolenAPIConverter() @JsonKey(name: 'is_gate_entry') required bool isGateEntry,
    @BoolenAPIConverter() @JsonKey(name: 'is_gate_exit') required bool isGateExit,
  }) = _GateExits;

  factory GateExit.fromJson(Map<String, dynamic> json) => _$GateExitFromJson(json);
}