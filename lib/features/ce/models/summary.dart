import 'package:m11_ind/features/ce/models/pick_up_summary.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';

class Pickup {
  Pickup({
    required this.forms,
    this.fbo,
    this.paymentType,
    this.netAmount,
    this.netWeight,
    this.activeForm,
  });
  final List<NewPickUpSummary> forms;
  final FBODetails? fbo;
  final String? paymentType;
  final double? netAmount;
  final double? netWeight;
  final NewPickUpSummary? activeForm;

  Pickup copyWith({
    List<NewPickUpSummary>? forms,
    FBODetails? fbo,
    String? paymentType,
    double? netAmount,
    double? netWeight,
    NewPickUpSummary? activeForm,
  }) {
    return Pickup(
      forms: forms ?? this.forms,
      fbo: fbo ?? this.fbo,
      paymentType: paymentType ?? this.paymentType,
      netAmount: netAmount ?? this.netAmount,
      netWeight: netWeight ?? this.netWeight,
      activeForm: activeForm ?? this.activeForm,
    );
  }

  List<Object?> get props => [
        forms,
        fbo,
        paymentType,
        netAmount,
        netWeight,
        activeForm,
      ];
}
