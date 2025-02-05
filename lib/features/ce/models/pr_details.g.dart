// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pr_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PRDetailsImpl _$$PRDetailsImplFromJson(Map<String, dynamic> json) =>
    _$PRDetailsImpl(
      id: json['pr_id'] as String,
      url: json['pr_print_file_path'] as String,
    );

Map<String, dynamic> _$$PRDetailsImplToJson(_$PRDetailsImpl instance) =>
    <String, dynamic>{
      'pr_id': instance.id,
      'pr_print_file_path': instance.url,
    };
