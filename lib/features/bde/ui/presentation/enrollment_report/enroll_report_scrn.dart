import 'package:flutter/material.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/features/bde/ui/presentation/enrollment_report/report_widget_full.dart';

class EnrollReportScrn extends StatelessWidget {
  const EnrollReportScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffoldWidget(
      canPop: false,
      title: 'Enrollment Report',
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title:  'Enrollment Report'),
      ),
      child: ReportWidget(),
    );
  }
}
