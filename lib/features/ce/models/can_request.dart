import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m11_ind/core/core.dart';

part 'can_request.freezed.dart';
part 'can_request.g.dart';

@freezed
class CanRequest with _$CanRequest {
  const factory CanRequest({
    @JsonKey(name: 'fbo_name') required String fbo,
    @JsonKey(name: 'req_date') required String reqDate,
    @JsonKey(name: 'no_of_cans') required int requestedCans,
    @JsonKey(name: 'issued_noof_cans_by_de', defaultValue: 0) required int approvedcans,
    @JsonKey(name: 'approved_deo') String? approvedBy,
    @JsonKey(name: 'rejected_deo') String? rejectedBy,
    @JsonKey(name: 'deo_delivery_date') String? deliveryDate,
    @BoolenAPIConverter() required bool approve,
    @BoolenAPIConverter() required bool reject,

  }) = _CanRequest;
factory CanRequest.fromJson(Map<String, dynamic> json) => _$CanRequestFromJson(json);
}