import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/app/presentation/bloc/location_distance/location_distance_cubit.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_details/fbo_details_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/pick_up_summary/pick_up_summary_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/pickup_remarks_scrn.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/payment_type_selection.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/pick_up_summary_form.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/pick_up_summary_widget.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/pickup_summary_builder.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/upload_attachment_widget.dart';
import 'package:m11_ind/features/ce/presentation/widgets/fbo_details_card.dart';
import 'package:m11_ind/features/commons/widgets/grn_pdf_widget.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/icons.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class PickUpEntryScrn extends StatelessWidget {
  const PickUpEntryScrn({super.key, required this.fboId});

  final String fboId;
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Pick Up',
      bgImagePath: AppIcons.pickUpBg.path,
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title: 'Pick Up', value: fboId),
      ),
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) return;

          final shouldPop = await AppDialog.askForConfirmation<bool?>(
                context,
                content: 'Are you sure Do you want to close?',
                onTapDismiss: () => context.close(false),
                onTapConfirm: () => context.close(true),
              ) ??
              false;
          if (context.mounted && shouldPop) context.close();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(4),
          child: BlocBuilder<FBODetailsCubit, FBODetailsCubitState>(
            builder: (_, state) {
              return state.maybeWhen(
                orElse: () => const Center(child: LoadingIndicator()),
                success: (fboDetails) {
                  context.cubit<PickUpSummaryCubit>().initFBO(fboDetails);
                  return SpacedColumn(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration(
                            color: AppColors.bleachedSilk,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(Icons.directions_run_rounded),
                              BlocBuilder<LocationDistanceCubit,
                                  LocationDistanceState>(
                                builder: (_, state) {
                                  if (state.isLoading) {
                                    return const CupertinoActivityIndicator();
                                  }
                                  if (!state.isSuccess) {
                                    return const SizedBox.shrink();
                                  }
                                  return Text(state.distance.valueOrEmpty);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      FBODetailsCard(fbo: fboDetails),
                      AppSpacer.p12(),
                      _PickUPFormWidget(fboDetails: fboDetails),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PickUPFormWidget extends StatefulWidget {
  const _PickUPFormWidget({required this.fboDetails});

  final FBODetails fboDetails;

  @override
  State<_PickUPFormWidget> createState() => _PickUPFormWidgetState();
}

class _PickUPFormWidgetState extends State<_PickUPFormWidget>
    with TickerProviderStateMixin {
  final TextEditingController controller = TextEditingController();

  late AnimationController _rotationController;
  late AnimationController _scaleController;
  late AnimationController _colorController;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    super.initState();
    controller.selection =
        TextSelection.collapsed(offset: controller.text.length);

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _colorTween = _colorController.drive(
      ColorTween(begin: Colors.purple, end: Colors.blue),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _scaleController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context
        .read<LocationDistanceCubit>()
        .getDistance(widget.fboDetails.latitude, widget.fboDetails.longitude);
    return Column(
      children: [
        PickUpSummaryBuilder(
          listener: (state) {
            if (state.isSuccess) {
              final successMsg = state.mode == ViewMode.initial
                  ? 'Visit Updated successfully'
                  : 'Pick up completed successfully. Please Proceed with Payment.';
              AppDialog.showSuccessDialog(
                context,
                content: successMsg,
                onTapDismiss: () => context.exit(true),
              ).then((_) async {
                context.cubit<PickUpSummaryCubit>().errorHandled();

                if (state.prdetails.isNotNull) {
                  await context
                      .goToPage(GRNPrintWidget.downloadPDF(state.prdetails!));
                }
                if (!context.mounted) return;
                context.close(true);
              });
            }
            if (state.error.isNotNull) {
              AppDialog.showErrorDialog(
                context,
                content: state.error!.error,
                onTapDismiss: () => context.exit(),
              ).then((_) {
                context.cubit<PickUpSummaryCubit>().errorHandled();
              });
            }
          },
          builder: (state) {
            final sectionLabel = switch (state.mode) {
              ViewMode.initial => 'Select Entry Mode',
              ViewMode.form => 'Enter PickUp Details',
              ViewMode.summary => 'PickUp Summary',
              ViewMode.payment => 'Payment',
              ViewMode.verification => 'Verification',
              ViewMode.grnView => 'Purchase Receipt',
            };
            final pickUp = state.pickup;
            final total = pickUp.forms.length;
            final isFileUploaded =
                pickUp.forms.where((e) => e.isFileCaptured).length;
            final isAllProcessed = isFileUploaded == total;

            final isWeightCalculated = pickUp.activeForm?.netWeight.isNotNull;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (state.mode == ViewMode.initial) ...[
                  if (widget.fboDetails.isValidCoordinates) ...[
                    Column(
                      children: [
                        BlocBuilder<LocationDistanceCubit,
                            LocationDistanceState>(
                          builder: (_, state) {
                            // if (state.isLoading) {
                            //   return const LoadingIndicator();
                            // }
                            if (state.isSuccess ||
                                state.isInitial ||
                                state.isLoading) {
                              return Column(
                                  children: _buildOptions(context, state));
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                  ] else ...[
                    Column(
                      children: [
                        AppButton(
                          onPressed: () => context
                              .goToPage(BlocProvider.value(
                                value: context.cubit<PickUpSummaryCubit>(),
                                child:
                                    PickUpRemarksScrn(fbo: widget.fboDetails),
                              ))
                              .then((_) => context.close()),
                          bgColor: const Color(0XFFC5DBFD),
                          textStyle: TextStyles.btnTextStyle(context).copyWith(
                            color: const Color(0XFF144BD0),
                          ),
                          icon: const Icon(Icons.bus_alert_outlined,
                              color: Color(0XFF144BD0)),
                          margin: const EdgeInsets.all(8.0),
                          label: 'Add Visit Remarks',
                        ),
                        AppButton(
                          icon: const Icon(Icons.inventory_2_outlined,
                              color: AppColors.white),
                          onPressed:
                              context.cubit<PickUpSummaryCubit>().editPickUp,
                          margin: const EdgeInsets.all(8.0),
                          label: 'New Pick Up',
                        ),
                      ],
                    ),
                  ],
                ] else ...[
                  if (state.mode == ViewMode.summary) ...[
                    const FBOSummaryWidget(),
                  ] else if (state.mode == ViewMode.payment) ...[
                    const PaymentTypeSelection(),
                  ] else if (pickUp.activeForm.isNotNull) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(sectionLabel, style: TextStyles.k10(context)),
                        if (!isAllProcessed) ...[
                          Text('${isFileUploaded + 1} / $total'),
                        ],
                      ],
                    ),
                    if (pickUp.activeForm!.isProcessed) ...[
                      const UploadAttachmentWidget(),
                    ] else ...[
                      const FBOSummaryForm(),
                      // AbsorbPointer(
                      // absorbing: widget.fboDetails.fssaiNumber.containsValidValue,
                      // child:
                      AppButton(
                        onPressed: isWeightCalculated.isTrue
                            ? context.cubit<PickUpSummaryCubit>().process
                            : null,
                        margin: const EdgeInsets.all(12.0),
                        label: 'Next',
                      ),
                      // ),
                    ],
                  ],
                ],
              ],
            );
          },
        ),
      ],
    );
  }

  List<Widget> _buildOptions(
      BuildContext context, LocationDistanceState state) {
    print('state======$state');

    void handleAction(Function onSuccess) {
      if (state.isWithInRange) {
        onSuccess();
      } else {
        AppDialog.showErrorDialog(
          context,
          content:
              "You cannot make a purchase because you are ${state.distance} away from the FBO's location. Purchase will be allowed when you are within a 300-meter range.",
          onTapDismiss: context.exit,
        );
      }
    }

    return [
      AppButton(
        icon: const Icon(Icons.inventory_2_outlined, color: AppColors.white),
        onPressed: () =>
            handleAction(context.cubit<PickUpSummaryCubit>().editPickUp),
        margin: const EdgeInsets.all(8.0),
        label: 'New Pick Up',
      ),
      AppButton(
        onPressed: () => handleAction(() {
          context
              .goToPage(BlocProvider.value(
                value: context.cubit<PickUpSummaryCubit>(),
                child: PickUpRemarksScrn(fbo: widget.fboDetails),
              ))
              .then(
                (value) => context.pop(),
              )
              .then((_) => context.pop());
        }),
        bgColor: const Color(0XFFC5DBFD),
        textStyle: TextStyles.btnTextStyle(context).copyWith(
          color: const Color(0XFF144BD0),
        ),
        icon: const Icon(Icons.bus_alert_outlined, color: Color(0XFF144BD0)),
        margin: const EdgeInsets.all(8.0),
        label: 'Add Visit Remarks',
      ),
    ];
  }

  Future<void> showLoadingDialog(BuildContext parentContext) async {
    showDialog(
      context: parentContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async =>
              false, // Prevent dialog dismissal via back button
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                  animation: _rotationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotationController.value * 2 * 3.1415926,
                      child: child,
                    );
                  },
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: 1 + (_scaleController.value * 0.3),
                        child: child,
                      );
                    },
                    child: AnimatedBuilder(
                      animation: _colorController,
                      builder: (context, child) {
                        return Icon(
                          Icons.sync,
                          size: 50,
                          color: _colorTween.value,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Payment is under progress. Please don't press any button, close, or go back.",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
