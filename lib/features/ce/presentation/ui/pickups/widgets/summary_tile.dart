import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';

class SummaryListTile extends StatelessWidget {
  const SummaryListTile({super.key, required this.title, required this.trailing, this.subtitle});

  final String title;
  final String? subtitle;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 6),
      subtitle: subtitle.isNotNull ? Text(subtitle!) : null,
      titleTextStyle:
          context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      subtitleTextStyle: 
          context.textTheme.labelSmall?.copyWith(color: AppColors.black),
      tileColor: Colors.white,
      title: Text(title),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: trailing,
      ),
    );
  }
}

class SummaryTrailBtn extends StatelessWidget {
  const SummaryTrailBtn({super.key, this.onTap, required this.child, this.color});

  final Widget child;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        backgroundColor: color ?? AppColors.white,
        visualDensity: const VisualDensity(vertical: -2),
        disabledBackgroundColor: color ?? AppColors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: color.isNotNull ? AppColors.white : AppColors.green, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onPressed: onTap,
      child: child,
    );
  }
}

