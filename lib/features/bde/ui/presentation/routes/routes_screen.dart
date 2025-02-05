import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/model/route_master.dart';
import 'package:m11_ind/features/bde/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/presentation/bloc/date_filter/date_filter_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/fbo_card.dart';
import 'package:m11_ind/styles/text_styles.dart';
import 'package:m11_ind/widgets/widgets.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? route;
    String? query;

    return AppScaffoldWidget(
      title: 'Routes',
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        child: SizedBox(
          height: 80,
          width: context.sizeOfWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BlocBuilder<RouteMasterCubit, RouteMasterState>(
              builder: (_, state) {
                final data = state.maybeWhen(
                  orElse: () => <RouteMaster>[],
                  success: (data) => data,
                );
                route ??= data.firstOrNull?.name;
                final defSel = data.where((e) => e.name == route).firstOrNull;
                _fetchInitial(context, route, query);
                return SearchDropDownList(
                  title: 'Route :',
                  hint: 'Select Route',
                  defaultSelection: defSel,
                  isMandatory: true,
                  items: data,
                  listItemBuilder: (_, item, __, ___) => CompactListTile(
                    title: item.routeName,
                    subtitle: item.depo,
                  ),
                  headerBuilder: (context, item, enabled) => Text(item.routeName),
                  futureRequest: (p0) async {
                    final where = data.where((e) {
                      return (e.name.containsIgnoreCase(p0) ||
                          e.routeName.containsIgnoreCase(p0));
                    });
                    return where.toList();
                  },
                  onSelected: (r) {
                    route = r?.name;
                    _fetchInitial(context, route, query);
                  },
                );
              },
            ),
          ),
        ),
      ),
      child: RefreshIndicator(
        onRefresh: () async => _fetchInitial(context, route, query),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<DateFilterCubit, DateFilter>(
                  builder: (_, state) {
                    final dayName = DFU.getDayNameFully(state.activeDay);
                    return Text(dayName, style: TextStyles.titleBold(context));
                  },
                ),
                BlocBuilder<RoutesCubit, InfiniteListState<FBO>>(
                  builder: (_, state) {
                    final count = state.maybeWhen(
                      orElse: () => 0.toString(),
                      success: (data, reachedMax, _, __) =>
                          '${data.length} ${reachedMax ? '' : '+'}',
                    );
                    return Text('$count FBOs',
                        style: TextStyles.captionBold(context));
                  },
                ),
              ],
            ),
            AppSpacer.p12(),
            AppSearchBarWidget(
              onSearch: (q) {
                query = q;
                _fetchInitial(context, route!, query);
              },
              onClear: () {
                query = null;
                _fetchInitial(context, route!, null);
              },
            ),
            const Divider(),
            Expanded(
              child: InfiniteListViewWidget<RoutesCubit, FBO>(
                fetchInitial: () => _fetchInitial(context, route!, query),
                fetchMore: () =>
                    context.cubit<RoutesCubit>().fetchMore(Pair(route!, query)),
                emptyListText: 'No Routes Found',
                childBuilder: (_, fbo) => FBOCard(
                  fbo: fbo,
                  onTap: () async {
                    if (fbo.isEnrolled) {
                      final path = AppRoute.bdeRoutes.path
                          .replaceAll(':id', fbo.fboName);
                      context.go(path, extra: fbo.businessName);
                    } else {
                      await AppDialog.show(
                        context,
                        content:
                            'Currently ${fbo.businessName} is Inactive. Kindly enroll to Proceed further.',
                        onTapOkay: context.exit,
                      );
                      final path = AppRoute.updateFBO.path;
                      if (!context.mounted) return;
                      context.push(path, extra: fbo);
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

  void _fetchInitial(BuildContext context, String? route, String? query) {
    if(route.isNull) return;
    context.cubit<RoutesCubit>().fetchInitial(Pair(route!, query));
  }
}
