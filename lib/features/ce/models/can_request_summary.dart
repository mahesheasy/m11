import 'package:freezed_annotation/freezed_annotation.dart';

part 'can_request_summary.freezed.dart';
part 'can_request_summary.g.dart';

@freezed
class  CanRequestSummary with _$CanRequestSummary {
  factory CanRequestSummary({
    @JsonKey(name: 'fbo_name') required String name,
    @JsonKey(name: 'no_of_cans_approved', defaultValue: 0) required int noOfCans,
    @JsonKey(name: 'last_purchase_date') String? lastPurchaseDate,
    @JsonKey(name: 'last_purchase_rate', defaultValue: 0.0) double? lastPurchaseRate,
    @JsonKey(name: 'last_purchase_weight', defaultValue: 0.0) double? lastPurchaseWeight,
    @JsonKey(name: 'date_of_cans_issued') String? cansIssuedDate,
  }) = _CanRequestSummary;

  factory CanRequestSummary.fromJson(Map<String, dynamic> json) => _$CanRequestSummaryFromJson(json);

}