import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/data/bde_repo.dart';
import 'package:m11_ind/features/bde/model/current_uco_price.dart';
import 'package:m11_ind/features/bde/model/enrollment_report.dart';
import 'package:m11_ind/features/bde/model/route_master.dart';
import 'package:m11_ind/features/bde/ui/bloc/download_report/download_repo_cubit.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/models/fbo_summary.dart';
import 'package:m11_ind/features/ce/presentation/bloc/ce_bloc_provider.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_details/fbo_details_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_list/fbo_list_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_summary/fbo_summary_cubit.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';

typedef UCOPriceCubit = NetworkRequestCubit<CurrentUCOPrice, None>;
typedef UCOPriceCubitState = NetworkRequestState<CurrentUCOPrice>;

typedef TaskPercentCubit = NetworkRequestCubit<int, None>;
typedef TaskPercentCubitState = NetworkRequestState<int>;

typedef EnrollmentReportCubit = NetworkRequestCubit<List<EnrollmentReport>, None>;
typedef EnrollmentReportCubitState = NetworkRequestState<List<EnrollmentReport>>;

typedef RouteMasterCubit = NetworkRequestCubit<List<RouteMaster>, String?>;
typedef RouteMasterState = NetworkRequestState<List<RouteMaster>>;

typedef RoutesCubit = InfiniteListCubit<FBO, Pair<String, String?>, Pair<String, String?>>;
typedef RoutesCubitState = InfiniteListState<FBO>;

typedef FollowUPListCubit = InfiniteListCubit<FBODetails, DateTime, DateTime>;
typedef FollowUPListCubitState = InfiniteListState<FBODetails>;

typedef DownloadFBOSummary = NetworkRequestCubit<File, FBOSummary>;
typedef DownloadFBOSummaryState = NetworkRequestState<File>;


@lazySingleton
class BDEBlocProvider {
  const BDEBlocProvider(this.repo);

  final BDERepo repo;

  static BDEBlocProvider get() => $sl.get<BDEBlocProvider>();

  UCOPriceCubit ucoPriceCubit() => UCOPriceCubit(
    onRequest: (_, __) => repo.getUCOPrice(),
  );

  RouteMasterCubit fetchRouteMaster() => RouteMasterCubit(
    onRequest: (params, _) => repo.fetchRouteMaster(params),
  );

  TaskPercentCubit taskProgressCubit() => TaskPercentCubit(
    onRequest: (_, __) => repo.getTaskPercent(),
  );

  RequestModeCubit fetchCounts() => RequestModeCubit(
    onRequest: (_, __) => repo.fetchFBOCounts(),
  );

  FBOListCubit fetchFBOs() => FBOListCubit(
    requestInitial: (params, state) => repo.fetchFBOs(params!, 1, 10),
    requestMore: (params, state) => repo.fetchFBOs(params!, state.curLength, state.curLength + 10),
  );

  EnrollmentReportCubit fetchReport() => EnrollmentReportCubit(
    onRequest: (params, _) => repo.getEmrollmentReport(),
  );

  DownloadEnrollReportCubit downloadReport() => DownloadEnrollReportCubit(
    onRequest: (params, _) => repo.downloadEnrollmentReport(params!),
  );

  RoutesCubit fetchRoutes() => RoutesCubit(
    requestInitial: (params, state) => repo.fetchRoutesList(params!.first, params.second, 1, 10),
    requestMore: (params, state) => repo.fetchRoutesList(params!.first, params.second, state.curLength + 1, state.curLength + 10),
  );

  FBODetailsCubit getFBODetails() => FBODetailsCubit(
    onRequest: (params, state) => repo.getFBODetails(params!),
  );

  FBOSummaryCubit fboSummaryCubit() => FBOSummaryCubit(
    onRequest: (params, state) => repo.fetchFBOSummary(params!),
  );

  FollowUPListCubit fetchFollowUps() => FollowUPListCubit(
    requestInitial: (p, state) => repo.fetchFollowUPs(p!, 1, 10),
    requestMore: (p, state) => repo.fetchFollowUPs(p! ,state.curLength + 1, state.curLength + 10),
  );

  DownloadFBOSummary downloadSummary() => DownloadFBOSummary(
    onRequest: (params, _) => repo.downloadSummary(params!),
  );

}
