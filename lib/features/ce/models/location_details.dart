import 'package:equatable/equatable.dart';

class EnrollLocationDetails extends Equatable {
  const EnrollLocationDetails({
    this.name,
    this.state,
    this.city,
    this.locality,
    this.pinCode,
    this.street,
    this.latitude,
    this.longitude,
  });

  final String? name;
  final String? state;
  final String? city;
  final String? locality;
  final String? pinCode;
  final String? street;
  final String? latitude;
  final String? longitude;

  @override
  List<Object?> get props => [name, state, city, locality, pinCode, street,latitude,longitude];

  EnrollLocationDetails copyWith({
    String? name,
    String? state,
    String? city,
    String? locality,
    String? pinCode,
    String? street,
    String? latitude,
    String? longitude,
  }) {
    return EnrollLocationDetails(
      name: name ?? this.name,
      state: state ?? this.state,
      city: city ?? this.city,
      locality: locality ?? this.locality,
      pinCode: pinCode ?? this.pinCode,
      street: street ?? this.street,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
