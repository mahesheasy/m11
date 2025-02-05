import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/data/ce_repo.dart';
import 'package:m11_ind/features/ce/models/request_mode.dart';
import 'package:m11_ind/features/ce/presentation/bloc/can_req_summary/can_req_summary.dart';
import 'package:m11_ind/features/ce/presentation/bloc/can_requests/can_requests_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/collection_report/collection_report_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/deposit_master/deposit_master_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/deposit_summary/deposit_summary_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/download_report/download_repo_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_details/fbo_details_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_list/fbo_list_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_summary/fbo_summary_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/missed_collections/missed_collections.dart';
import 'package:m11_ind/features/ce/presentation/bloc/pick_up_list/pick_up_list_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/remind_fbo/remind_fbo_cubit.dart';

typedef RequestModeCubit = NetworkRequestCubit<List<RequestMode>, DateTime?>;
typedef RequestModeCubitState = NetworkRequestState<List<RequestMode>>;

typedef DownloadGRNCubit = NetworkRequestCubit<Uint8List, String>;
typedef DownloadGRNState = NetworkRequestState<Uint8List>;

@lazySingleton
class CEBlocProvider {
  const CEBlocProvider(this.repo);

  final CERepo repo;

  static CEBlocProvider get() => $sl.get<CEBlocProvider>();

  RequestModeCubit fetchCount() => RequestModeCubit(
    onRequest: (params, state) => repo.fetchCount(params),
  );

  PickUpListCubit fetchPickUps() => PickUpListCubit(
    requestInitial: (params, state) => repo.fetchPickUpList(params!.first, params.second, params.third),
    requestMore: (params, state) => repo.fetchPickUpList(params!.first, params.second, params.third),
  );

  MissedCollectionsCubit fetchMissedCollection() => MissedCollectionsCubit(
    requestInitial: (params, state) => repo.fetchMissedCollections(params!),
    requestMore: (params, state) => repo.fetchMissedCollections(params!),
  );

  FBOListCubit fetchFBOs() => FBOListCubit(
    requestInitial: (params, state) => repo.fetchFBOs(params!),
    requestMore: (params, state) => repo.fetchFBOs(params!),
  );

  CanRequests canRequests() => CanRequests(
    requestInitial: (params, state) => repo.fetchCanRequests(params!),
    requestMore: (params, state) => repo.fetchCanRequests(params!),
  );

  FBODetailsCubit getFBODetails() => FBODetailsCubit(
    onRequest: (params, state) => repo.getFBODetails(params!),
  );
   UpdateFssaiCubit updateFssaiNumber() => UpdateFssaiCubit(
    onRequest: (params, state) => repo.updateFssai(params!),
  );

  FBOSummaryCubit fboSummaryCubit() => FBOSummaryCubit(
    onRequest: (params, _) => repo.fetchFBOSummary(params!),
  );

  RemindFBOCubit remindFBOCubit() => RemindFBOCubit(
    onRequest: (params, _) => repo.remindFBO(params!),
  );

  CollectionReportCubit fetchCollectionReport() => CollectionReportCubit(
    onRequest: (params, _) => repo.fetchCollectionReport(params!),
  );

  DepositMasterCubit depoMasterCubit() => DepositMasterCubit(
    onRequest: (_, __) => repo.fetchDepoMaster(),
  );

  DepositSummaryCubit depositSummaryCubit() => DepositSummaryCubit(
    onRequest: (_, __) => repo.fetchDepositSummary(),
  );

  CanReqSummaryCubit canReSummaryCubit() => CanReqSummaryCubit(
    onRequest: (params, _) => repo.canRequestSummary(params!),
  );

  CanReqDetailsCubit canReqDetailsCubit() => CanReqDetailsCubit(
    onRequest: (params, _) => repo.canRequestDetails(params!),
  );

  DownloadReportCubit downloadRepo() => DownloadReportCubit(
    onRequest: (params, _) => repo.downloadUCOReport(params!),
  );

  DownloadGRNCubit downloadGRN() => DownloadGRNCubit(
    onRequest: (params, _) => repo.downloadGRNFile(params!),
  );
}