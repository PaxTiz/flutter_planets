import 'package:hive/hive.dart';

import '../core/models/user.dart';
import 'http.dart';

class AuthManager {
  User? user;
  String? token;
  late final Box<String> _box;

  static final AuthManager _shared = AuthManager._internal();
  static AuthManager get shared => _shared;

  bool get isAuth {
    return user != null && token != null;
  }

  AuthManager._internal();

  Future<bool> init() async {
    _box = await Hive.openBox('auth');
    final currentToken = _box.get('token');
    if (currentToken == null) {
      return false;
    }

    token = currentToken;
    return http.get('/auth/me').then((response) {
      user = User.fromJson(response.data as Map<String, dynamic>);
      return true;
    }).catchError((error) => false);
  }

  void setAuthInformations(User _user, String _token) {
    user = _user;
    token = _token;
    _box.put('token', _token);
  }
}
