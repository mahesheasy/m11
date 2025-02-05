import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/location_header.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/deo/ui/bloc/new_gate_exit/new_gate_exit_cubit.dart';
import 'package:m11_ind/features/deo/ui/presentation/gate_exit/widgets/gate_exit_form.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class GateExitRegistration extends StatelessWidget {
  const GateExitRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appbar:
          Text('Vehicle Details', style: TextStyles.appbarTextstyle(context)),
      headerWidget: const LocationHeader(title: 'Depo At'),
      child: BlocListener<NewGateExitCubit, NewGateExitState>(
        listener: (_, state) {
          if (state.error.isNotNull) {
            AppDialog.showErrorDialog(
              context,
              content: state.error!.error,
              onTapDismiss: context.exit,
            ).then((_) {
              context.cubit<NewGateExitCubit>().errorHandled();
            });
          }
          if (state.isSuccess) {
            AppDialog.showSuccessDialog(
              context,
              content: 'Gate Exit Registration Completed Successfully',
              onTapDismiss: context.exit,
            ).then((_) => context.close());
          }
        },
        child: const GateExitForm(),
      ),
    );
  }
}
