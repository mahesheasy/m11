
import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';

class RequestMode {
  const RequestMode(
    this.id,
    this.name,
    this.count,
  );

  final String id;
  final String name;
  final int count;

  static List<RequestMode> fromJson(final Map<String, dynamic>? json) {

    final requestModes = <RequestMode>[];
    if(json.isNull) return requestModes;

    final keys = json!.keys;
    for(final key in keys) {
      if(key == 'production') {
        requestModes.add(RequestMode('True', 'Production', json[key]));
      } else {
        requestModes.add(RequestMode('False', 'Non Production', json[key]));
      }
    }
    return requestModes;
  }
}


List<PopupMenuEntry<dynamic>> modesToPopupMenuItems(
    List<RequestMode> modes) {
  return modes.map((mode) {
    return PopupMenuItem<RequestMode>(
      value: mode, 
      child: Text(mode.name),
    );
  }).toList();
}
