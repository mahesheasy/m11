import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/summary_tile.dart';
import 'package:m11_ind/features/deo/ui/bloc/bloc_provider.dart';

import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class UCOSummaryWidget extends StatelessWidget {
  const UCOSummaryWidget({super.key, required this.ceId});

  final String ceId;
  @override
  Widget build(BuildContext context) {
    final valueStyle = context.textTheme.titleMedium?.copyWith(
      color: AppColors.green,
      fontWeight: FontWeight.bold,
    );
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                color: AppColors.sunGlare,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: BlocBuilder<UCODepositCubit, UCODepositState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const SizedBox(),
                      success: (data) {
                        final totalCans = data
                            .fold(0.0, (p, e) => p + e.noOfCans)
                            .truncateToDouble();
                        final weightWithOil = data.fold(0.0,
                            (p, e) => p + e.weightWithOil.truncateToDouble());
                        final weightWithoutOil = data.fold(
                            0.0,
                            (p, e) =>
                                p + e.weightWithoutOil.truncateToDouble());
                        final totalWeight =
                            data.fold(0, (p, e) => p + e.totalWeight.toInt());
                        final totalAmount =
                            data.fold(0, (p, e) => p + e.totalAmt.toInt());
                        return SpacedColumn(
                          defaultHeight: 6,
                          margin: const EdgeInsets.all(4),
                          children: [
                            SummaryListTile(
                              title: 'No.of Cans Deposited',
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Text('$totalCans', style: valueStyle),
                              ),
                            ),
                            SummaryListTile(
                              title: 'Can weight without Oil',
                              trailing: SummaryTrailBtn(
                                child: Text('$weightWithoutOil KG', style: valueStyle),
                              ),
                            ),
                            SummaryListTile(
                              title: 'Total Weight ',
                              trailing: SummaryTrailBtn(
                                child: Text('$weightWithOil KG', style: valueStyle),
                              ),
                            ),
                            SummaryListTile(
                              title: 'Net Weight',
                              trailing: SummaryTrailBtn(
                                child: Text('$totalWeight KG', style: valueStyle),
                              ),
                            ),
                            SummaryListTile(
                              title: 'Total Amount',
                              trailing: SummaryTrailBtn(
                                child: Text(
                                  NumUtils.inRupeesFormat(totalAmount),
                                  style: valueStyle,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            AppSpacer.p8(),
            BlocConsumer<UCOSubmission, UCOSubmissionState>(
              listener: (_, state) {
                state.maybeWhen(
                  orElse: () {},
                  failure: (failure) => AppDialog.showErrorDialog(context, 
                    content: failure.error, 
                    onTapDismiss: context.exit,
                  ),
                  success: (data) => AppDialog.showSuccessDialog(
                    context,
                    content: 'Submitted Successfully...  Thank you',
                    onTapDismiss: context.exit,
                  ).then((value) => context.close(true)),
                );
              },
              builder: (_, state) {
                return AppButton(
                  isLoading: state.isLoading,
                  label: 'Submit',
                  onPressed: () => context.cubit<UCOSubmission>().request(ceId),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
