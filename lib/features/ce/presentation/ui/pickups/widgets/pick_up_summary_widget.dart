import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/presentation/bloc/pick_up_summary/pick_up_summary_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/pickup_summary_builder.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/summary_tile.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class FBOSummaryWidget extends StatelessWidget {
  const FBOSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return PickUpSummaryBuilder(
      builder: (state) {
        final pickup = state.pickup;
        final forms = state.pickup.forms;
        final currFBO = pickup.fbo;
        final totalWeight = pickup.totalWeight ?? 0.0;
        final netWeight = pickup.netWeight ?? 0.0;
        final processedCount = forms.where((e) => e.isProcessed).length;
        final pricePerKg = currFBO?.pricekg;
    
        double? totalAmount;
        double? netAmount;
        if (pricePerKg.isNotNull) {
          totalAmount = netWeight * pricePerKg!;
          netAmount = NumUtils.calcGST(totalAmount, 5);
        }
        final valueStyle = context.textTheme.titleMedium?.copyWith(
          color: AppColors.green,
          fontWeight: FontWeight.bold,
        );
    
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                color: AppColors.sunGlare,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: SpacedColumn(
                  defaultHeight: 6,
                  margin: const EdgeInsets.all(4),
                  children: [
                    SummaryListTile(
                      title: 'Rate per KG',
                      trailing: Text(NumUtils.inRupeesFormat(pickup.fbo!.pricekg), style: valueStyle),
                    ),
                    SummaryListTile(
                      title: 'No.of Cans Receiving',
                      trailing: Text(processedCount.toString(), style: valueStyle),
                    ),
                    SummaryListTile(
                      title: 'Total Weight',
                      trailing: Text('$totalWeight KG', style: valueStyle),
                    ),
                    SummaryListTile(
                      title: 'Net Weight',
                      trailing: Text('$netWeight KG', style: valueStyle),
                    ),
                    SummaryListTile(
                      title: 'Total Amount',
                      trailing: Text(NumUtils.inRupeesFormat(totalAmount), style: valueStyle),
                    ),
                    if(currFBO.isNotNull && currFBO!.isRegistered)...[
                      SummaryListTile(
                        title: 'Net Amount',
                        trailing: Text(NumUtils.inRupeesFormat(netAmount), style: valueStyle),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            AppSpacer.p12(),
            AppButton(
              label: 'Select Payment',
              onPressed: () => context.cubit<PickUpSummaryCubit>()
                ..updateSummary(pickup.fbo!.pricekg!, totalAmount!, netAmount!)
                ..selectPayment(),
              bgColor: AppColors.green,
            ),
          ],
        );
      },
    );
  }
}
