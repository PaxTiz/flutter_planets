import 'package:flutter/material.dart';

import 'app_store.dart';

class FormError {
  final String property;
  final String message;

  const FormError(this.property, this.message);

  factory FormError.fromJson(Map<String, dynamic> json) =>
      FormError(json['param'], json['msg']);
}

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

  Map<String, String> parseErrors(List<dynamic> errors) {
    errors = errors.map((e) => Map<String, String>.from(e)).toList();
    final map = Map<String, String>.identity();
    for (final error in errors) {
      map.putIfAbsent(error['param'], () => error['msg']);
    }
    return map;
  }
}
