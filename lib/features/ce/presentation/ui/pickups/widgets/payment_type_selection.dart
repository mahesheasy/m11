import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/data/static_data.dart';
import 'package:m11_ind/features/ce/presentation/bloc/pick_up_summary/pick_up_summary_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/loading_overlay_widget.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/mobile_scanner_overlay.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/pickup_summary_builder.dart';
import 'package:m11_ind/widgets/widgets.dart';

class PaymentTypeSelection extends StatefulWidget {
  const PaymentTypeSelection({super.key});

  @override
  State<PaymentTypeSelection> createState() => _PaymentTypeSelectionState();
}

class _PaymentTypeSelectionState extends State<PaymentTypeSelection>
    with TickerProviderStateMixin {
  final TextEditingController controller = TextEditingController();

  bool _isLoading = false; 

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PickUpSummaryCubit, PickUpSummaryState>(
      listener: (_, state) {
        $logger.devLog('STATE: $state');
        if (state.isLoading.isTrue) {
          setState(() {
            _isLoading = true;
          });
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      },
      child: Stack(
        children: [
          PickUpSummaryBuilder(
            buildWhen: (prev, curr) {
              final paymentType =
                  prev.pickup.paymentType != curr.pickup.paymentType;
              final isLoading = prev.isLoading != curr.isLoading;
              return paymentType || isLoading;
            },
            builder: (state) {
              final pickUp = state.pickup;
              final paymentType = pickUp.paymentType;
              final isUPI = paymentType == 'UPI';
              return Column(
                children: [
                  AppDropDown(
                    key: UniqueKey(),
                    title: 'Select Payment Type : ',
                    isMandatory: true,
                    defaultSelection:
                        paymentType ?? StaticData.paymentTypes.first,
                    items: StaticData.paymentTypes,
                    onSelected: (type) async {
                      final isConfirmed =
                          await AppDialog.askForConfirmation<bool?>(
                                context,
                                buttonText: 'Cancel',
                                confirmBtnText: 'Proceed',
                                content:
                                    'Do You Want To Continue With ${type!.toUpperCase()}',
                                onTapDismiss: () => context.close(false),
                                onTapConfirm: () => context.close(true),
                              ) ??
                              false;
                      setState(() {});
                      if (context.mounted && isConfirmed) {
                        context.cubit<PickUpSummaryCubit>().updatePayment(type);
                      }
                    },
                    listItemBuilder: (_, value, b, __) => Text(value),
                  ),
                  if (isUPI) ...[
                    AppTextField(
                      // key: UniqueKey(),
                      controller: controller,
                      initialValue: state.pickup.upiId,
                      isRequired: true,
                      title: 'UPI ID',
                      onChanged: (text) {
                        context.cubit<PickUpSummaryCubit>().updateUPI(text);
                      },
                      suffixIcon: IconButton(
                        onPressed: () async {
                          final scannedUPI =
                              await showModalBottomSheet<String?>(
                            context: context,
                            builder: (BuildContext _) =>
                                const MobileScannerOverlay(),
                          );
                          if (scannedUPI?.isNotEmpty == true) {
                            setState(() {
                              controller.text = scannedUPI!;
                            });

                            if (!context.mounted) return;
                            context
                                .cubit<PickUpSummaryCubit>()
                                .updateUPI(scannedUPI!);
                          }
                        },
                        icon: const Icon(Icons.qr_code_scanner_outlined),
                      ),
                    )
                  ],
                  AppSpacer.p8(),
                  AppButton(
                    isLoading: state.isLoading,
                    onPressed: () async {
                      if (isUPI && controller.text.doesNotHaveValue) {
                        context.cubit<PickUpSummaryCubit>().showError(
                            'UPI is mandatory for making UPI payments');
                        return;
                      }

                      final isConfirmed =
                          await AppDialog.askForConfirmation<bool?>(
                                context,
                                buttonText: 'Cancel',
                                confirmBtnText: 'Proceed',
                                content:
                                    'Would you like to proceed with the payment? Selecting "Proceed" will initiate the $paymentType payment.',
                                onTapDismiss: () => context.close(false),
                                onTapConfirm: () => context.close(true),
                              ) ??
                              false;

                      if (isConfirmed) {
                        // showLoadingDialog(context);
                        context.cubit<PickUpSummaryCubit>().create();
                        // context.close();
                      }
                    },
                    label: 'Proceed',
                  ),
                ],
              );
            },
          ),
          if (_isLoading) const LoadingOverlayWidget(),
        ],
      ),
    );
  }
}
