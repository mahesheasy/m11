import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class SuccessContent extends StatelessWidget {
  const SuccessContent({
    super.key,
    this.title,
    required this.content,
    this.buttonText = 'Thank you',
    required this.onTapDismiss,
  });

  final String? title;
  final String content;
  final String buttonText;
  final VoidCallback onTapDismiss;

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
            borderRadius: BorderRadius.circular(0),
          ),
          child: SpacedColumn(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (title.containsValidValue) ...[
                Text(
                  title.valueOrEmpty,
                  style: TextStyles.labelLarge(context)
                ),
              ],
              Text(
                content,
                textAlign: TextAlign.center,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppSpacer.p32(),
              ElevatedButton(
                onPressed: onTapDismiss,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)
                  )
                ),
                child: Text(
                  buttonText,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
