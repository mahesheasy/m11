import 'package:equatable/equatable.dart';

class CollectionReport extends Equatable {
  const CollectionReport({
    required this.fboId, 
    required this.supplierName, 
    required this.ucoWeight,
  });


  final String fboId;
  final String supplierName;
  final double ucoWeight;

  @override
  List<Object?> get props => [fboId, supplierName, ucoWeight];

  static CollectionReport fromJson(Map<String, dynamic> json) {
    return CollectionReport(
      fboId: json['fbo_id'], 
      supplierName: json['supplier_name'],
      ucoWeight: json['total_weight'],
    );
  }
  static List<String> headerCols = ['FBO Name', 'UCO Collected\n(in KGs)'];
}
