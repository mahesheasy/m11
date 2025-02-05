import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/presentation/bloc/date_filter/date_filter_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/fbo_card.dart';
import 'package:m11_ind/features/ce/presentation/widgets/day_field_widget.dart';
import 'package:m11_ind/features/deo/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/widgets/infinite_list_widget.dart';

class FBOCanRequests extends StatelessWidget {
  FBOCanRequests({super.key});
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
      title: 'Can Requests',
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        child: BlocBuilder<DateFilterCubit, DateFilter>(
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
                    onTap: () => context.cubit<FBOCanRequestsCubit>().fetchInitial(dateTime),
                    date: dateTime,
                  );
                },
              ),
            );
          },
        ),
      ),
      child: InfiniteListViewWidget<FBOCanRequestsCubit, FBO>(
        fetchInitial: () {
          final activeDay = context.read<DateFilterCubit>().state.activeDay;
          context.cubit<FBOCanRequestsCubit>().fetchInitial(activeDay);
        },
        fetchMore: () {
          final activeDay = context.read<DateFilterCubit>().state.activeDay;
          context.cubit<FBOCanRequestsCubit>().fetchMore(activeDay);
        },
        emptyListText: 'No Can Requests Found',
        childBuilder: (_, fbo) => FBOCard(
          fbo: fbo,
          onTap: () {
            final path = AppRoute.fboCanRequestsApp.getPath();
            context.pushNamed(path, 
              extra: fbo.businessName,
              queryParameters: {
                'id' : fbo.fboName,
                'cans' : fbo.noOfCans!.toInt().toString(),
                'requesId' : fbo.canReqId.valueOrEmpty,
              }
            );
          },
        ),
      ),
    );
  }
}
