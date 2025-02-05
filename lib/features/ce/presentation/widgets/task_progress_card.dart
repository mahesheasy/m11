import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/icons.dart';
import 'package:m11_ind/widgets/widgets.dart';

class TaskProgressCard extends StatelessWidget {
  const TaskProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = context.textTheme.titleLarge?.copyWith(
      color: AppColors.white,
      letterSpacing: 0.5,
      fontWeight: FontWeight.bold,
    );

    return M11Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: titleTextStyle,
                children: [
                  const TextSpan(text: 'Welcome', style: TextStyle(fontSize: 14)),
                  const WidgetSpan(child: SizedBox(width: 6.0)),
                  TextSpan(text: context.user.firstName),
                ]
              ),
            ),
            const Divider(color: AppColors.white),
            AppSpacer.p4(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppIcons.m11BgLogo.toWidget(height: 68, width: 64),
                if (context.user.depoName.containsValidValue) ...[
                  Expanded(
                    child: Text(
                      '(${context.user.depoName.valueOrEmpty})',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
