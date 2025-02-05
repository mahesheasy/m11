import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/model/route_master.dart';
import 'package:m11_ind/features/bde/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/models/fbo_list_inp.dart';
import 'package:m11_ind/features/ce/presentation/bloc/ce_bloc_provider.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_list/fbo_list_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/fbo_card.dart';
import 'package:m11_ind/widgets/request_mode_selection_mixin.dart';
import 'package:m11_ind/widgets/widgets.dart';

class FBOListWidget extends StatefulWidget {
  const FBOListWidget({super.key});

  @override
  State<FBOListWidget> createState() => _FBOListWidgetState();
}

class _FBOListWidgetState extends State<FBOListWidget>
    with RequestModeSelectionMixin {
  String? route;
  String? status;
  String? query;
  @override
  Widget build(BuildContext context) {
    final isActive = status == 'True';
    return AppScaffoldWidget(
      title: 'FBOs',
      headerWidget: Positioned(
        top: kTextTabBarHeight + 32,
        child: Container(
          height: 80,
          width: context.sizeOfWidth,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: BlocConsumer<RouteMasterCubit, RouteMasterState>(
            listener: (_, state) {
              state.handle(
                context,
                success: (data) {
                  if(data.isEmpty) {
                    AppDialog.showErrorDialog(
                      context,
                      content: 'No routes have been tagged to your ID. Please try again.',
                      onTapDismiss: context.exit,
                    );
                  } else {
                    if (route.isNull) {
                      setState(() {
                        route ??= data.firstOrNull?.name;
                      });
                    }
                    context.cubit<RequestModeCubit>().request();
                  }
                },
              );
            },
            builder: (_, state) {
              final data = state.maybeWhen(
                orElse: () => <RouteMaster>[],
                success: (data) => data,
              );

              final defSel = data.where((e) => e.name == route).firstOrNull;
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
                  setState(() {
                    route = r?.name;
                  });
                  _fetchInital(context, status, query, route);
                },
              );
            },
          ),
        ),
      ),
      child: RefreshIndicator(
        onRefresh: () async =>
            _fetchInital(context, status!, query, route),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: AppSearchBarWidget(
                    onSearch: (text) {
                      query = text;
                      _fetchInital(
                          context, status, query, route);
                    },
                    onClear: () {
                      query = null;
                      _fetchInital(context, status, null, route);
                    },
                  ),
                ),
                BlocConsumer<RequestModeCubit, RequestModeCubitState>(
                  listener: (context, state) {
                    state.handle(
                      context,
                      success: (data) {
                        if (status.isNull) {
                          setState(() {
                            status ??= data.firstOrNull?.id;
                          });
                        }
                        _fetchInital(context, status, query, route);
                      },
                    );
                  },
                  builder: (_, state) {
                    return IconButton(
                      onPressed: () async {
                        final value = await showOptions(context, defaultValue: status);
                        if (value.isNull || !context.mounted) return;
                        status = value;
                        _fetchInital(context, status, query, route);
                      },
                      icon: const Icon(Icons.filter_list, weight: 8),
                    );
                  },
                ),
              ],
            ),
            AppSpacer.p12(),
            Expanded(
              child: InfiniteListViewWidget<FBOListCubit, FBO>(
                fetchInitial: () =>
                    _fetchInital(context, status, query, route),
                fetchMore: () => _fetchMore(context, status, query, route),
                emptyListText:
                    'No FBOs Found in ${isActive ? 'Production' : 'Non Production'} ',
                childBuilder: (_, fbo) => FBOCard(
                  fbo: fbo,
                  onTap: () {
                    AppRoute.fboDetails.push(context, extra: {
                      'fbo_id': fbo.fboName,
                      'fbo_name': fbo.businessName,
                    });
                    // final routeName = AppRoute.fboDetails.getPathName();
                    // context.go(routeName, extra: {
                    //   'fbo_id': fbo.fboName,
                    //   'fbo_name': fbo.businessName,
                    // });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _fetchInital(BuildContext context, String? status, String? query,
      String? route) {
    if (route == null || status == null) return;
    final inp = FBOListInp(status: status, query: query, route: route);
    context.cubit<FBOListCubit>().fetchInitial(inp);
  }

  void _fetchMore(
      BuildContext context, String? status, String? query, String? route) {
    if (route == null || status == null) return;
    final inp = FBOListInp(status: status, query: query, route: route);
    context.cubit<FBOListCubit>().fetchMore(inp);
  }
}
