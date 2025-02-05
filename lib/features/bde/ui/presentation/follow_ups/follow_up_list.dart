import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/bde/ui/presentation/follow_ups/widget/follow_up_card.dart';
import 'package:m11_ind/features/ce/presentation/bloc/date_filter/date_filter_cubit.dart';
import 'package:m11_ind/features/fbo/models/fbo_details.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/widgets/widgets.dart';

class FollowUpList extends StatelessWidget {
  const FollowUpList({super.key});
  @override
  Widget build(BuildContext context) {

    return AppScaffoldWidget(
      canPop: false,
      title: 'Follow Ups',
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        left: 0,
        right: 0,
        child: BlocBuilder<DateFilterCubit, DateFilter>(
          builder: (_, state) {
            return Container(
              height: 100,
              width: context.sizeOfWidth,
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              child: AppDateField(
                title: 'Follow Up',
                fillColor: AppColors.white,
                startDate: DateTime.now(),
                initialDate: DFU.ddMMyyyy(state.activeDay),
                endDate: DateTime.now().add(const Duration(days: 30)),
                onSelected: (date) {
                   context
                    ..cubit<DateFilterCubit>().setActiveDay(date)
                    ..cubit<FollowUPListCubit>().fetchInitial(date);
                },
              ),
            );
          },
        ),
      ),
      child: RefreshIndicator(
        onRefresh: () async => _fetchInitial(context),
        child: InfiniteListViewWidget<FollowUPListCubit, FBODetails>(
          fetchInitial: () => _fetchInitial(context),
          fetchMore: () {
            final activeDay = context.read<DateFilterCubit>().state.activeDay;
            context.cubit<FollowUPListCubit>().fetchMore(activeDay);
          },
          emptyListText: 'No FollowUps Found',
          childBuilder: (_, pickUp) => FollowUpCard(
            pickUp: pickUp,
            onTap: () async {
              final path = AppRoute.updateFBO.path;
              final res = await context.push<bool?>(path, extra: pickUp);
              if(res.isTrue && context.mounted) _fetchInitial(context);
            },
          ),
        ),
      ),
    );
  }

  void _fetchInitial(BuildContext context) {
    final activeDay = context.activeDay;
    context.cubit<FollowUPListCubit>().fetchInitial(activeDay);
  }
}
