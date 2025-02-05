import 'package:flutter/material.dart';
import 'package:m11_ind/app/presentation/bloc/bluetooth_dev_connectivity/bluetooth_dev_conn_cubit.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/core/utils/attachment_selection_mixin.dart';
import 'package:m11_ind/features/ce/presentation/bloc/pick_up_summary/pick_up_summary_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/pickup_summary_builder.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/summary_tile.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/update_weight_widget.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class FBOSummaryForm extends StatelessWidget with AttahcmentSelectionMixin {
  const FBOSummaryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      decoration: BoxDecoration(
        color: AppColors.sunGlare,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: PickUpSummaryBuilder(
          builder: (state) {
            final pickUp = state.pickup;
            final form = pickUp.activeForm!;
            final totalWeight =  form.totalWeight;
            final iscanWeightImgCaptured =  form.canWeightImg.isNotNull;
            final isEmptycanImgCaptured =  form.emptyCanWeightImg.isNotNull;
            final emptyCanWeight = form.emptyCanWeight;
            final reducedWeight = form.netWeight;
            final valueStyle = context.textTheme.titleMedium?.copyWith(
              color: AppColors.white, 
              fontWeight: FontWeight.bold,
            );

            return SpacedColumn(
              defaultHeight: 6,
              margin: const EdgeInsets.all(4),
              children: [
                SummaryListTile(title: 'No.of Cans Receiving', trailing: _CansCountController()),
                InkWell(
                  onTap: () {
                    UpdateWeightWidget.openDialog(context, 'Filled Can Weight', totalWeight).then((value) {
                      if(value.isNull) return;
                      context.cubit<PickUpSummaryCubit>().updateTotalWeight(value.toString());
                    });
                  },
                  child: SummaryListTile(
                    title: 'Filled Can Weight',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SummaryTrailBtn(
                          color: AppColors.green,
                          onTap: totalWeight.isNotNull 
                            ? null 
                            : () async {
                              final readValue = await context.cubit<BluetoothDevConCubit>().getReadValue();
                              if(readValue.isNull && !context.mounted) return;
                              context.cubit<PickUpSummaryCubit>().updateTotalWeight(readValue!);
                              _capture(context);
                            },
                          child: totalWeight.isNull 
                            ? Text('GET', style: valueStyle) 
                            : Text('$totalWeight Kg',  style: valueStyle),
                        ),
                        AppSpacer.p8(),
                        Icon(Icons.photo_camera_outlined, color: iscanWeightImgCaptured ? AppColors.green : AppColors.black),
                      ],
                    ),
                  ),
                ),
                AbsorbPointer(
                  absorbing: totalWeight.isNull,
                  child: InkWell(
                    onTap: () {
                      UpdateWeightWidget.openDialog(context, 'Empty Can Weight', emptyCanWeight).then((value) {
                        if(value.isNull) return;
                        context.cubit<PickUpSummaryCubit>().updateEmptyCanWeight(value.toString());
                      });
                    },
                    child: SummaryListTile(
                      title: 'Empty Can Weight',
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SummaryTrailBtn(
                            color: AppColors.green,
                            onTap: emptyCanWeight.isNotNull 
                              ? null 
                              : () async {
                                  final readValue = await context.cubit<BluetoothDevConCubit>().getReadValue();
                                  if(readValue.isNull && !context.mounted) return;
                                  context.cubit<PickUpSummaryCubit>().updateEmptyCanWeight(readValue!);
                              },
                            child: emptyCanWeight.isNull 
                              ? Text('GET',  style: valueStyle) 
                              : Text('$emptyCanWeight Kg',  style: valueStyle),
                          ),
                          AppSpacer.p8(),
                          Icon(Icons.photo_camera_outlined, color: isEmptycanImgCaptured ? AppColors.green : AppColors.black),
                        ],
                      ),
                    ),
                  ),
                ),
                SummaryListTile(
                  title: 'Net Weight',
                  subtitle: '(Filled Can Weight - Empty Can Weight)',
                  trailing: SummaryTrailBtn(child: Text((reducedWeight ?? '--/--').toString(), 
                    style: valueStyle?.copyWith(color: AppColors.black),
                  )),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _capture(BuildContext context) async {
    final capturedFile = await captureImage();
    if (!context.mounted) return;
    if (capturedFile.isNull) {
      context.showSnackbar('File is not Captured', AppSnackBarType.info);
    } else {
      context.cubit<PickUpSummaryCubit>().addAttachment(capturedFile!);
    }
  }
}

class _CansCountController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PickUpSummaryBuilder(
      builder: (state) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: context.cubit<PickUpSummaryCubit>().decrementCan,
            child: const CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.grey,
              child: Icon(Icons.remove, size: 16, color: AppColors.white),
            ),
          ),
          AppSpacer.p8(),
          Text(state.pickup.forms.length.toString(), 
            style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          AppSpacer.p8(),
          InkWell(
            onTap: context.cubit<PickUpSummaryCubit>().incrementCan,
            child: const CircleAvatar(
              maxRadius: 10,
              backgroundColor: AppColors.grey,
              child: Icon(Icons.add, size: 16, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}


