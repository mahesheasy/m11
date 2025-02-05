import 'package:flutter/material.dart';
import 'package:m11_ind/styles/app_colors.dart';

class ShapeAnimation extends StatefulWidget {
  const ShapeAnimation({super.key});

  @override
  State<ShapeAnimation> createState() => _ShapeAnimationState();
}

class _ShapeAnimationState extends State<ShapeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  // ignore: unused_field
  late Animation<double> _animation;

  int _shapeIndex = 0;

  final List<Widget Function()> _shapeBuilders = [
    _buildCircle,
    _buildRectangle,
    _buildTriangle,
    _buildRhombus,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
          _shapeIndex = (_shapeIndex + 1) % _shapeBuilders.length;
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static Widget _buildCircle() => const CircleAvatar(
        backgroundColor: Colors.black,
        radius: 8,
      );

  static Widget _buildRectangle() => Container(
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(0),
        ),
      );

  static Widget _buildTriangle() => const CustomPaint(
        painter: TrianglePainter(),
        size: Size(16, 16),
      );

  static Widget _buildRhombus() => CustomPaint(
        painter: RhombusPainter(),
        size: const Size(16, 16),
      );

  @override
  Widget build(BuildContext context) => _shapeBuilders[_shapeIndex]();
}

class RhombusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.black;
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TrianglePainter extends CustomPainter {
  const TrianglePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.black;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return false;
  }
}
