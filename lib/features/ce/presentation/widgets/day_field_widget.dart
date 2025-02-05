import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/presentation/bloc/date_filter/date_filter_cubit.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class DayFieldWidget extends StatelessWidget {
  const DayFieldWidget({super.key, required this.date, required this.onTap});

  final DateTime date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.textTheme.labelLarge?.copyWith(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      height: 1.1,
    );

    return BlocBuilder<DateFilterCubit, DateFilter>(
      builder: (_, state) {
        final isSameDay = DFU.isSameDay(state.activeDay, date);
        final style = isSameDay
            ? titleStyle
            : titleStyle?.copyWith(color: AppColors.white.withOpacity(0.6));

        return InkWell(
          onTap: () => [
            if(!isSameDay)...[
              context.cubit<DateFilterCubit>().setActiveDay(date),
              onTap.call(),
            ]
          ],
          child: IntrinsicHeight(
            child: SpacedColumn(
              margin: const EdgeInsets.only(right: 32, bottom: 4.0),
              defaultHeight: 0,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DFU.getDayName(date), style: style?.copyWith(fontSize: 14)),
                Text(date.day.toString(), style: style?.copyWith(fontSize: 38)),
              ],
            ),
          ),
        );
      },
    );
  }
}
