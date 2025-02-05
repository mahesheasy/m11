import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/features/deo/data/deo_repo.dart';
import 'package:m11_ind/features/deo/model/geo_loc_update.dart';

@injectable
class GeoLocaUpdateHelper extends UseCase<None, GeoLocUpdate> {
  GeoLocaUpdateHelper({required this.repo});

  final DEORepo repo;
  @override
  Future<None> call(params) async {
    final res = await repo.updateGEOLocation(params);
    return res.fold((l) => const None(), (r) => r);
  }
}

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object> get props => [];
}
