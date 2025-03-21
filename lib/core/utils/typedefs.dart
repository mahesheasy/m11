import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:m11_ind/core/model/failure.dart';

typedef AsyncValueOf<T> = Future<Either<Failure,T>>;

typedef JSONObject = Map<String,dynamic>;

typedef JSONArray = List<JSONObject>;

typedef WidgetBlocBuilder<S> = Widget Function(S state);

dynamic toNull(_) => null;

typedef HintBuilder = Widget Function(
  BuildContext context,
  String hint,
  bool enabled,
);

typedef HeaderBuilder<T> = Widget Function(
  BuildContext context,
  T selectedItem,
  bool enabled,
);

typedef ListItemBuilder<T> = Widget Function(
  BuildContext context,
  T item,
  bool isSelected,
  VoidCallback onItemSelect,
);