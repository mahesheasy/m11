import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/presentation/bloc/date_filter/date_filter_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/fbo_card.dart';
import 'package:m11_ind/features/ce/presentation/widgets/day_field_widget.dart';
import 'package:m11_ind/features/deo/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/deo/ui/presentation/assign_bde/assign_user_widget.dart';
import 'package:m11_ind/widgets/infinite_list_widget.dart';

class AssignBDEList extends StatelessWidget {
  AssignBDEList({super.key});

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
      title: 'Assign BDE',
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
                    onTap: () => context.cubit<AssignBDEListCubit>().fetchInitial(dateTime),
                    date: dateTime,
                  );
                },
              ),
            );
          },
        ),
      ),
      child: InfiniteListViewWidget<AssignBDEListCubit, FBO>(
        fetchInitial: () => _fetchInitial(context),
        fetchMore: () {
          final activeDay = context.read<DateFilterCubit>().state.activeDay;
          context.cubit<AssignBDEListCubit>().fetchMore(activeDay);
        },
        emptyListText: 'No FBOs Found',
        childBuilder: (_, fbo) => FBOCard(
          fbo: fbo,
          onTap: () async {
            final isAssigned = await context.goToPage<bool?>(MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => DEOBlocProvider.get().bdeUsers()..request()),
                BlocProvider(create: (_) => DEOBlocProvider.get().getFBODetails()..request(fbo.fboName)),
              ],
              child: AssignUserScrn(fboId: fbo.fboName, role: AssigningRole.bde),
            ));
            if (isAssigned.isTrue && context.mounted) _fetchInitial(context);
          },
        ),
      ),
    );
  }

  void _fetchInitial(BuildContext context) {
    final activeDay = context.read<DateFilterCubit>().state.activeDay;
    context.cubit<AssignBDEListCubit>().fetchInitial(activeDay);
  }
}
