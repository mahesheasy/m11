import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/core/utils/attachment_selection_mixin.dart';
import 'package:m11_ind/features/ce/presentation/bloc/pick_up_summary/pick_up_summary_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/pickup_summary_builder.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class UploadAttachmentWidget extends StatelessWidget
    with AttahcmentSelectionMixin {
  const UploadAttachmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PickUpSummaryBuilder(
      builder: (state) {
        final pickup = state.pickup;
        final attachedFile = pickup.activeForm!.canWeightImg;

        return SpacedColumn(
          defaultHeight: 0,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.green, width: 2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: attachedFile.isNull
                  ? Center(
                      child: IconButton(
                        onPressed: () async => await _capture(context),
                        icon: const Icon(Icons.add_a_photo, size: 64, color: AppColors.green),
                      ),
                    )
                  : Image.file(attachedFile!,
                      width: context.sizeOfWidth, fit: BoxFit.fitHeight),
            ),
            AppButton(
              onPressed: attachedFile.isNotNull 
                ? () async => await _capture(context)
                : () {},
              margin: const EdgeInsets.all(8.0),
              label: 'Retake',
            ),
            AppButton(
              bgColor: AppColors.green,
              onPressed: context.cubit<PickUpSummaryCubit>().completeAttachment,
                 
              margin: const EdgeInsets.all(8.0),
              label: 'Next',
            ),
          ],
        );
      },
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
