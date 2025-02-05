import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/presentation/bloc/collection_report/collection_report_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/date_filter/date_filter_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/collection_report/report_widget.dart';
import 'package:m11_ind/features/ce/presentation/widgets/day_field_widget.dart';

class CollectionReportScrn extends StatelessWidget {
  CollectionReportScrn({super.key});

  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    void scrollTo() {
      final state = context.read<DateFilterCubit>().state;
      final index = state.weekDays.indexOf(state.activeDay);
      if (index == -1) return;
      _controller.jumpTo(_controller.position.maxScrollExtent /
          (state.weekDays.length - 1) *
          index);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => scrollTo());

    return AppScaffoldWidget(
      canPop: false,
      title: 'Collection Report',
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        child: BlocBuilder<DateFilterCubit, DateFilter>(
          buildWhen: (previous, current) => previous.activeDay != current.activeDay,
          builder: (_, state) {
            return SizedBox(
              height: 80,
              width: context.sizeOfWidth,
              child: ListView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                itemCount: state.weekDays.length,
                itemBuilder: (context, index) {
                  final dateTime = state.weekDays[index];
                  return DayFieldWidget(
                    onTap: () => context.cubit<CollectionReportCubit>().request(dateTime),
                    date: dateTime,
                  );
                },
              ),
            );
          },
        ),
      ),
      child: const ReportWidget(),
    );
  }
}
