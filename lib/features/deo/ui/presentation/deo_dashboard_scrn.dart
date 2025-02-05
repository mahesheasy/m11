import 'package:flutter/material.dart';
import 'package:m11_ind/app/presentation/ui/app_end_drawer.dart';
import 'package:m11_ind/app/presentation/widgets/accessible_features.dart';
import 'package:m11_ind/app/presentation/widgets/drawer_icon_btn.dart';
import 'package:m11_ind/features/ce/presentation/widgets/task_progress_card.dart';
import 'package:m11_ind/widgets/widgets.dart';

class DEODashboardScrn extends StatelessWidget {
  const DEODashboardScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: const [DrawerIconBtn()],
      ),
      endDrawer: const AppEndDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TaskProgressCard(),
            AppSpacer.p32(),
            const AccessibleFeatures(),
          ],
        ),
      ),
    );
  }
}
