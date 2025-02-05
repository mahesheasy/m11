import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/deo/model/deo_montly_report.dart';
import 'package:m11_ind/features/deo/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/deo/ui/presentation/monthly_report/monthly_report_widget.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class MonthlyReportScrn extends StatefulWidget {
  const MonthlyReportScrn({super.key});

  @override
  State<MonthlyReportScrn> createState() => _MonthlyReportScrnState();
}

class _MonthlyReportScrnState extends State<MonthlyReportScrn> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appbar: Text('Monthly Report', style: TextStyles.appbarTextstyle(context)),
      headerWidget: const SizedBox(),
      margin: const EdgeInsets.only(top: 24, right: 12.0),
      child: BlocBuilder<MonthlyReportCubit, MonthlyReportState>(
        builder: (_, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: LoadingIndicator()),
            failure: (failure) => AppFailureWidget(
              message: failure.error,
              onPress: context.cubit<MonthlyReportCubit>().request,
            ),
            success: (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NavigationRail(
                    backgroundColor: AppColors.white,
                    indicatorShape: const RoundedRectangleBorder(),
                    useIndicator: false,
                    labelType: NavigationRailLabelType.selected,
                    selectedLabelTextStyle: context.textTheme.labelMedium?.copyWith(
                      color: AppColors.white
                    ),
                    destinations: [
                      const NavigationRailDestination(
                        indicatorColor: AppColors.green,
                        disabled: true,
                        icon: _ReportSectionRail(isSelected: true, label: 'Summary'),
                        label: SizedBox.shrink(),
                      ),
                      NavigationRailDestination(
                        indicatorColor: AppColors.green,
                        icon: _ReportSectionRail(isSelected: selectedIndex == 1, label: 'Gate Entry'),
                        label: const SizedBox.shrink(),
                      ),
                      NavigationRailDestination(
                        icon: _ReportSectionRail(isSelected: selectedIndex == 2, label: 'Gate Exit'),
                        label: const SizedBox.shrink(),
                      ),
                      NavigationRailDestination(
                        icon: _ReportSectionRail(isSelected: selectedIndex == 3, label: 'UCO Deposit'),
                        label: const SizedBox.shrink(),
                      ),
                      NavigationRailDestination(
                        icon: _ReportSectionRail(isSelected: selectedIndex == 4, label: 'Can Requests'),
                        label: const SizedBox.shrink(),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                  Expanded(
                    child: [
                      const SizedBox(),
                      MonthlyReportWidget(
                        headers: const ['Date', 'Gate Entries'],
                        data: data.entries,
                      ),
                      MonthlyReportWidget(
                        headers: const ['Date', 'Gate Exits'],
                        data: data.exits,
                      ),
                      MonthlyReportWidget(
                        headers: const ['Date', 'UCO Deposits'],
                        data: data.ucoDeposits,
                      ),
                      MonthlyReportWidget(
                        headers: const ['Date', 'Can Requests'],
                        data: data.canRequests,
                      ),
                    ].elementAt(selectedIndex),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _ReportSectionRail extends StatelessWidget {
  const _ReportSectionRail({required this.isSelected, required this.label});


  final bool isSelected;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(12),
      color: isSelected ? AppColors.green : AppColors.white,
      child: Text(label, style: context.textTheme.titleMedium?.copyWith(
        color: isSelected ? AppColors.white : AppColors.black, 
      )),
    );
  }
}
