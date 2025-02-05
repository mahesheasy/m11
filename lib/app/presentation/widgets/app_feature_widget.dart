import 'package:flutter/material.dart';
import 'package:m11_ind/app/presentation/widgets/outlined_text.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/styles/icons.dart';
import 'package:m11_ind/widgets/widgets.dart';

class AppFeatureWidget extends StatelessWidget {
  const AppFeatureWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final AppIcon icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: M11Card(
        child: Stack(
          children: [
            SpacedColumn(
              defaultHeight: 0,
              margin: const EdgeInsets.all(8.0),
              children: [
                OutlinedText(text: title),
                Expanded(
                  child: icon.toWidget(
                    width: context.sizeOfWidth,
                    height: context.sizeOfHeight,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
