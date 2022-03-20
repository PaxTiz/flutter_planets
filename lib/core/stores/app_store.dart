import 'package:flutter/material.dart';

enum AppState { error, unauthenticated, unauthorized, ok }

class AppStore extends ChangeNotifier {
  AppState _state = AppState.ok;

  set state(AppState state) {
    _state = state;
    notifyListeners();
  }

  AppState get state => _state;
}
