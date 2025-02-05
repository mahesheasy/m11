import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/bloc/location_distance/location_distance_cubit.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/presentation/bloc/pick_up_summary/pick_up_summary_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/pickup_remarks_scrn.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class ScheduleFboCard extends StatelessWidget {
  const ScheduleFboCard({super.key, required this.fbo, required this.onTap});

  final FBO fbo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          LocationDistanceCubit()..getDistance(fbo.latitude, fbo.longitude),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 1,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: AppColors.grey),
          ),
          color: fbo.isFollowUp ? AppColors.elote : AppColors.white,
          surfaceTintColor: AppColors.white,
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
                    const Icon(Icons.pin_drop),
                    CircleAvatar(
                      backgroundColor:
                          fbo.active ? AppColors.green : AppColors.red,
                      radius: 6,
                    ),
                  ],
                ),
                subtitle:
                    BlocBuilder<LocationDistanceCubit, LocationDistanceState>(
                  builder: (_, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fbo.primaryAddress),
                        if (state.isSuccess) ...[
                          AppSpacer.p4(),
                          Text(state.distance.valueOrEmpty,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ],
                    );
                  },
                ),
              ),
              AppSpacer.p8(),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const VerticalDivider(
                        thickness: 1, color: AppColors.green, width: 0),
                    Expanded(
                      child: FittedBox(
                        child: _LabelTextWidget(
                          pair: Pair('Visit Remarks', fbo.visitRemarks!),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                        thickness: 1, color: AppColors.green, width: 0),
                    Expanded(
                      child: FittedBox(
                        child: _LabelTextWidget(
                          pair: Pair('Other Remarks', fbo.otherRemarks!),
                        ),
                      ),
                    ),
                    const VerticalDivider(thickness: 1, color: AppColors.green),
                  ],
                ),
              ),
              AppSpacer.p4(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Scheduled date : ',
                          style: TextStyles.captionBold(context)),
                      if (fbo.scheduledDate.containsValidValue) ...[
                        Text(
                          DFU.fromFrappeToddMMyyyy(fbo.scheduledDate),
                          style: TextStyles.captionBold(context)
                              .copyWith(color: AppColors.red),
                        ),
                      ],
                    ],
                  ),
                  // BlocProvider(create: (_) => $sl.get<PickUpSummaryCubit>()),
                  _ReScheduleButton(
                    onPressed: () => context.goToPage(BlocProvider(
                      create: (_) => $sl.get<PickUpSummaryCubit>()..initFBO2(fbo),
                      child: PickUpRemarksScrn(fbo: FBODetails.fromFOB(fbo)),
                    )),
                    title: 'RE SCHEDULE',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReScheduleButton extends StatelessWidget {
  const _ReScheduleButton({required this.onPressed, required this.title});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.haintBlue,
        visualDensity: const VisualDensity(vertical: -2),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      ),
      onPressed: onPressed,
      icon: Transform(
        transform: Matrix4.rotationY(3.14),
        alignment: Alignment.center,
        child: const Icon(Icons.reply, color: AppColors.white, size: 18),
      ),
      label: Text(
        title,
        style: context.textTheme.labelLarge
            ?.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _LabelTextWidget extends StatelessWidget {
  const _LabelTextWidget({required this.pair});

  final Pair<String, String> pair;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(pair.first, style: TextStyles.captionBold(context).copyWith(color: AppColors.green)),
        Text(pair.second, style: TextStyles.titleSmall(context)),
      ],
    );
  }
}
