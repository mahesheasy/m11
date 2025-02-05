import 'package:equatable/equatable.dart';

class FBOSummary extends Equatable {
  const FBOSummary({
    required this.name,
    this.noOfCansSubmitted,
    this.lastPurchaseDate,
    this.lastPurchaseRate,
    this.lastPurcahseWeight,
    this.cansIssuedDate,
  });

  final String name;
  final int? noOfCansSubmitted;
  final String? lastPurchaseDate;
  final int? lastPurchaseRate;
  final double? lastPurcahseWeight;
  final String? cansIssuedDate;

  FBOSummary copyWith(final String id) {
    return FBOSummary(
      name: id, 
      cansIssuedDate: cansIssuedDate,
      lastPurcahseWeight: lastPurcahseWeight,
      lastPurchaseDate: lastPurchaseDate,
      lastPurchaseRate: lastPurchaseRate,
      noOfCansSubmitted: noOfCansSubmitted,
    );
  }

  static FBOSummary fromJson(Map<String, dynamic> json) => FBOSummary(
        name: json['fbo_id'] ?? '',
        noOfCansSubmitted: json['last_no_of_cans_submitted'],
        lastPurchaseDate: json['last_purchase_date'],
        lastPurchaseRate: json['last_purchase_price'],
        lastPurcahseWeight: json['last_purchase_weight'],
        cansIssuedDate: json['cans_issued_date'],
      );

  @override
  List<Object?> get props => [
        name,
        noOfCansSubmitted,
        lastPurchaseDate,
        lastPurchaseRate,
        lastPurcahseWeight,
        cansIssuedDate,
      ];
}
