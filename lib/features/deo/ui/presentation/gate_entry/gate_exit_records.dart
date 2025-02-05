import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/deo/model/gate_exit.dart';
import 'package:m11_ind/features/deo/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/deo/ui/bloc/new_gate_entry/new_gate_entry_cubit.dart';
import 'package:m11_ind/features/deo/ui/presentation/gate_entry/gate_entry_registration.dart';
import 'package:m11_ind/features/deo/ui/presentation/gate_entry/widgets/vehicle_exit_card.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class GateExitRecords extends StatelessWidget {
  const GateExitRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appbar: Text('Gate Entry', style: TextStyles.appbarTextstyle(context)),
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title: DFU.ddMMMyyyy(DFU.now())),
      ),
      child: InfiniteListViewWidget<GateExitListCubit, GateExit>(
        childBuilder: (context, gateExit) => VehicleExitCard(
          gateExits: gateExit,
          onTap: () {
            context.goToPage<bool?>(
              BlocProvider(
                create: (_) => $sl.get<NewGateEntryCubit>()..onUpdate(
                  exitNo: gateExit.gateExitNo,
                  startKmReading: gateExit.vehicleOutReading,
                ),
                child: GateEntryRegistration(gateExit: gateExit),
              ),
            ).then((value) {
              if(value.isTrue) {
                context.cubit<GateExitListCubit>().fetchInitial();
              }
            });
          },
        ), 
        fetchInitial: context.cubit<GateExitListCubit>().fetchInitial, 
        fetchMore: context.cubit<GateExitListCubit>().fetchMore, 
        emptyListText: 'No Gate Exits Found.',
      ),
    );
  }
}
