import 'package:flutter/material.dart';
import 'package:m11_ind/app/presentation/ui/app_end_drawer.dart';
import 'package:m11_ind/app/presentation/widgets/accessible_features.dart';
import 'package:m11_ind/app/presentation/widgets/drawer_icon_btn.dart';
import 'package:m11_ind/features/ce/presentation/widgets/task_progress_card.dart';
import 'package:m11_ind/widgets/app_spacer.dart';
import 'package:m11_ind/widgets/bluetooth_connection_widget.dart';

class CEDashBoardScrn extends StatelessWidget {
  const CEDashBoardScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [BluetoothConnectionIcon(), DrawerIconBtn()],
          ),
        ],
      ),
      endDrawer: const AppEndDrawer(),
      body: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TaskProgressCard(),
            AppSpacer(height: 64),
            AccessibleFeatures(),
          ],
        ),
      ),
    );
  }
}
