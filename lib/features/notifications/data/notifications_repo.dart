import 'package:m11_ind/core/core.dart';

abstract interface class NotificationsRepo {
  AsyncValueOf<List<String>> fetchNotifications(int start, int end);
}