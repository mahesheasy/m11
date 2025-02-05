import 'package:flutter/material.dart';
import 'package:m11_ind/app/presentation/widgets/app_scaffold_widget.dart';
import 'package:m11_ind/app/presentation/widgets/page_header_widget.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/notifications/ui/bloc/bloc_provider.dart';
import 'package:m11_ind/widgets/widgets.dart';

class NotificationsScrn extends StatelessWidget {
  const NotificationsScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      canPop: false,
      title: 'Notifications',
      headerWidget: const Positioned(
        top: kTextTabBarHeight + 32,
        left: 12,
        child: PageHeaderWidget(title: 'Notifications'),
      ),
      child: InfiniteListViewWidget<NotificationsCubit, String>(
        fetchInitial: context.cubit<NotificationsCubit>().fetchInitial,
        fetchMore: context.cubit<NotificationsCubit>().fetchMore,
        emptyListText: 'No Notifications Found',
        childBuilder: (context, data) => Text(data),
      ),
    );
  }
}
