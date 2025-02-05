import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:m11_ind/features/ce/models/new_pickup_summary_form.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';

part 'pick_up_summary.freezed.dart';

@freezed
class NewPickUpSummary with _$NewPickUpSummary {
  const factory NewPickUpSummary({
    required List<NewPickUpSummaryForm> forms,
    NewPickUpSummaryForm? activeForm,
    FBODetails? fbo,
    String? upiId,
    String? paymentType,
    double? price,
    double? totalAmount,
    double? netAmount,
    double? totalWeight,
    double? netWeight,
  }) = _NewPickUpSummary;
}
