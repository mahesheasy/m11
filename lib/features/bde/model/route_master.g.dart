// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteMasterImpl _$$RouteMasterImplFromJson(Map<String, dynamic> json) =>
    _$RouteMasterImpl(
      name: json['name'] as String,
      depo: json['depot_name'] as String,
      routeCode: json['route_code'] as String,
      routeName: json['route_name'] as String,
      day: json['day'] as String,
    );

Map<String, dynamic> _$$RouteMasterImplToJson(_$RouteMasterImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'depot_name': instance.depo,
      'route_code': instance.routeCode,
      'route_name': instance.routeName,
      'day': instance.day,
    };
