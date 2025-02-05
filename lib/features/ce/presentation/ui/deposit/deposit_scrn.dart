import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/depo_master.dart';
import 'package:m11_ind/features/ce/presentation/bloc/deposit_master/deposit_master_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/deposit_summary/deposit_summary_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/deposit/deposit_summary_widget.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/icons.dart';
import 'package:m11_ind/widgets/widgets.dart';

class DepositScrn extends StatelessWidget {
  const DepositScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Depo Master',
      bgImagePath: AppIcons.pickUpBg.path,
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title: 'Deposit At', value: context.user.depoName),
      ),
      child: SingleChildScrollView(
        child: SpacedColumn(
          defaultHeight: 8.0,
          children: [
            BlocBuilder<DepositMasterCubit, DepositMasterCubitState>(
              builder: (_, state) => state.maybeWhen(
                success: (data) => _DepositCard(deposit: data),
                failure: (failure) => AppFailureWidget(
                  message: failure.error,
                  onPress: context.cubit<DepositMasterCubit>().request,
                ),
                orElse: () => const Center(child: LoadingIndicator()),
              ),
            ),
            BlocBuilder<DepositSummaryCubit, DepositSummaryCubitState>(
              builder: (_, state) => state.maybeWhen(
                success: (data) => DepositSummaryWidget(deposit: data),
                failure: (failure) => AppFailureWidget(
                  message: failure.error,
                  onPress: context.cubit<DepositSummaryCubit>().request,
                ),
                orElse: () => const Center(child: LoadingIndicator()),
              ),
            ),
            // AppButton(
            //   label: 'Next',
            //   margin: const EdgeInsets.all(18),
            //   onPressed: () {
            //     AppDialog.showSuccessDialog(
            //       context, 
            //       content: 'Deposit completed successfully', 
            //       onTapDismiss: context.exit,
            //     ).then((_) => context.close());
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class _DepositCard extends StatelessWidget {
  const _DepositCard({required this.deposit});

  final DepoMaster deposit;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      surfaceTintColor: AppColors.white,
      color: AppColors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: AppColors.green),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SpacedColumn(
        margin: const EdgeInsets.all(8.0),
        children: [
          CardFieldWidget('Depo Master Name', deposit.depotMasterName),
          CardFieldWidget('CE Name', deposit.ceName.toUpperCase()),
          CardFieldWidget('Address', deposit.address),
          CardFieldWidget('Contact No.', deposit.contactNum),
          CardFieldWidget('GST No.', deposit.gstNumber),
          CardFieldWidget('PAN No.', deposit.panNumber),
        ],
      ),
    );
  }
}

