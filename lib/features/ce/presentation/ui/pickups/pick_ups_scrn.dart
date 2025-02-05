import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/models/request_mode.dart';
import 'package:m11_ind/features/ce/presentation/bloc/ce_bloc_provider.dart';
import 'package:m11_ind/features/ce/presentation/bloc/date_filter/date_filter_cubit.dart';
import 'package:m11_ind/features/ce/presentation/bloc/pick_up_list/pick_up_list_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/fbo_card.dart';
import 'package:m11_ind/styles/app_colors.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/request_mode_selection_mixin.dart';
import 'package:m11_ind/widgets/widgets.dart';

class PickUpsScreen extends StatelessWidget with RequestModeSelectionMixin {
  const PickUpsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? status;
    String? query;

    return AppScaffoldWidget(
      title: 'Pick UPs',
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        child: BlocBuilder<DateFilterCubit, DateFilter>(
          builder: (_, state) => Container(
            height: 80,
            width: context.sizeOfWidth,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: AppDropDown(
              titleColor: AppColors.white,
              title: 'Day',
              defaultSelection: DFU.getDayNameFully(state.activeDay),
              items: state.weekDays.map((e) => DFU.getDayNameFully(e)).toList(),
              listItemBuilder: (_, value, b, __) => Text(
                value,
                style: TextStyles.captionBold(context),
              ),
              onSelected: (s) {
                final dayNames =
                    state.weekDays.map((e) => DFU.getDayNameFully(e)).toList();
                final index = dayNames.indexOf(s!);
                final activeDay = state.weekDays.elementAt(index);
                context
                  ..cubit<DateFilterCubit>().setActiveDayByName(s)
                  ..cubit<PickUpListCubit>().fetchInitial(Triple(activeDay, status!, query))
                  ..cubit<RequestModeCubit>().request(activeDay);
              },
            ),
          ),
        ),
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          final activeDay = context.activeDay;
          _fetchInitial(context, status, query);
          context.cubit<RequestModeCubit>().request(activeDay);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppSearchBarWidget(
                    onSearch: (q) {
                      query = q;
                      _fetchInitial(context, status, q);
                    },
                    onClear: () {
                      query = null;
                      _fetchInitial(context, status, null);
                    },
                  ),
                ),
                BlocBuilder<RequestModeCubit, RequestModeCubitState>(
                  builder: (_, state) {
                    final modes = state.maybeWhen(
                        orElse: () => <RequestMode>[], success: (data) => data);
                    if (status.isNull && modes.isNotEmpty) {
                      status ??= modes.firstOrNull?.id;
                      _fetchInitial(context, status, query);
                    }
                    return IconButton(
                      onPressed: () async {
                        final value = await showOptions(context, defaultValue: status);
                        if (value.isNull || !context.mounted) return;
                        status = value;
                        _fetchInitial(context, status, query);
                      },
                      icon: const Icon(Icons.filter_list, weight: 8),
                    );
                  },
                ),
              ],
            ),
            AppSpacer.p12(),
            Expanded(
              child: InfiniteListViewWidget<PickUpListCubit, FBO>(
                fetchInitial: () => _fetchInitial(context, status, query),
                fetchMore: () => _fetchInitial(context, status, query),
                emptyListText: 'No PickUps Found',
                childBuilder: (_, pickUp) => FBOCard(
                  fbo: pickUp,
                  onTap: () async {
                    if (!pickUp.active) {
                      AppDialog.showErrorDialog(
                        context,
                        content: 'FBO is inactive for making a purchase',
                        onTapDismiss: () => context.exit(),
                      );
                      return;
                    }
                    final path = AppRoute.pickupEntry.path;
                    final res = await  context.push<bool?>(path, extra: {
                      'name' : pickUp.fboName,
                      'latitude' : pickUp.latitude,
                      'longitude' : pickUp.longitude,
                    });
                    if (res.isTrue && context.mounted) {
                      _fetchInitial(context, status, query);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _fetchInitial(BuildContext context, String? status, String? query) {
    final activeDay = context.activeDay;

    context
        .cubit<PickUpListCubit>()
        .fetchInitial(Triple(activeDay, status!, query));
  }
}
