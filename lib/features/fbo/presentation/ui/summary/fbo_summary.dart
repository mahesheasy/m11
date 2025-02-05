import 'package:flutter/material.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';

class FBOSummary extends StatelessWidget {
  const FBOSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffoldWidget(
      title: 'FBO Summary',
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title: 'FBO Summary'),
      ),
      child: Center(child: Text('FBO Summary')),
    );
  }
}
