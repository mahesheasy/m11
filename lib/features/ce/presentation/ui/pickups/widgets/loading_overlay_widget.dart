import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m11_ind/styles/app_colors.dart';

class LoadingOverlayWidget extends StatelessWidget {
  const LoadingOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blurred Background to Prevent Interaction
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.4),
          ),
        ),

        // Centered Loading Dialog
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85, // Responsive width
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Circular Progress Loader
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const CupertinoActivityIndicator(radius: 16),
                ),

                const SizedBox(height: 20),

                // Processing Message
                const Text(
                  'Processing your request...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 16),

                // Subtext Message
                const Text(
                  "Payment is under progress , Please don't press any button doesn't close or go back",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
