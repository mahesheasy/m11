import 'package:equatable/equatable.dart';
import 'package:m11_ind/core/core.dart';

class DepositSummary extends Equatable {
  const DepositSummary({
    required this.depositOil,
    required this.dateOfDeposit,
    required this.avgPurchaseRate,
    required this.purchaseWeight,
  });

  final double? depositOil;
  final String dateOfDeposit;
  final double? avgPurchaseRate;
  final double? purchaseWeight;

  static DepositSummary fromJson(Map<String, dynamic> json) => DepositSummary(
        depositOil: json['total_deposit_oil'],
        dateOfDeposit: DFU.ddMMMyyyy(DFU.now()),
        avgPurchaseRate: json['average_purchase_rate'],
        purchaseWeight: json['total_purchase_weight'],
      );

  @override
  List<Object?> get props => [
        depositOil,
        dateOfDeposit,
        avgPurchaseRate,
        purchaseWeight,
      ];
}
