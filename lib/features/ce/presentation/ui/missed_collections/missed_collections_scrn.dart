import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/presentation/bloc/date_filter/date_filter_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/missed_collections/missed_collections.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/schedule_fbo_card.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class MissedCollectionsScrn extends StatelessWidget {
  MissedCollectionsScrn({super.key});

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    void scrollTo() {
      final state = context.read<DateFilterCubit>().state;
      final index = state.weekDays.indexOf(state.activeDay);
      if(index == -1 || _controller.positions.isEmpty) return;
      _controller.jumpTo(_controller.position.maxScrollExtent/ (state.weekDays.length-1) * index);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => scrollTo());

    return AppScaffoldWidget(
      title: 'Missed Collections',
      canPop: false,
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
                title: 'Scheduled Date',
                fillColor: AppColors.white,
                startDate: DateTime.now(),
                initialDate: DFU.ddMMyyyy(state.activeDay),
                endDate: DateTime.now().add(const Duration(days: 30)),
                onSelected: (date) {
                   context
                    ..cubit<DateFilterCubit>().setActiveDay(date)
                    ..cubit<MissedCollectionsCubit>().fetchInitial(date);
                },
              ),
            );
          },
        ),
      ),
      child: RefreshIndicator(
        onRefresh: () async => _fetchInitial(context),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<MissedCollectionsCubit, InfiniteListState<FBO>>(
                        builder: (_, state) {
                          final count = state.maybeWhen(
                            orElse: () => 0.toString(), 
                            success: (data, reachedMax,_, __) => '${data.length} ${reachedMax ? '' : '+'}',
                          );
                          return Text('$count FBOs', style: TextStyles.captionBold(context));
                        },
                      ),
                      BlocBuilder<DateFilterCubit, DateFilter>(
                        builder: (_, state) {
                          final dayName = DFU.getDayNameFully(state.activeDay);
                          return Text(dayName, style: TextStyles.titleBold(context));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppSpacer.p24(),
            Expanded(
              child: InfiniteListViewWidget<MissedCollectionsCubit, FBO>(
                fetchInitial: () => _fetchInitial(context),
                fetchMore: () => context.cubit<MissedCollectionsCubit>().fetchMore(context.activeDay),
                emptyListText: 'No Missed Collections Found',
                childBuilder: (_, coll) => ScheduleFboCard(
                  fbo: coll,
                  onTap: () {
                    final path = AppRoute.pickupEntry.path;
                    context.push(path, extra: {
                      'name' : coll.fboName,
                      'latitude' : coll.latitude,
                      'longitude' : coll.longitude,
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _fetchInitial(BuildContext context) {
    context.cubit<MissedCollectionsCubit>().fetchInitial(context.activeDay);
  }
}