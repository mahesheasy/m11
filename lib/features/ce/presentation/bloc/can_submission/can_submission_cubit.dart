import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/data/ce_repo.dart';

part 'can_submission_cubit.freezed.dart';

@injectable
class CanSubmissionCubit extends AppBaseCubit<CanSubmissionCubitState> {
  CanSubmissionCubit(this.repo) : super(CanSubmissionCubitState.init());

  final CERepo repo;

  void initFBO(String fboId) {
    emitSafeState(state.copyWith(canRequestId: fboId));
  }

  void initCansCount(int cans) {
    emitSafeState(state.copyWith(noOfCanRequested: cans, cansCount: cans));
  }

  void incrementCan() {
    if(state.cansCount.isNull || state.noOfCanRequested.isNull) return;

    final maxCans = state.noOfCanRequested!;
    final cansCount = state.cansCount!;
    final incrementedVal = cansCount + 1;
    if(incrementedVal > maxCans) return;
    emitSafeState(state.copyWith(cansCount: incrementedVal));
  }

  void decrementCan() {
    if(state.cansCount.isNull || state.noOfCanRequested.isNull) return;

    final cansCount = state.cansCount!;
    final decrementedVal = cansCount - 1;
    if(decrementedVal <= 0) return;
    emitSafeState(state.copyWith(cansCount: decrementedVal));
  }

  void requestOTP() {
    emitSafeState(state.copyWith(isOTPSent: true));
  }

  void clearOTP() {
    emitSafeState(state.copyWith(isOTPSent: false));
  }

  void clearErrorState() {
    emitSafeState(state.copyWith(isLoading: false, isSuccess: false, error: null));
  }

  void submitOTP() async {
    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.updateCanIssue(state.canRequestId!, state.cansCount!);
    res.fold(
      (l) => emitSafeState(state.copyWith(error: l, isLoading: false)), 
      (r) => emitSafeState(state.copyWith(isOTPverfied: true, isLoading: false, isSuccess: true)), 
    );
  }
}


@freezed
class CanSubmissionCubitState with _$CanSubmissionCubitState {
  factory CanSubmissionCubitState({
    int? noOfCanRequested,
    int? cansCount,
    String? canRequestId,
    required bool isOTPverfied,
    required bool isOTPSent,
    required bool isLoading,
    required bool isSuccess,
    Failure? error,
  }) = _CanSubmissionCubitState;

  factory CanSubmissionCubitState.init() {
    return CanSubmissionCubitState(isOTPverfied: false, isOTPSent: false, isLoading: false, isSuccess: false);
  }
}
