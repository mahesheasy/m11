import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MobileScannerOverlay extends StatelessWidget {
  const MobileScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SCAN UPI')),
      body: Stack(
        children: [
          MobileScanner(
            startDelay: true,
            onDetect: (barcode) {
              final phonePeUrl = barcode.barcodes.first.rawValue;
              if(phonePeUrl.doesNotHaveValue) {
                return;
              }
              final uri = Uri.parse(phonePeUrl!);
              final params = uri.queryParameters;
              final phonePeId = params['pa'];

              Navigator.pop(context, phonePeId);
            },
          ),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
        ],
      ),
    );
  }
}

class QRScannerOverlay extends StatelessWidget {
  const QRScannerOverlay({super.key, required this.overlayColour});

  final Color overlayColour;

  @override
  Widget build(BuildContext context) {
    final scanArea = (context.sizeOfWidth < 400 || context.sizeOfHeight < 400)
        ? 200.0
        : 330.0;
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(overlayColour, BlendMode.srcOut),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    backgroundBlendMode: BlendMode.dstOut),
              ),
              Center(
                child: Container(
                  height: scanArea,
                  width: scanArea,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: CustomPaint(
            foregroundPainter: BorderPainter(),
            child: SizedBox(
              width: scanArea + 25,
              height: scanArea + 25,
            ),
          ),
        ),
      ],
    );
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const width = 4.0;
    const radius = 20.0;
    const tRadius = 3 * radius;

    final rect = Rect.fromLTWH(
      width,
      width,
      size.width - 2 * width,
      size.height - 2 * width,
    );
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(radius));

    final clippingRects = [
      const Rect.fromLTWH(0, 0, tRadius, tRadius),
      Rect.fromLTWH(size.width - tRadius, 0, tRadius, tRadius),
      Rect.fromLTWH(0, size.height - tRadius, tRadius, tRadius),
      Rect.fromLTWH(
          size.width - tRadius, size.height - tRadius, tRadius, tRadius),
    ];

    final path = Path();
    clippingRects.forEach(path.addRect);

    canvas
      ..clipPath(path)
      ..drawRRect(
        rrect,
        Paint()
          ..color = AppColors.red
          ..style = PaintingStyle.stroke
          ..strokeWidth = width,
      );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
