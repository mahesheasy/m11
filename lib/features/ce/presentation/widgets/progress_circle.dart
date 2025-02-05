import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:m11_ind/styles/app_colors.dart';

double deg2rad(double deg) => deg * math.pi / 180;

class ProgressCricle extends CustomPainter {
  const ProgressCricle({required this.progressValue});

  final double progressValue;
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final rect =
        Rect.fromCenter(center: center, width: size.width, height: size.height);

    final paint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
    canvas.drawArc(rect, deg2rad(0), deg2rad(360), false, paint);

    final whiteBackground = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8
      ..color = AppColors.white;

    canvas.drawArc(rect, deg2rad(-90), deg2rad(360 * progressValue), false, whiteBackground);

    final progressBarPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0
      ..color = const Color(0xffADD6A0);
    canvas.drawArc(rect, deg2rad(-90), deg2rad(360 * progressValue), false, progressBarPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
