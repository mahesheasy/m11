import 'package:flutter/material.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key, 
    required this.content,
    required this.buttonText,
    required this.onTapDismiss,
    required this.dialogType,
    this.title,
    this.onTapConfirm,
    this.confirmBtnText,
  });

  final String? title;
  final String content;
  final String buttonText;
  final VoidCallback onTapDismiss;
  final DialogType dialogType;

  final VoidCallback? onTapConfirm;
  final String? confirmBtnText;
  
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 340),
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.carla,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppSpacer.p8(),
              if (title.containsValidValue) ...[
                Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 24,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF707070),
                  ),
                  textAlign: TextAlign.center,
                ),
              ] else ...[
                AppSpacer.p4(),
              ],
              AppSpacer.p8(),
              Text(
                content,
                style: const TextStyle(
                  color: AppColors.black,
                  height: 1.5,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              AppSpacer.p32(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: AppButton(
                      label: buttonText,
                      onPressed: onTapDismiss,
                      bgColor: AppColors.white,
                      textStyle: TextStyles.btnTextStyle(context)
                          .copyWith(color: AppColors.black),
                    ),
                  ),
                  if (dialogType == DialogType.confirmRetry) ...[
                    const SizedBox(width: 24),
                    Expanded(
                      child: AppButton(
                        label: confirmBtnText!,
                        onPressed: onTapConfirm,
                        textStyle: TextStyles.btnTextStyle(context)
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
