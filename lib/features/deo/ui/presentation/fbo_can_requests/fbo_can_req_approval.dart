import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_details/fbo_details_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/summary_tile.dart';
import 'package:m11_ind/features/ce/presentation/widgets/fbo_details_card.dart';
import 'package:m11_ind/features/deo/model/app_rej_input.dart';
import 'package:m11_ind/features/deo/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class FBOCanReqApproval extends StatelessWidget {
  const FBOCanReqApproval({
    super.key,
    required this.canReqId,
    required this.cans,
  });

  final String canReqId;
  final double cans;

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Can Request Approval',
      headerWidget: const Positioned(
        top: kTextTabBarHeight + 32,
        child: PageHeaderWidget(title: 'Approve / Reject'),
      ),
      child: BlocBuilder<FBODetailsCubit, FBODetailsCubitState>(
        builder: (_, state) => state.maybeWhen(
          initial: () => const SizedBox.shrink(),
          success: (data) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FBODetailsCard(fbo: data),
                _ApprovalBlocConsumer(
                  builder: (s1, s2) => _CanApprovalForm(
                    canReqId: canReqId, 
                    reqCans: cans,
                  ),
                ),
              ],
            ),
          ),
          orElse: () => const Center(child: LoadingIndicator()),
        ),
      ),
    );
  }
}

class _CanApprovalForm extends StatefulWidget {
  const _CanApprovalForm({required this.canReqId, required this.reqCans});

  final String canReqId;
  final double reqCans;
  @override
  State<_CanApprovalForm> createState() => _CanApprovalFormState();
}

class _CanApprovalFormState extends State<_CanApprovalForm> {
  double cans = 0;
  String? deliveryDate;

  @override
  void initState() {
    super.initState();
    cans = widget.reqCans;
  }

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      defaultHeight: 12.0,
      children: [
        AppSpacer.p12(),
        AppDateField(
          hintText: 'Select Can Delivery Date',
          title: 'Delivery Date (On Approve)', 
          startDate: DFU.now(), 
          endDate: DFU.now().add(const Duration(days: 60)), 
          onSelected: (date) {
            setState(() {
              deliveryDate = DFU.ddMMyyyy(date);
            });
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          decoration: BoxDecoration(
            color: AppColors.sunGlare,
            border: Border.all(color: AppColors.carla),
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.all(6),
          child: Material(
            color: AppColors.white,
            child: SummaryListTile(
              title: 'No. of Extra Cans',
              trailing: _CansCountController(
                decrement: () {
                  if (cans == 1) return;
                  setState(() => cans--);
                },
                increment: () {
                  setState(() => cans++);
                },
                value: cans.toStringAsFixed(0),
              ),
            ),
          ),
        ),
        AppButton(
          label: 'Reject',
          bgColor: AppColors.liteRed,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          onPressed: () async {
            final reson = await showReasonDialog(context);
            if (reson.containsValidValue && context.mounted) {
              final inp = RejectCanReqInput(
                  canReqId: widget.canReqId, reason: reson.valueOrEmpty);
              context.cubit<RejectCanReqCubit>().request(inp);
            }
          },
        ),
        AppButton(
          label: 'Confirm',
          margin: const EdgeInsets.symmetric(horizontal: 12),
          onPressed: () async {
            final isAccepted = await AppDialog.askForConfirmation<bool?>(
              context,
              content: 'Would you like to Approve FBOs can request.',
              onTapDismiss: () => context.close(true),
              onTapConfirm: () => context.close(true),
            );
            if (isAccepted.isTrue && context.mounted) {
              if(deliveryDate == null) {
                context.showSnackbar('Select Can Delivery Date', AppSnackBarType.error);
                return;
              }
              final inp = ApproveCanRequest(
                canReqId: widget.canReqId, 
                approvedCans: cans.toInt(),
                date: deliveryDate!,
              );
              context.cubit<ApproveCanReqCubit>().request(inp);
            }
          },
        ),
      ],
    );
  }

  Future<String?> showReasonDialog(BuildContext context) {
    return showDialog(
        context: context, builder: (ctx) => const RejectReasonDialog());
  }
}

class _CansCountController extends StatelessWidget {
  const _CansCountController({
    required this.increment,
    required this.decrement,
    required this.value,
  });

  final VoidCallback increment;
  final VoidCallback decrement;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: decrement,
          child: const CircleAvatar(
            radius: 10,
            backgroundColor: AppColors.grey,
            child: Icon(Icons.remove, size: 16, color: AppColors.white),
          ),
        ),
        AppSpacer.p8(),
        Text(value,
            style: context.textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        AppSpacer.p8(),
        InkWell(
          onTap: increment,
          child: const CircleAvatar(
            maxRadius: 10,
            backgroundColor: AppColors.grey,
            child: Icon(Icons.add, size: 16, color: AppColors.white),
          ),
        ),
      ],
    );
  }
}

class _ApprovalBlocConsumer extends StatelessWidget {
  const _ApprovalBlocConsumer({required this.builder});

  final Widget Function(ApproveCanReqState s1, RejectCanReqState s2) builder;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ApproveCanReqCubit, ApproveCanReqState>(
          listener: (_, state) {
            state.handle(context, 
              success: (data) {
                AppDialog.showSuccessDialog(context, 
                  content: 'Can Request has been Approved successfully', 
                  onTapDismiss: context.exit,
                ).then((_) => context.close());
              },
            );
          },
        ),
        BlocListener<RejectCanReqCubit, RejectCanReqState>(
          listener: (_, state) {
            state.handle(context, 
              success: (data) {
                AppDialog.showSuccessDialog(context, 
                  content: 'Can Request has been Rejected successfully', 
                  onTapDismiss: context.exit,
                ).then((_) => context.close());
              },
            );
          },
        ),
      ],
      child: BlocBuilder<ApproveCanReqCubit, ApproveCanReqState>(
        builder: (_, state1) {
          return BlocBuilder<RejectCanReqCubit, RejectCanReqState>(
            builder: (_, state2) => builder(state1, state2),
          );
        },
      ),
    );
  }
}
