import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/features/ce/models/can_request_summary.dart';
import 'package:m11_ind/features/ce/presentation/bloc/can_submission/can_submission_cubit.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class CanReqSubmitWidget extends StatelessWidget {
  const CanReqSubmitWidget(this.summary, {super.key});

  final CanRequestSummary summary;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cans Request summary',
          style: TextStyles.titleBold(context).copyWith(color: AppColors.black),
        ),
        AppSpacer.p8(),
        Container(
          padding: const EdgeInsets.only(top: 6, right: 6, left: 6),
          decoration: BoxDecoration(
            color: AppColors.porcelianEarth,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SpacedColumn(
            defaultHeight: 12,
            children: [
              BlocBuilder<CanSubmissionCubit, CanSubmissionCubitState>(
                builder: (_, state) {
                  void incrementCan() => context.cubit<CanSubmissionCubit>().incrementCan();
                  void decrementCan() => context.cubit<CanSubmissionCubit>().decrementCan();

                  return SummaryTileCard(
                    pading: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 2,child: Text('No.of Cans Approved', style: TextStyles.titleSmall(context))),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ToggleValueWidget(icon: Icons.remove, onTap: decrementCan),
                              Text((state.cansCount ?? 0).toString(), style: TextStyles.k14Bold(context),),
                              ToggleValueWidget(icon: Icons.add, onTap: incrementCan),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SummaryTileCard(
                pading: EdgeInsets.zero,
                child: SpacedColumn(
                  defaultHeight: 0,
                  divider: const Divider( color: AppColors.green, height: 0, endIndent: 12, indent: 12),
                  children: [
                    SummaryTileCard(
                      child: TtileValueWidget2(
                        title: 'Last Purchase Date',
                        value: DFU.fromFrappeToddMMyyyy(summary.lastPurchaseDate),
                    )),
                    SummaryTileCard(
                      child: TtileValueWidget2.withNumericValue('Last Purchase Rate', summary.lastPurchaseRate ?? 0, 'INR')),
                    SummaryTileCard(
                      child: TtileValueWidget2.withNumericValue('Last Purchase Weight', summary.lastPurchaseWeight ?? 0, "Kg's")),
                  ],
                ),
              ),
              SummaryTileCard(
                pading: const EdgeInsets.all(16),
                child: TtileValueWidget2(title: 'Date of Cans issued', value: summary.cansIssuedDate.valueOrEmpty)),
            ],
          ),
        ),
      ],
    );
  }
}
class ToggleValueWidget extends StatelessWidget {
  const ToggleValueWidget({super.key, required this.icon, required this.onTap});

  final VoidCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 10,
        backgroundColor: AppColors.grey,
        child: Icon(icon, size: 16, color: AppColors.white),
      ),
    );
  }
}