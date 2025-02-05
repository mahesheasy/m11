import 'package:flutter/material.dart' hide DataRow;
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/presentation/ui/fbos/widgets/fbo_summary_widget.dart';
import 'package:m11_ind/features/deo/ui/presentation/uco_deposit/widget/uco_summary_widget.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class UCODepositScrn extends StatelessWidget {
  const UCODepositScrn({super.key, required this.master});

  final String master;

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appbar: Text('UCO Deposit', style: TextStyles.appbarTextstyle(context)),
      headerWidget: const SizedBox(),
      child: SpacedColumn(
        children: [
          DataRow(title: 'Date :', value: DFU.ddMMMyyyy(DFU.now())),
          DataRow(title: 'Driver/ CE Name :', value: master),
          const Divider(),
          UCOSummaryWidget(ceId: master)
        ],
      ),
    );
  }
}
