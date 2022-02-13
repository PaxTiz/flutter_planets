import '../../core/http.dart';
import '../auth_manager.dart';
import '../models/user.dart';
import '../stores/app_store.dart';
import 'base_store.dart';

class AuthStore extends BaseStore {
  AuthStore(AppStore? store) : super(store);

  Map<String, String> _errors = {};

  Map<String, String> get errors => _errors;

  Future<bool> login(String username, String password) async {
    return await http.post(
      '/auth/login',
      data: {'username': username, 'password': password},
    ).then((response) async {
      final user = User.fromJson(response.data['user'] as Map<String, dynamic>);
      final token = response.data['token'] as String;
      AuthManager.shared.setAuthInformations(user, token);
      return true;
    }).catchError((error) {
      if (userError(error)) {
        _errors = parseErrors(error.response.data["errors"]);
      }
      return false;
    }).whenComplete(() => notifyListeners());
  }
}
