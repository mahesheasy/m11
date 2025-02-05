import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/presentation/bloc/can_req_summary/can_req_summary.dart';
import 'package:m11_ind/features/ce/presentation/bloc/can_submission/can_submission_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_details/fbo_details_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/can_request/widget/can_req_sub_form.dart';
import 'package:m11_ind/features/ce/presentation/widgets/fbo_details_card.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/icons.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class CanReqSubmission extends StatelessWidget {
  const CanReqSubmission({super.key, required this.fboName});

  final String fboName;

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Can Request',
      bgImagePath: AppIcons.pickUpBg.path,
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title: 'Submit at', value: fboName),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<FBODetailsCubit, FBODetailsCubitState>(
              builder: (_, state) => state.maybeWhen(
                success: (data) => FBODetailsCard(fbo: data),
                orElse: () => const Center(child: LoadingIndicator()),
              ),
            ),
            AppSpacer.p8(),
            BlocBuilder<CanReqDetailsCubit, CanReqDetailsState>(
              builder: (_, state) => state.maybeWhen(
                success: (data) {
                  context.cubit<CanSubmissionCubit>().initCansCount(data.approvedcans);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Cans Request Details',
                        style: TextStyles.titleBold(context).copyWith(color: AppColors.black),
                      ),
                      AppSpacer.p12(),
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
                              child: TtileValueWidget2(
                                title: 'Requested No. of Cans',
                                value: data.requestedCans.toString(),
                              ),
                            ),
                            SummaryTileCard(
                              child: TtileValueWidget2(
                                title: 'Delivery Date',
                                value: DFU.fromFrappeToddMMyyyy(data.deliveryDate),
                              ),
                            ),
                            if(data.approve)...[
                              SummaryTileCard(
                                child: TtileValueWidget2(
                                  title: 'Approved By',
                                  value: data.approvedBy.valueOrEmpty,
                                  flex: 2,
                                ),
                              ),
                            ],
                            if(data.reject)...[
                              SummaryTileCard(
                                child: TtileValueWidget2(
                                  title: 'Rejected By',
                                  value: data.rejectedBy.valueOrEmpty,
                                  flex: 2,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  );
                },
                orElse: () => AppSpacer.empty(),
              ),
            ),
            AppSpacer.p8(),
            BlocBuilder<CanReqSummaryCubit, CanReqSummaryCubitState>(
              builder: (_, state) => state.maybeWhen(
                success: (data) {
                  return Column(
                    children: [
                      CanReqSubmitWidget(data),
                      BlocConsumer<CanSubmissionCubit, CanSubmissionCubitState>(
                        listener: (_, state) {
                          if(state.error.isNotNull) {
                            AppDialog.showErrorDialog(context, 
                              content: state.error!.error, 
                              onTapDismiss: context.exit,
                            ).then((_) {
                              context.cubit<CanSubmissionCubit>().clearErrorState();
                            });
                          }
                          if(state.isSuccess) {
                            AppDialog.showSuccessDialog(context, 
                              content: 'Cans Issued Successfully', 
                              onTapDismiss: context.exit,
                            ).then((_) {
                              context.cubit<CanSubmissionCubit>().clearErrorState();
                            });
                          }
                          if(state.isOTPSent) {
                            AppDialog.askForConfirmation(
                              context, 
                              content: 'OTP', 
                              onTapDismiss: () => context.close(false),
                              onTapConfirm: () => context.close(true),
                            ).then((_) {
                              context.cubit<CanSubmissionCubit>().clearOTP();
                            });
                          }
                        },
                        builder: (_, state) {
                          return AppButton(
                            label: 'SUBMIT',
                            isLoading: state.isLoading,
                            margin: const EdgeInsets.all(16),
                            onPressed: context.cubit<CanSubmissionCubit>().submitOTP,
                          );
                        },
                      ),
                    ],
                  );
                },
                orElse: () => AppSpacer.empty(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
