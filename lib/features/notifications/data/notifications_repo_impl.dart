import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:m11_ind/core/core.dart';
import 'package:m11_ind/features/notifications/data/notifications_repo.dart';

@LazySingleton(as: NotificationsRepo)
class NotificationsRepoImpl extends BaseApiRepository implements NotificationsRepo {
  const NotificationsRepoImpl(super.client);

  @override
  AsyncValueOf<List<String>> fetchNotifications(int start, int end) async {
    return right(<String>[]);
  }

}