import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/icons.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FollowUpCard extends StatelessWidget {
  const FollowUpCard({
    super.key,
    required this.pickUp,
    required this.onTap,
  });

  final FBODetails pickUp;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          margin: const EdgeInsets.all(8.0),
          children: [
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pickUp.businessName.valueOrEmpty, style: TextStyles.titleBold(context)),
                        Text(pickUp.primaryAddress.valueOrEmpty, style: TextStyles.captionBold(context).copyWith(fontSize: 14)),
                      ],
                    ),
                  ),
                  if (pickUp.isNewVisit) ...[
                    SizedBox(height: 100, child: SvgPicture.asset(AppIcons.newVisitContract.path, fit: BoxFit.fitHeight)),
                  ] else ...[
                    SizedBox(height: 100, child: SvgPicture.asset(AppIcons.followUp.path, fit: BoxFit.fitHeight)),
                  ],
                ],
              ),
            ),
            AppSpacer.p8(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date of Visit: ', style: TextStyles.captionBold(context)),
                    if(pickUp.followupDate.isNotNull)...[
                      Text(DFU.ddMMMyyyy(DFU.toDateTIme(pickUp.followupDate!)), 
                        style: TextStyles.captionBold(context).copyWith(color: AppColors.liteRed),
                      ),
                    ]
                  ],
                ),
                _CardButton(
                  onPressed: onTap,
                  label: pickUp.isNewVisit ? 'New Visit' : 'Follow Up',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CardButton extends StatelessWidget {
  const _CardButton({required this.onPressed, required this.label});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        visualDensity: const VisualDensity(vertical: -2),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: context.textTheme.labelLarge
            ?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
