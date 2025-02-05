import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/deo/model/gate_exit.dart';
import 'package:m11_ind/features/deo/ui/bloc/new_gate_entry/new_gate_entry_cubit.dart';
import 'package:m11_ind/features/deo/ui/presentation/gate_entry/widgets/gate_entry_form.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class GateEntryRegistration extends StatelessWidget {
  const GateEntryRegistration({super.key, required this.gateExit});
 
  final GateExit gateExit;
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appbar: Text('Vehicle Details', style: TextStyles.appbarTextstyle(context)),
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title: gateExit.gateExitNo.valueOrEmpty),
      ),
      child: BlocListener<NewGateEntryCubit, NewGateEntryState>(
        listener: (_, state) {
          if (state.error.isNotNull) {
            AppDialog.showErrorDialog(
              context,
              content: state.error!.error,
              onTapDismiss: context.exit,
            ).then((_) {
              context.cubit<NewGateEntryCubit>().errorHandled();
            });
            return;
          }
          if (state.isSuccess) {
            AppDialog.showSuccessDialog(
              context,
              content: 'Gate Entry Registration Completed Successfully',
              onTapDismiss: context.exit,
            ).then((_) => context.close(true));
            return;
          }
        },
        child: gateExit.isGateEntry 
          ? _GateEntryView(gateExit) 
          : GateEntryForm(gateExitNo: gateExit),
      ),
    );
  }
}


class _GateEntryView extends StatelessWidget {
  const _GateEntryView(this.gateExit);

  final GateExit gateExit;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SpacedColumn(
        defaultHeight: 12.0,
        children: [
          AppTextField(
            title: 'Gate Entry Date : ', 
            initialValue: DFU.fromFrappeToddMMyyyy(gateExit.date),
            readOnly: true,
          ),
          AppTextField(
            title: 'Driver Name : ', 
            initialValue: gateExit.executive,
            readOnly: true,
          ),
          AppTextField(
            title: 'Vehicle Number : ', 
            initialValue: gateExit.vehicle,
            readOnly: true,
          ),
          AppTextField(
            title: 'Start Km Reading : ', 
            initialValue: NumUtils.compactFormat(gateExit.vehicleOutReading),
            readOnly: true,
          ),
          AppTextField(
            title: 'End Km Reading : ', 
            initialValue: NumUtils.compactFormat(gateExit.vehicleInReading),
            readOnly: true,
          ),
          AppTextField(
            title: 'Actual kms : ', 
            initialValue: NumUtils.compactFormat(gateExit.actualKms),
            readOnly: true,
          ),
          Row(
            children: [
              Expanded(
                child: UploadPhotoWidget(
                  title: 'Vehicle Out Reading',
                  readOnly: true,
                  imageUrl: gateExit.outReadingImage!,
                  onFileCapture: (file) {},
                ),
              ),
              AppSpacer.p8(),
              Expanded(
                child: UploadPhotoWidget(
                  title: 'Vehicle In Reading',
                  readOnly: true,
                  imageUrl: gateExit.inReadingImage!,
                  onFileCapture: (file) {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}