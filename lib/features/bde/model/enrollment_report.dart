import 'package:equatable/equatable.dart';

class EnrollmentReport extends Equatable {
  const EnrollmentReport({required this.fboname, required this.ucorate});

  final String fboname;
  final double ucorate;
  
  @override
  List<Object?> get props => [fboname, ucorate];

  static EnrollmentReport fromJson(Map<String,dynamic> json) {
    return EnrollmentReport(fboname: json['fbo_name'], ucorate: json['enrolled_price']);
  }

  static List<String> headerCols = ['FBO Name', 'Price Enrolled'];
}