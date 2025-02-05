import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/widgets/enroll_fbo_bloc_builder.dart';
import 'package:m11_ind/styles/icons.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EnrollFinalStage extends StatefulWidget {
  const EnrollFinalStage({super.key});

  @override
  State<EnrollFinalStage> createState() => _EnrollFinalStageState();
}

class _EnrollFinalStageState extends State<EnrollFinalStage> {
  @override
  Widget build(BuildContext context) {
    return EnrollFBOBlocBuilder(
      builder: (_, state) {
        final isEnrolling = state.form.isEnrolling;
        final isFollowUp = state.form.isFollowUp;
        final isNotInterested = state.form.isNotInterested;

        if (state.isLoading) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: LoadingIndicator()),
                AppSpacer.p24(),
                Text(
                  'Please wait...!'.toUpperCase(),
                  style: TextStyles.k14Bold(context),
                ),
              ],
            ),
          );
        }

        if (state.error.isNotNull) {
          return AppFailureWidget(
            message: state.error!.error.valueOrEmpty,
            btnText: 'Try Again',
            onPress: context.cubit<EnrollFboCubit>().complete,
          );
        }

        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isNotInterested.isTrue) ...[
                SvgPicture.asset(AppIcons.notInterested.path),
              ] else ...[
                SvgPicture.asset(AppIcons.scheduledImage.path),
              ],
              AppSpacer.p12(),
              if (isEnrolling.isTrue) ...[
                Text(
                  'Thank You, The date for UCO collection has been saved successfully! ',
                  style: TextStyles.labelLarge(context),
                  textAlign: TextAlign.center,
                ),
              ],
              if (isFollowUp.isTrue) ...[
                Text(
                  'Thank You, The follow-up date has been saved successfully!',
                  style: TextStyles.labelLarge(context),
                  textAlign: TextAlign.center,
                ),
              ],
              if (isNotInterested.isTrue) ...[
                Text(
                  'Thank You, Your feedback has been saved successfully!',
                  style: TextStyles.labelLarge(context),
                  textAlign: TextAlign.center,
                ),
              ],
              AppSpacer.p12(),
              AppButton(
                label: 'COMPLETE',
                margin: const EdgeInsets.all(12.0),
                onPressed: () => context.close(true),
              ),
            ],
          ),
        );
      },
    );
  }
}
