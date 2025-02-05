import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/notifications/data/notifications_repo.dart';

typedef NotificationsCubit = InfiniteListCubit<String, None, None>;
typedef NotificationsCubitState = InfiniteListState<String>;

@injectable
class NotificationsBlocProvider {
  const NotificationsBlocProvider({required this.repo});

  final NotificationsRepo repo;

  static NotificationsBlocProvider get() => $sl.get<NotificationsBlocProvider>();

  NotificationsCubit fetchNotifications() {
    return NotificationsCubit(
      requestInitial: (_, __) => repo.fetchNotifications(1, 10),
      requestMore:  (_, s) => repo.fetchNotifications(s.curLength + 1, s.curLength + 10),
    );
  }
}