import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/deo/data/deo_repo.dart';
import 'package:m11_ind/features/deo/model/gate_entry_form.dart';

part 'new_gate_entry_cubit.freezed.dart';

@injectable
class NewGateEntryCubit extends AppBaseCubit<NewGateEntryState> {
  NewGateEntryCubit(this.repo) : super(NewGateEntryState.initial());

  final DEORepo repo;

  void onUpdate({
    String? exitNo,
    String? vechileNumber,
    String? eodKmReading,
    double? startKmReading,
    File? eodKm,
  }) {
    final form = state.form;

    final vehicleInReading = eodKmReading ?? NumUtils.toStrVal(form.vehicleInReading);
    final parsedVal = double.tryParse(vehicleInReading);
    double? actualKms = form.actualKms;
    if(parsedVal.isNotNull && form.vehicleOutReading.isNotNull) {
      final difference = parsedVal! - form.vehicleOutReading!;
      actualKms = difference;
    }

    final updatedForm = form.copyWith(
      vehicleTrackId: exitNo ?? form.vehicleTrackId,
      vehicleInReading: parsedVal,
      vehicleOutReading: startKmReading ?? form.vehicleOutReading,
      odoMeter: eodKm ?? form.odoMeter,
      actualKms: actualKms,
    );
    emitSafeState(state.copyWith(form: updatedForm));
  }

  void onContinue() {
    _validate().fold(
      () async {
        emitSafeState(state.copyWith(isLoading: true));
        final res = await repo.updateVehicleTracking(state.form);
        res.fold(
          (l) => emitSafeState(state.copyWith(isLoading: false, error: l)), 
          (r) => emitSafeState(state.copyWith(isLoading: false, isSuccess: true)),
        );
      },
      _emitError,
    );
  }

  void _emitError(String error) {
    emitSafeState(state.copyWith(error: Failure(error: error)));
  }

  void submit() {
    emitSafeState(state.copyWith(isSuccess: true));
  }

  void errorHandled() {
    emitSafeState(state.copyWith(
      error: null,
      isLoading: false,
      isSuccess: false,
    ));
  }

  Option<String> _validate() {
    final form = state.form;
    if (form.vehicleInReading.isNull) {
      return optionOf('Enter Vehicle In Reading');
    } else if (form.odoMeter.isNull) {
      return optionOf('Upload Vehicle reading ODO Meter Pic');
    }
    return const None<String>();
  }
}

@freezed
class NewGateEntryState with _$NewGateEntryState {
  const factory NewGateEntryState({
    required GateEntryForm form,
    required bool isLoading,
    required bool isSuccess,
    Failure? error,
  }) = _NewGateEntryState;

  factory NewGateEntryState.initial() => NewGateEntryState(
        form: GateEntryForm(),
        isLoading: false,
        isSuccess: false,
      );
}
