import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/presentation/bloc/can_requests/can_requests_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/ce_bloc_provider.dart';
import 'package:m11_ind/features/ce/presentation/bloc/date_filter/date_filter_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/fbo_card.dart';
import 'package:m11_ind/features/ce/presentation/widgets/day_field_widget.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/request_mode_selection_mixin.dart';
import 'package:m11_ind/widgets/widgets.dart';

class CanRequestList extends StatelessWidget with RequestModeSelectionMixin {
  CanRequestList({super.key});

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    void scrollTo() {
      final state = context.read<DateFilterCubit>().state;
      final index = state.weekDays.indexOf(state.activeDay);
      if(index == -1) return;
      _controller.jumpTo(_controller.position.maxScrollExtent/ (state.weekDays.length-1) * index);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => scrollTo());

    return AppScaffoldWidget(
      title: 'Can Request',
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        child: BlocBuilder<DateFilterCubit, DateFilter>(
          builder: (_, state) => SizedBox(
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
                  onTap: () => _fetchInitial(context),
                  date: dateTime,
                );
              },
            ),
          ),
        ),
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          final activeDay = context.activeDay;
          context
            ..cubit<CanRequests>().fetchInitial(activeDay)
            ..cubit<RequestModeCubit>().request(activeDay);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<CanRequests, InfiniteListState<FBO>>(
              builder: (_, state) {
                final count = state.maybeWhen(
                  orElse: () => 0.toString(), 
                  success: (data, reachedMax,_, __) => '${data.length} ${reachedMax ? '' : '+'}',
                );
                return Text('$count FBOs', 
                  style: TextStyles.captionBold(context),
                );
              },
            ),
            BlocBuilder<DateFilterCubit, DateFilter>(
              builder: (_, state) {
                final dayName = DFU.getDayNameFully(state.activeDay);
                return Text(dayName, style: TextStyles.titleBold(context));
              },
            ),
            AppSpacer.p12(),
            Expanded(
              child: InfiniteListViewWidget<CanRequests, FBO>(
                fetchInitial: () => _fetchInitial(context),
                fetchMore: () {
                  final activeDay = context.activeDay;
                  context.cubit<CanRequests>().fetchMore(activeDay);
                },
                emptyListText: 'No Can Requests Found',
                childBuilder: (_, fbo) => FBOCard(
                  fbo: fbo,
                  onTap: () {
                    final path = AppRoute.canRequestSubmission.path;
                    context.push(path, extra: {
                      'id': fbo.fboName,
                      'can_req_id': fbo.canReqId,
                      'name': fbo.businessName,
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
    final activeDay = context.activeDay;
    context.cubit<CanRequests>().fetchInitial(activeDay);
  }
}

