import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';

class CaptionText extends StatelessWidget {
  const CaptionText({
    super.key, 
    required this.title, 
    this.isRequired = true, 
    this.color = AppColors.black,
  });

  final String title;
  final bool isRequired;
  final Color color;
  @override
  Widget build(BuildContext context) {
    if (title.doesNotHaveValue) return const SizedBox.shrink();

    return RichText(
      text: TextSpan(
        style: context.textTheme.titleSmall?.copyWith(
          color: color, 
          fontSize: 12, 
          fontWeight: FontWeight.w600, 
        ),
        children: [
          TextSpan(text: title),
          if(isRequired)...[
            const TextSpan(text: ' *', style: TextStyle(color: AppColors.red)),
          ],
        ],
      ),
    );
  }
}
