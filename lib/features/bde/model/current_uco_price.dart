import 'package:equatable/equatable.dart';

class CurrentUCOPrice extends Equatable {
  const CurrentUCOPrice({
    required this.date,
    required this.basePrice,
    required this.gstPercent,
  });

  final String date;
  final double basePrice;
  final double gstPercent;

  static CurrentUCOPrice fromJson(final Map<String, dynamic> json) =>
      CurrentUCOPrice(
        date: json['uco_date'],
        basePrice: json['uco_price'] ?? 0.0,
        gstPercent: json['gst_percentage'] ?? 0.0,
      );
  @override
  List<Object?> get props => [basePrice, gstPercent];
}
