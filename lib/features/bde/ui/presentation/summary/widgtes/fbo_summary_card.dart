import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class FBOSummaryCard extends StatelessWidget {
  const FBOSummaryCard({
    super.key,
    required this.fbo,
    required this.onTap,
  });

  final FBO fbo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 1,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: AppColors.grey),
        ),
        surfaceTintColor: AppColors.white,
        color: AppColors.white,
        child: SpacedColumn(
          defaultHeight: 0,
          margin: const EdgeInsets.all(8.0),
          children: [
            ListTile(
              titleTextStyle: TextStyles.titleBold(context),
              subtitleTextStyle: context.textTheme.labelSmall
                  ?.copyWith(color: AppColors.black, height: 1),
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              minVerticalPadding: 0,
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(fbo.businessName),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.pin_drop)),
                  CircleAvatar(
                    backgroundColor:
                        fbo.active ? AppColors.green : AppColors.red,
                    radius: 6,
                  ),
                ],
              ),
              subtitle: Text(fbo.primaryAddress),
            ),
            AppSpacer.p8(),
            IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.green),
                ),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: _BuyInfo(
                        title: 'Contact:',
                        subtitle: fbo.mobileNumber.valueOrEmpty,
                      ),
                    ),
                    const VerticalDivider(thickness: 1, color: AppColors.green),
                    Expanded(
                      child: _BuyInfo(
                        title: 'Email:',
                        subtitle: fbo.email.valueOrEmpty,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppSpacer.p8(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('GST Number', style: TextStyles.captionBold(context)),
                    Text(fbo.taxId.valueOrEmpty,
                        style: TextStyles.captionBold(context)
                            .copyWith(color: AppColors.green)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('IFSC Code', style: TextStyles.captionBold(context)),
                    Text(
                      fbo.ifsc.valueOrEmpty,
                      style: TextStyles.captionBold(context)
                          .copyWith(color: AppColors.green),
                    ),
                  ],
                ),
              ],
            ),
            AppSpacer.p4(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.white,
                    border: Border.all(color: AppColors.green, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text('Creation Date',
                              style: TextStyles.captionBold(context)),
                          Text(fbo.followUpDate.valueOrEmpty,
                              style: TextStyles.captionBold(context)
                                  .copyWith(color: AppColors.red)),
                      ],
                    ),
                  ),
                ),
                _BuyButton(price: fbo.pricePerKg),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BuyButton extends StatelessWidget {
  const _BuyButton({required this.price});

  final double? price;

  @override
  Widget build(BuildContext context) {
    final displayValue = price.isNull ? '' : price!.toStringAsFixed(0);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.green,
        visualDensity: const VisualDensity(vertical: -2),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      ),
      onPressed: null,
      child: Text(
        '₹ $displayValue per kg',
        style: context.textTheme.labelLarge
            ?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _BuyInfo extends StatelessWidget {
  const _BuyInfo({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final style =
        context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: style?.copyWith(color: AppColors.black)),
          Text(
            subtitle,
            style: style?.copyWith(
              color: AppColors.green,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
