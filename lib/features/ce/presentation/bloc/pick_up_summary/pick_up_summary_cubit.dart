import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/data/static_data.dart';
import 'package:m11_ind/features/ce/data/ce_repo.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/models/new_pickup_summary_form.dart';
import 'package:m11_ind/features/ce/models/pick_up_summary.dart';
import 'package:m11_ind/features/ce/models/pr_details.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';

part 'pick_up_summary_cubit.freezed.dart';

enum ViewMode {
  initial,
  form,
  summary,
  payment,
  verification,
  grnView,
}

@injectable
class PickUpSummaryCubit extends AppBaseCubit<PickUpSummaryState> {
  PickUpSummaryCubit(this.repo) : super(PickUpSummaryState.initial());

  final CERepo repo;

  void initFBO(FBODetails fbo) {
    final forms = List.generate(1, (i) => NewPickUpSummaryForm.initial(i + 1));
    final pickUp = state.pickup.copyWith(
      price: fbo.pricekg,
      fbo: fbo,
      paymentType: StaticData.paymentTypes.first,
      upiId: fbo.upiId,
      forms: forms,
      activeForm: forms.firstOrNull,
    );
    emitSafeState(state.copyWith(pickup: pickUp));
  }

  void initFBO2(FBO fbo) {
    final forms = List.generate(1, (i) => NewPickUpSummaryForm.initial(i + 1));
    final pickUp = state.pickup.copyWith(
      price: fbo.pricePerKg,
      fbo: FBODetails.fromFOB(fbo),
      paymentType: StaticData.paymentTypes.first,
      forms: forms,
      activeForm: forms.firstOrNull,
    );
    emitSafeState(state.copyWith(pickup: pickUp));
  }

  void updateRemarks(String remarks, String? otherRemarks, String? scheduleDate)async{
    emitSafeState(state.copyWith(isLoading: true));
    final fboId = state.pickup.fbo!.name;
    final updatedRemarks = await repo.updateVisitRemarks(
      fboId, remarks, otherRemarks, scheduleDate,
    );
    emitSafeState(updatedRemarks.fold(
      (l) => state.copyWith(isLoading: false, error: l), 
      (r) => state.copyWith(isLoading: false, isSuccess: true),
    ));
  }

  void editPickUp() {
    emitSafeState(state.copyWith(mode: ViewMode.form));
  }

  void incrementCan() {
    final forms = [...state.pickup.forms];

    forms.add(NewPickUpSummaryForm.initial(forms.length + 1));
    final pickUp = state.pickup.copyWith(forms: forms);
    emitSafeState(state.copyWith(pickup: pickUp));
  }

  void decrementCan() {
    final forms = [...state.pickup.forms];
    if (forms.length == 1 || forms.isEmpty) return;
    forms.removeLast();
    final nextForm = forms.where((e) => !e.isProcessed).firstOrNull;
    final mode = nextForm.isNull ? ViewMode.summary : ViewMode.form;
    final totalWeight = forms.fold(0.0, (pv, e) => pv + (e.totalWeight ?? 0));
    final netWeight = forms.fold(0.0, (pv, e) => pv + (e.netWeight ?? 0));
    final pickUp = state.pickup.copyWith(
      totalWeight: totalWeight,
      netWeight: netWeight,
      forms: forms,
    );
    emitSafeState(state.copyWith(pickup: pickUp, mode: mode));
  }

  void updateTotalWeight(String weight) {
    final parsedVal = double.tryParse(weight);
    if (parsedVal.isNotNull) {
      final activeForm = state.pickup.activeForm;
      final formWithTtlWeight = activeForm!.copyWith(totalWeight: parsedVal);
      final pickUp = state.pickup.copyWith(activeForm: formWithTtlWeight);
      emitSafeState(state.copyWith(pickup: pickUp));
    }
  }

  void updateEmptyCanWeight(String weight) {
    final parsedVal = double.tryParse(weight);
    if (parsedVal.isNotNull) {
      final activeForm = state.pickup.activeForm;
      final netWeight = activeForm!.totalWeight! - parsedVal!;
      final truncatedValue = double.parse(netWeight.toStringAsFixed(2));
      final formWithNetWeight = activeForm.copyWith(emptyCanWeight: parsedVal, netWeight: truncatedValue);
      final pickUp = state.pickup.copyWith(activeForm: formWithNetWeight);
      emitSafeState(state.copyWith(pickup: pickUp));
    }
  }

  void addAttachment(File attachment) {
    final activeForm = state.pickup.activeForm;
    final formWithAttachment = activeForm!.copyWith(canWeightImg: attachment);
    final pickUp = state.pickup.copyWith(activeForm: formWithAttachment);
    emitSafeState(state.copyWith(pickup: pickUp, isLoading: false));
  }

  void process() {
    emitSafeState(state.copyWith(isLoading: true, error: null));
    final forms = [...state.pickup.forms];
    final activeForm = state.pickup.activeForm;
    if(activeForm.isNotNull && activeForm!.netWeight!.isNegative) {
      const failure = Failure(error: "Net Weight can't be Negative.");
      emitSafeState(state.copyWith(error: failure));
      return;
    }
    final processedForm = activeForm!.copyWith(isProcessed: true);
    final indexOfForm = forms.indexWhere((e) => e.id == activeForm.id);
    forms
      ..removeAt(indexOfForm)
      ..insert(indexOfForm, processedForm);
    final pickUp =state.pickup.copyWith(forms: forms, activeForm: processedForm);
    emitSafeState(state.copyWith(pickup: pickUp, isLoading: false));
  }

  void completeAttachment() {
    final forms = [...state.pickup.forms];
    final activeForm = state.pickup.activeForm;
    final formWithAttachment = activeForm!.copyWith(isFileCaptured: true);
    final activeFormIndx = forms.indexWhere((e) => e.id == activeForm.id);
    forms
      ..removeAt(activeFormIndx)
      ..insert(activeFormIndx, formWithAttachment);
    final nextForm = forms.where((e) => !e.isProcessed).firstOrNull;
    final mode = nextForm.isNull ? ViewMode.summary : ViewMode.form;
    final totalWeight = forms.fold(0.0, (pv, e) => pv + (e.totalWeight ?? 0));
    final netWeight = forms.fold(0.0, (pv, e) => pv + (e.netWeight ?? 0));
    final pickup = state.pickup.copyWith(
      totalWeight: totalWeight,
      netWeight: netWeight,
      forms: forms,
      activeForm: nextForm,
    );
    emitSafeState(state.copyWith(pickup: pickup, isLoading: false, mode: mode));
  }

  void updateSummary(double price, double totalAmount, double netAmount) {
    final pickUp = state.pickup.copyWith(
      price: price,
      totalAmount: totalAmount,
      netAmount: netAmount,
    );
    emitSafeState(state.copyWith(pickup: pickUp));
  }

  void selectPayment() => emitSafeState(state.copyWith(mode: ViewMode.payment));

  void updatePayment(String type) {
    if (StaticData.paymentTypes.contains(type)) {
      final pickup = state.pickup.copyWith(paymentType: type);
      emitSafeState(state.copyWith(pickup: pickup));
    }
  }


  void updateUPI(String upi) {
    final pickup = state.pickup.copyWith(upiId: upi);
    emitSafeState(state.copyWith(pickup: pickup));
  }

  void create() async {
    try {
      emitSafeState(state.copyWith(isLoading: true));
      final paymentType = state.pickup.paymentType;
      final upiId = state.pickup.fbo?.upiId;
      if (paymentType.isNull && upiId.isNull) {
        showError('Please Select Payment Type');
        return;
      }
      final upiValidationResult = validateUpiId();
      if (upiValidationResult.isSome()) {
        showError(upiValidationResult.getOrElse(() => ''));
        return;
      }
      
      final res = await repo.createNewPickUp(state.pickup);
      res.fold(
        (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
        (r) => emitSafeState(state.copyWith(isLoading: false, isSuccess: true, prdetails: r)),
      );
    } on Exception catch (e, st) {
      $logger.error('[FBOSummaryCubit]', e, st);
      final failure = Failure(error: e.toString());
      emitSafeState(state.copyWith(isLoading: false, error: failure));
    }
  }

  void showError(String message) {
    final failure = Failure(error: message);
    emitSafeState(state.copyWith(error: failure, isLoading: false));
  }

  void errorHandled() {
    emitSafeState(
        state.copyWith(isLoading: false, isSuccess: false, error: null));
  }

  Option<String> validateUpiId() {
    final isUPIBased = state.pickup.paymentType == 'UPI';
    final upiId = state.pickup.upiId;
    if (isUPIBased) {
      if (upiId.doesNotHaveValue) {
        return optionOf('Enter UPI Id');
      }

      if (!StringUtils.validateUPI(upiId!)) {
        return optionOf('Enter Valid FBOs UPI ID');
      }
    }
    return const None();
  }
}

@freezed
class PickUpSummaryState with _$PickUpSummaryState {
  const factory PickUpSummaryState({
    required NewPickUpSummary pickup,
    required bool isLoading,
    required bool isSuccess,
    required ViewMode mode,
    PRDetails? prdetails,
    Failure? error,
  }) = _FBOSummaryState;

  factory PickUpSummaryState.initial() => const PickUpSummaryState(
        pickup: NewPickUpSummary(forms: []),
        isLoading: false,
        isSuccess: false,
        mode: ViewMode.initial,
      );
}
