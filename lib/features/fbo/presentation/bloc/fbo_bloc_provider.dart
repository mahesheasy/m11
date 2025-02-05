import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_details/fbo_details_cubit.dart';
import 'package:m11_ind/features/fbo/data/fbo_repo.dart';
import 'package:m11_ind/features/fbo/models/request_extra_cans.dart';

typedef FBOStatusCubit = NetworkRequestCubit<Pair<String, bool>, None>;
typedef FBOStatusCubitState = NetworkRequestState<Pair<String, bool>>;

typedef RequestExtraCansCubit = NetworkRequestCubit<bool, RequestExtraCans>;
typedef RequestExtraCansCubitState = NetworkRequestState<bool>;

@lazySingleton
class FBOBlocProvider {
  const FBOBlocProvider(this.repo);

  final FBORepo repo;

  static FBOBlocProvider get() => $sl.get<FBOBlocProvider>();

  FBOStatusCubit getStatus() => FBOStatusCubit(onRequest: (_, __) => repo.getStatus());

  FBODetailsCubit getFBODetails() => FBODetailsCubit(
    onRequest: (params, state) => repo.getFBODetails(params!),
  );

  RequestExtraCansCubit requestCans() => RequestExtraCansCubit(
    onRequest: (params, _) => repo.requestCans(params!),
  );

  RequestExtraCansCubit requestFBO() => RequestExtraCansCubit(
    onRequest: (params, _) => repo.requestFBO(params!),
  );
}