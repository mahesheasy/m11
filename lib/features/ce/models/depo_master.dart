import 'package:equatable/equatable.dart';

class DepoMaster extends Equatable {
  const DepoMaster({
    required this.depotMasterName,
    required this.ceName,
    this.address,
    this.contactNum,
    this.gstNumber,
    this.panNumber,
  });

  final String depotMasterName;
  final String ceName;
  final String? address;
  final String? contactNum;
  final String? gstNumber;
  final String? panNumber;


  static DepoMaster fromJson(Map<String, dynamic> json) => DepoMaster(
        depotMasterName: json['company_name'],
        ceName: json['user_name'],
        address: json['address'],
        contactNum: json['phone_no'],
        gstNumber: json['gstin'],
        panNumber: json['pan'],
      );

  @override
  List<Object?> get props => [
        depotMasterName,
        ceName,
        address,
        contactNum,
        gstNumber,
        panNumber,
      ];
}
