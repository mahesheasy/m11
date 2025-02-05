import 'package:flutter/material.dart';
import 'package:m11_ind/features/ce/models/deposit_summary.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';


class DepositSummaryWidget extends StatelessWidget {
  const DepositSummaryWidget({super.key, required this.deposit});


  final DepositSummary deposit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpacer.p12(),
        Text(
          'Deposit Summary',
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
              SummaryTileCard(
                pading: const EdgeInsets.all(16),
                child: _DataRow.withNumericValue("KG's Of Oil Depositing", deposit.depositOil, "Kg's")),
              SummaryTileCard(
                pading: EdgeInsets.zero,
                child: SpacedColumn(
                  defaultHeight: 0,
                  divider: const Divider(color: AppColors.green, height: 0, endIndent: 12, indent: 12),
                  children: [
                    SummaryTileCard(
                      child: _DataRow(
                        title: 'Date of Deposit',
                        value: deposit.dateOfDeposit,
                      ),
                    ),
                    // SummaryTileCard(
                    //   child: _DataRow.withNumericValue('Average Purchase Rate', deposit.avgPurchaseRate, 'INR')),
                    // SummaryTileCard(
                    //   child: _DataRow.withNumericValue('Purchase Weight', deposit.purchaseWeight, "Kg's")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



class _DataRow extends StatelessWidget {
  const _DataRow({required this.title, required this.value, this.units});

  final String title;
  final String value;
  final String? units;

  static _DataRow withNumericValue(String title, num? value, [String? units]) {
    return _DataRow(title: title, value: NumUtils.toStrVal(value), units: units);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: TextStyles.titleSmall(context),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyles.k14Bold(context),
              ),
              if (units.isNotNull) ...[
                AppSpacer.p8(),
                Text(
                  'In $units',
                  style: TextStyles.k12Bold(context)
                      .copyWith(color: AppColors.green),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}