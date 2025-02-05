import 'package:freezed_annotation/freezed_annotation.dart';

part 'uco_deposit.freezed.dart';
part 'uco_deposit.g.dart';

@freezed
class UCODeposit with _$UCODeposit {
  factory UCODeposit({
    required String date,
    @JsonKey(name: 'fbo_id') String? fboId,
    @JsonKey(name: 'fbo_name') String? fboName,
    String? address,
    @JsonKey(name: 'collected_qty_in_kgs') required double collQty,
    @JsonKey(name: 'payment_type') String? paymentType,
    @JsonKey(name: 'no_of_cans') required double noOfCans,
    @JsonKey(name: 'can_weight_with_oil') required double weightWithOil,
    @JsonKey(name: 'can_weight_without_oil') required double weightWithoutOil,
    @JsonKey(name: 'total_weight') required double totalWeight,
    @JsonKey(name: 'total_amount') required double totalAmt,
  }) = _UCODeposit;

  factory UCODeposit.fromJson(Map<String, dynamic> json) => _$UCODepositFromJson(json);
}