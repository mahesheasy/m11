import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m11_ind/core/core.dart';

part 'new_pickup_summary_form.freezed.dart';
part 'new_pickup_summary_form.g.dart';

@freezed
class NewPickUpSummaryForm with _$NewPickUpSummaryForm {
  factory NewPickUpSummaryForm({
    @JsonKey(includeToJson: false) required int id,
    @JsonKey(name: 'total_weight', defaultValue: 0.0) double? totalWeight,
    @JsonKey(name: 'empty_can_weight', defaultValue: 0.0) double? emptyCanWeight,
    @JsonKey(name: 'net_weight', defaultValue: 0.0) double? netWeight,
    @JsonKey(defaultValue: false, includeToJson: false) required bool isProcessed,
    @JsonKey(defaultValue: false, includeToJson: false) required bool isFileCaptured,
    @JsonKey(includeIfNull: false, toJson: toNull, fromJson: toNull, includeToJson: false) File? canWeightImg,
    @JsonKey(includeIfNull: false, toJson: toNull, fromJson: toNull, includeToJson: false) File? emptyCanWeightImg,
  }) = _NewPickUpSummary;

  factory NewPickUpSummaryForm.fromJson(Map<String, dynamic> json) => _$NewPickUpSummaryFormFromJson(json);

  factory NewPickUpSummaryForm.initial(int i) {
    return NewPickUpSummaryForm(id: i, isProcessed: false, isFileCaptured: false);
  }
}