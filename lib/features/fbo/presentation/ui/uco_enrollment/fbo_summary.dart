import 'package:flutter/material.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';

class UCOEnrollment extends StatelessWidget {
  const UCOEnrollment({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffoldWidget(
      canPop: false,
      title: 'UCO Enrollment',
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title: 'UCO Enrollment'),
      ),
      child: Center(child: Text('UCO Enrollment')),
    );
  }
}
