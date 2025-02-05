import 'package:equatable/equatable.dart';

class GeoLocUpdate extends Equatable {
  const GeoLocUpdate({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  final String name;
  final String address;
  final String latitude;
  final String longitude;
  
  @override
  List<Object?> get props => [name, address, latitude, longitude];

  static Map<String, dynamic> toJson(GeoLocUpdate inp) => {
    'custom_enroll_address': inp.address,
    'custom_google_location_coordinates': '${inp.latitude}, ${inp.longitude}',
  };
}
