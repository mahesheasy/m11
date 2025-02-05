import 'package:flutter/material.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/widgets/widgets.dart';

class SummaryTileCard extends StatelessWidget {
  const SummaryTileCard({
    super.key,
    required this.child,
    this.pading = const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
  });

  final Widget child;
  final EdgeInsets pading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pading,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

class TtileValueWidget2 extends StatelessWidget {
  const TtileValueWidget2({
    super.key,
    required this.title,
    required this.value,
    this.units,
    this.flex = 1,
  });

  final String title;
  final String value;
  final String? units;
  final int flex;

  static TtileValueWidget2 withNumericValue(String title, num value, [String? units]) {
    return TtileValueWidget2(title: title, value: value.toString(), units: units);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
          flex: flex,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyles.k14Bold(context),
              ),
              if (units.isNotNull) ...[
                AppSpacer.p12(),
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
