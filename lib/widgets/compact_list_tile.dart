import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';


class CompactListTile extends StatelessWidget {
  const CompactListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.leading,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        if(subtitle.isNotNull)...[
          Text(subtitle.valueOrEmpty, style: context.textTheme.labelSmall)
        ],
      ],
    );
  }
}

class SelectedItemBuilder extends StatelessWidget {
  const SelectedItemBuilder(this.value, {super.key});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: const TextStyle(fontSize: 16, color: AppColors.black),
      overflow: TextOverflow.ellipsis,
    );
  }
}
