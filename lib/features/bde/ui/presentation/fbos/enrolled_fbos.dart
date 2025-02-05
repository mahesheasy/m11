
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/location_header.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/models/fbo_list_inp.dart';
import 'package:m11_ind/features/ce/models/request_mode.dart';
import 'package:m11_ind/features/ce/presentation/bloc/ce_bloc_provider.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_list/fbo_list_cubit.dart';
import 'package:m11_ind/features/ce/presentation/ui/pickups/widgets/fbo_card.dart';
import 'package:m11_ind/widgets/request_mode_selection_mixin.dart';
import 'package:m11_ind/widgets/widgets.dart';

class EnrolledFBOsList extends StatefulWidget {
  const EnrolledFBOsList({super.key});

  @override
  State<EnrolledFBOsList> createState() => _EnrolledFBOsListState();
}

class _EnrolledFBOsListState extends State<EnrolledFBOsList>
    with RequestModeSelectionMixin {
  RequestMode? mode;
  String? query;

  void _onSearchQuery() {
    if (mode.isNull) return;
    final inp = FBOListInp(status: mode!.id, query: query);
    context.cubit<FBOListCubit>().fetchInitial(inp);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'FBOs',
      headerWidget: const LocationHeader(title: 'FBOs At'),
      child: RefreshIndicator(
        onRefresh: ()async =>_onSearchQuery() ,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: AppSearchBarWidget(
                    onSearch: (text) {
                      query = text;
                      _onSearchQuery();
                    },
                    onClear: () {
                      query = null ;
                      _onSearchQuery();
                    },
                  ),
                ),
                BlocBuilder<RequestModeCubit, RequestModeCubitState>(
                  builder: (_, state) {
                    final modes = state.maybeWhen(
                      orElse: () => <RequestMode>[],
                      success: (data) => data,
                    );
                    if (mode.isNull) {
                      mode = modes.firstOrNull;
                      _onSearchQuery();
                    }
                    return IconButton(
                      onPressed: () async {
                        final value = await showOptions(
                          context,
                          defaultValue: mode!.id,
                        );
                        if (value.isNull || !context.mounted) return;
                        mode = modes.where((e) => e.id == value).firstOrNull;
                        _onSearchQuery();
                      },
                      icon: const Icon(Icons.filter_list),
                    );
                  },
                )
              ],
            ),
            const Divider(),
            Expanded(
              child: InfiniteListViewWidget<FBOListCubit, FBO>(
                fetchInitial: _onSearchQuery,
                fetchMore: fetchMore,
                emptyListText: 'No FBOs Found',
                childBuilder: (_, fbo) => FBOCard(
                  fbo: fbo,
                  onTap: () async {
                    if (fbo.isEnrolled) {
                      final path = AppRoute.enrolledFBODetail.path.replaceAll(':id', fbo.fboName);
                      context.go(path, extra: fbo.businessName);
                    } else {
                      await AppDialog.show(context,
                        content: 'Currently ${fbo.businessName} is Inactive. Kindly enroll to Proceed further.',
                        onTapOkay: context.exit,
                      );
                      final path = AppRoute.updateFBO.path;
                      if(!context.mounted) return;
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

  void fetchMore() {
    if(mode == null) return;
    final inp = FBOListInp(status: mode!.id, query: query);
    context.cubit<FBOListCubit>().fetchInitial(inp);
  }
}
