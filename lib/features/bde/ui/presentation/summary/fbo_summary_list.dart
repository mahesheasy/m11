import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/bde/ui/presentation/summary/widgtes/fbo_summary_card.dart';
import 'package:m11_ind/features/ce/models/fbo.dart';
import 'package:m11_ind/features/ce/models/fbo_list_inp.dart';
import 'package:m11_ind/features/ce/presentation/bloc/fbo_list/fbo_list_cubit.dart';
import 'package:m11_ind/widgets/widgets.dart';

class FBOSummaryList extends StatelessWidget {
  const FBOSummaryList({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Summary',
      headerWidget: const Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title: 'Summary'),
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          context.cubit<FBOListCubit>().fetchInitial(const FBOListInp(status: 'None'));
        },
        child: InfiniteListViewWidget<FBOListCubit, FBO>(
          fetchInitial: () => context.cubit<FBOListCubit>().fetchInitial(const FBOListInp(status: 'None')),
          fetchMore: () => context.cubit<FBOListCubit>().fetchInitial(const FBOListInp(status: 'None')),
          emptyListText: 'No FBOs Found',
          childBuilder: (_, fbo) => FBOSummaryCard(
            fbo: fbo,
            onTap: () {
              final path = AppRoute.summFBODetail.path.replaceAll(':id', fbo.fboName);
              context.go(path, extra: fbo.businessName);
            },
          ),
        ),
      ),
    );
  }
}
