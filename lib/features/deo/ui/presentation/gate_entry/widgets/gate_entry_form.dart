import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/core/utils/attachment_selection_mixin.dart';
import 'package:m11_ind/features/deo/model/gate_entry_form.dart';
import 'package:m11_ind/features/deo/model/gate_exit.dart';
import 'package:m11_ind/features/deo/ui/bloc/new_gate_entry/new_gate_entry_cubit.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class GateEntryForm extends StatefulWidget {
  const GateEntryForm({super.key, required this.gateExitNo});

  final GateExit gateExitNo;
  @override
  State<GateEntryForm> createState() => _GateEntryFormState();
}

class _GateEntryFormState extends State<GateEntryForm>
    with AttahcmentSelectionMixin {
  final vehcileNumber = TextEditingController();
  final address = TextEditingController();
  final eodReading = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.cubit<NewGateEntryCubit>();
    return SingleChildScrollView(
      child: SpacedColumn(
        divider: const Divider(color: AppColors.green),
        defaultHeight: 0,
        children: [
          AppDateField(
            title: 'Gate Entry Date : ',
            initialDate: DFU.ddMMyyyy(DFU.now()),
            startDate: DateTime.now(),
            endDate: DateTime.now(),
            readOnly: true,
            onSelected: (p0) {},
          ),
          AppTextField(
            title: 'Vehicle Number : ',
            initialValue: widget.gateExitNo.vehicle,
            controller: vehcileNumber,
            readOnly: true,
            inputFormatters: [UpperCaseTextFormatter()],
            textCapitalization: TextCapitalization.characters,
            onChanged: (text) => bloc.onUpdate(vechileNumber: text),
          ),
          AppTextField(
            title: 'Start Km Reading : ',
            readOnly: true,
            initialValue: NumUtils.toStrVal(widget.gateExitNo.vehicleOutReading),
            inputType: TextInputType.number,
          ),
          AppTextField(
            title: 'Vehicle In Reading Photo: ',
            controller: eodReading,
            inputType: TextInputType.number,
            onChanged: (text) => bloc.onUpdate(eodKmReading: text),
            suffixIcon: BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
              builder: (_, state) {
                final isAttached = state.form.odoMeter.isNotNull;
                return IconButton(
                  onPressed: _capture,
                  icon: isAttached
                    ? const Icon(Icons.camera, size: 28,color: AppColors.green)
                    : const Icon(Icons.camera, size: 28, color: AppColors.black),
                );
              },
            ),
          ),
          BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
            buildWhen: (previous, current) {
              final ps = previous.form.actualKms;
              final cs = current.form.actualKms;
              return cs != ps;
            },
            builder: (_, state) => AppTextField(
              title: 'Total Km : ',
              readOnly: true,
              initialValue: NumUtils.toStrVal(state.form.actualKms),
            ),
          ),
          BlocBuilder<NewGateEntryCubit, NewGateEntryState>(
            builder: (_, state) {
              return AppButton(
                isLoading: state.isLoading,
                bgColor:
                    state.form.isValid ? AppColors.green : AppColors.black,
                label: 'UPDATE',
                onPressed: bloc.onContinue,
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _capture() async {
    final capturedFile = await captureImage();
    if (!mounted) return;
    if (capturedFile.isNull) {
      context.showSnackbar('File is not Captured', AppSnackBarType.info);
    } else {
      context.cubit<NewGateEntryCubit>().onUpdate(eodKm: capturedFile!);
    }
  }
}
