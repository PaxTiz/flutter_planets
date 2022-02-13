import 'package:flutter/material.dart';

import 'app_store.dart';

abstract class BaseStore extends ChangeNotifier {
  final AppStore? _appStore;

  BaseStore(this._appStore);

  bool userError(dynamic error) {
    if (error.response.statusCode == 500) {
      _appStore!.state = AppState.error;
      return false;
    } else if (error.response.statusCode == 401) {
      _appStore!.state = AppState.unauthenticated;
      return false;
    } else if (error.response.statusCode == 403) {
      _appStore!.state = AppState.unauthorized;
      return false;
    }

    return true;
  }

  Map<String, String> parseErrors(dynamic errors) {
    if (errors is! List) {
      throw ArgumentError(
          'Errors must be a List<Map> but is a ${errors.runtimeType.toString()}');
    }
    errors = errors
        .map((e) => Map<String, String>.from((e as Map<String, dynamic>)))
        .toList();
    final map = Map<String, String>.identity();
    for (final error in errors) {
      map.putIfAbsent(error['param'] as String, () => error['msg'] as String);
    }
    return map;
  }
}
