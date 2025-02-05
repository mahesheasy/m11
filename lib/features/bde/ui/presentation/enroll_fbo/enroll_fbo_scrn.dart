import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_fbo_cubit.dart';
import 'package:m11_ind/features/bde/ui/bloc/enroll_fbo/enroll_stage.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/stages/bank_details_stage.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/stages/enroll_final_stage.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/stages/follow_up_stage.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/stages/location_details.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/stages/other_remarks_stage.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/stages/remarks_stage.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/stages/uco_collection_date_stage.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/stages/upload_fbo_photo.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/widgets/enroll_fbo_bloc_builder.dart';
import 'package:m11_ind/features/bde/ui/presentation/enroll_fbo/stages/fbo_enrollment_form.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_details/fbo_details_cubit.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class EnrollFBOScrn extends StatelessWidget {
  const EnrollFBOScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appbar: EnrollFBOBlocBuilder(
        builder: (_, state) => Text(
          state.stage.toTitle(),
          style: TextStyles.appbarTextstyle(context),
        ),
      ),
      headerWidget: const SizedBox(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<FBODetailsCubit, FBODetailsCubitState>(
            listener: (_, fState) {
              fState.handle(context,
                  success: context.cubit<EnrollFboCubit>().initDetails);
            },
          ),
          BlocListener<EnrollFboCubit, EnrollFboState>(
            listener: (_, state) async {
              if (state.error.isNotNull) {
                await AppDialog.showErrorDialog(
                  context,
                  content: state.error!.error,
                  onTapDismiss: context.exit,
                );
                if (!context.mounted) return;
                context.cubit<EnrollFboCubit>().errorHandled();
              }
            },
          ),
        ],
        child: SingleChildScrollView(
          child: Column(
            children: [
              const _FormStageController(),
              EnrollFBOBlocBuilder(
                builder: (_, state) => switch (state.stage) {
                  EnrollStage.editdetails => const FBOEnrollMentForm(),
                  EnrollStage.location => const LocationDetails(),
                  EnrollStage.photo => const UploadFBOPhoto(),
                  EnrollStage.remarks => const RemarksStage(),
                  EnrollStage.notinterested => const OtherRemarksStage(),
                  EnrollStage.followup => const FollowUpStage(),
                  EnrollStage.bankdetails => const BankDetailsStage(),
                  EnrollStage.ucodateselection => const UCOCollectionDate(),
                  EnrollStage.complete => const EnrollFinalStage(),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormStageController extends StatelessWidget {
  const _FormStageController();

  @override
  Widget build(BuildContext context) {
    return EnrollFBOBlocBuilder(
      builder: (_, state) {
        final indx = state.stage.indx;
        return Visibility(
          visible: !(state.isLoading || state.isSuccess),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: context.cubit<EnrollFboCubit>().previousStep,
                icon: const Icon(Icons.arrow_back_ios),
              ),
              Text(
                indx.toString(),
                style: context.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: context.cubit<EnrollFboCubit>().moveNextStep,
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        );
      },
    );
  }
}
