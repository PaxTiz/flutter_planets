import 'package:shared_preferences/shared_preferences.dart';

import '../../core/http.dart';
import '../models/user.dart';
import '../stores/app_store.dart';
import 'base_store.dart';

class AuthStore extends BaseStore {
  AuthStore(AppStore? store) : super(store);

  User? _user;
  String _token = '';
  Map<String, String> _errors = {};

  bool get isAuth => _user != null;
  String get token => _token;
  Map<String, String> get errors => _errors;

  Future<bool> login(String username, String password) async {
    return await http.post(
      '/auth/login',
      data: {'username': username, 'password': password},
    ).then((response) async {
      _user = User.fromJson(response.data['user']);
      _token = response.data['token'];
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token', _token);
      notifyListeners();

      return true;
    }).catchError((error) {
      if (userError(error)) {
        _errors = parseErrors(error.response.data["errors"]);
      }
      return false;
    }).whenComplete(() => notifyListeners());
  }
}
