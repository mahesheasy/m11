import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_master.freezed.dart';
part 'route_master.g.dart';

@freezed
class RouteMaster with _$RouteMaster {
  const factory RouteMaster({
    required String name,
    @JsonKey(name: 'depot_name') required String depo,
    @JsonKey(name: 'route_code') required String routeCode,
    @JsonKey(name: 'route_name') required String routeName,
    required String day,
  }) = _RouteMaster;

  factory RouteMaster.fromJson(Map<String, dynamic> json) =>
      _$RouteMasterFromJson(json);
}
