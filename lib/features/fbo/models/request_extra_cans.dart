import 'package:equatable/equatable.dart';

class RequestExtraCans extends Equatable {
  const RequestExtraCans({
    required this.fboId,
    required this.date,
    required this.noOfCans,
  });

  final String fboId;
  final String date;
  final int noOfCans;

  Map<String, dynamic> toJson() => {
        'fbo_id': fboId,
        'no_of_cans': noOfCans,
        'date': date,
      };

  @override
  List<Object?> get props => [fboId, date, noOfCans];
}
