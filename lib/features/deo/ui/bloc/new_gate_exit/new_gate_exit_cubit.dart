import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/deo/data/deo_repo.dart';
import 'package:m11_ind/features/deo/model/gate_exit_form.dart';

part 'new_gate_exit_cubit.freezed.dart';

@injectable
class NewGateExitCubit extends AppBaseCubit<NewGateExitState> {
  NewGateExitCubit(this.repo) : super(NewGateExitState.initial());

  final DEORepo repo;

    void onUpdate({
    String? vechileNumber,
    String? address,
    String? ceName,
    String? startKmReading,
    File? startKm,
    File? odoMeter,
  }) {
    final form = state.form;
    final updatedForm = form.copyWith(
      vehicleNumber: vechileNumber ?? form.vehicleNumber,
      address: address ?? form.address,
      ceName: ceName ?? form.ceName,
      startKmReading: startKmReading ?? form.startKmReading,
      odoMeter: odoMeter ?? form.odoMeter,
    );
    emitSafeState(state.copyWith(form: updatedForm));
  }

  void submit() {
    _validate().fold(
      () async {
          emitSafeState(state.copyWith(isLoading: true));
          final response = await repo.createGateExit(state.form);
          response.fold(
            (l) => emitSafeState(state.copyWith(isLoading: false, error: l, isSuccess: false)),
            (r) => emitSafeState(state.copyWith(isLoading: false, isSuccess: true)),
          );
        },
      _emitError,
    );
  }

  void _emitError(String error) {
    emitSafeState(state.copyWith(error: Failure(error: error)));
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
    if (form.vehicleNumber.doesNotHaveValue) {
      return optionOf('Enter CE Vechile Number');
    } else if (form.address.doesNotHaveValue) {
      return optionOf('Enter Depo Address');
    } else if (form.ceName.doesNotHaveValue) {
      return optionOf('Enter CE Name');
    } else if (form.startKmReading.doesNotHaveValue) {
      return optionOf('Enter vechile Start KM Reading');
    } else if (form.odoMeter.isNull) {
      return optionOf('Capture ODO Meter Reading');
    }
    return const None<String>();
  }
}

@freezed
class NewGateExitState with _$NewGateExitState {
  const factory NewGateExitState({
    required GateExitForm form,
    required bool isLoading,
    required bool isSuccess,
    Failure? error,
  }) = _NewGateExitState;

  factory NewGateExitState.initial() => NewGateExitState(
        form: GateExitForm(exitDate: DFU.ddMMyyyy(DFU.now())),
        isLoading: false,
        isSuccess: false,
      );
}