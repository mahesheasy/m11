import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_details/fbo_details_cubit.dart';
import 'package:m11_ind/features/deo/data/deo_repo.dart';
import 'package:m11_ind/features/deo/model/app_rej_input.dart';
import 'package:m11_ind/features/deo/model/deo_montly_report.dart';
import 'package:m11_ind/features/deo/model/gate_exit.dart';
import 'package:m11_ind/features/deo/model/uco_deposit.dart';

typedef CEUsers = NetworkRequestCubit<List<String>, None>;
typedef CEUsersState = NetworkRequestState<List<String>>;

typedef BDEUsers = NetworkRequestCubit<List<String>, None>;
typedef BDEUsersState = NetworkRequestState<List<String>>;

typedef AssignCEListCubit = InfiniteListCubit<FBO, DateTime, DateTime>;
typedef AssignCEListState = InfiniteListState<List<FBO>>;

typedef AssignBDEListCubit = InfiniteListCubit<FBO, DateTime, DateTime>;
typedef AssignBDEListState = InfiniteListState<List<FBO>>;

typedef FBOCanRequestsCubit = InfiniteListCubit<FBO, DateTime, DateTime>;
typedef FBOCanRequestsState = InfiniteListState<List<FBO>>;

typedef ApproveCanReqCubit = NetworkRequestCubit<bool, ApproveCanRequest>;
typedef ApproveCanReqState = NetworkRequestState<bool>;

typedef RejectCanReqCubit = NetworkRequestCubit<bool, RejectCanReqInput>;
typedef RejectCanReqState = NetworkRequestState<bool>;

typedef MonthlyReportCubit = NetworkRequestCubit<List<DEOMonthlyReport>, None>;
typedef MonthlyReportState = NetworkRequestState<List<DEOMonthlyReport>>;

typedef AssignBDE = NetworkRequestCubit<bool, Pair<String, String>>;
typedef AssignBDEState = NetworkRequestState<bool>;

typedef AssignCE = NetworkRequestCubit<bool, Pair<String, String>>;
typedef AssignCEState = NetworkRequestState<bool>;

typedef UCODepositCubit = NetworkRequestCubit<List<UCODeposit>, String>;
typedef UCODepositState = NetworkRequestState<List<UCODeposit>>;

typedef GateExitListCubit = InfiniteListCubit<GateExit, String, String>;
typedef GateExitListState = InfiniteListState<GateExit>;

typedef UCOSubmission = NetworkRequestCubit<bool, String>;
typedef UCOSubmissionState = NetworkRequestState<bool>;

mixin DriverList on NetworkRequestCubit<List<String>, None> {}
mixin VehicleNoList on NetworkRequestCubit<List<String>, None> {}

class NameMasterListCubit extends  NetworkRequestCubit<List<String>, None> with DriverList, VehicleNoList {
  NameMasterListCubit({required super.onRequest});
}

@lazySingleton
class DEOBlocProvider {
  const DEOBlocProvider(this.repo);

  final DEORepo repo;

  static DEOBlocProvider get() => $sl.get<DEOBlocProvider>();

  CEUsers ceUsers() => CEUsers(onRequest: (_, __) => repo.ceUsers());
  BDEUsers bdeUsers() => BDEUsers(onRequest: (_, __) => repo.bdeUsers());

  DriverList vehicleDrivers() => NameMasterListCubit(onRequest: (_, __) => repo.vehicleDrivers());
  VehicleNoList vehcileNos() => NameMasterListCubit(onRequest: (_, __) => repo.getvehicleNums());

  FBODetailsCubit getFBODetails() => FBODetailsCubit(
    onRequest: (params, state) => repo.getFBODetails(params!),
  );

  AssignCEListCubit assignCEList() => AssignCEListCubit(
    requestInitial: (params, state) => repo.assignCEList(params!, 0, 20),
    requestMore: (params, state) => repo.assignCEList(params!, state.curLength, state.curLength + 20),
  );

  AssignBDEListCubit assignBDEList() => AssignBDEListCubit(
    requestInitial: (params, state) => repo.assignCEList(params!, 0, 20),
    requestMore: (params, state) => repo.assignCEList(params!, state.curLength, state.curLength + 20),
  );

  FBOCanRequestsCubit fboCanRequests() => FBOCanRequestsCubit(
    requestInitial: (params, state) => repo.fboCanRequests(params!, 0, 20),
    requestMore: (params, state) => repo.fboCanRequests(params!, state.curLength, state.curLength + 20),
  );

  ApproveCanReqCubit rejectCanRequest() => ApproveCanReqCubit(
    onRequest: (params, state) => repo.approveCanRequest(params!),
  );

  RejectCanReqCubit approveCanRequest() => RejectCanReqCubit(
    onRequest: (params, state) => repo.rejectCanRequest(params!),
  );

  MonthlyReportCubit reportCubit() => MonthlyReportCubit(
    onRequest: (params, state) => repo.fetchMonthlyReport(),
  );

  AssignBDE assignBDE() => AssignBDE(
    onRequest: (params, _) => repo.assignBDE(params!),
  );

  AssignCE assignCE() => AssignCE(
    onRequest: (params, _) => repo.assignCE(params!),
  );

  UCODepositCubit ucoDepositSummary() => UCODepositCubit(
    onRequest: (params, _) => repo.ucoDepositSummary(params!),
  );

  UCOSubmission ucoSubmission() => UCOSubmission(
    onRequest: (params, _) => repo.ucoSubmission(params!),
  );

  GateExitListCubit gateExitRecords() => GateExitListCubit(
    requestInitial: (params, _) => repo.gateExitList(0),
    requestMore: (params, state) => repo.gateExitList(state.curLength),
  );
}
