import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/can_request.dart';
import 'package:m11_ind/features/ce/models/can_request_summary.dart';

typedef CanReqDetailsCubit = NetworkRequestCubit<CanRequest, String>;
typedef CanReqDetailsState = NetworkRequestState<CanRequest>;

typedef CanReqSummaryCubit = NetworkRequestCubit<CanRequestSummary, String>;
typedef CanReqSummaryCubitState = NetworkRequestState<CanRequestSummary>;
