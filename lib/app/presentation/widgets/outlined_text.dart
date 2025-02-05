import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';

class OutlinedText extends StatelessWidget {
  const OutlinedText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: context.textTheme.titleLarge?.copyWith(
            foreground: Paint()..color = AppColors.green, fontWeight: FontWeight.bold, letterSpacing: .5),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: context.textTheme.titleLarge?.copyWith(
            letterSpacing: .5,
            foreground: Paint()
              ..strokeWidth = 1
              ..color = AppColors.white
              ..style = PaintingStyle.stroke,
          ),
        ),
      ],
    );
  }
}