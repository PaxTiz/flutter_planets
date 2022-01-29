import 'package:flutter/material.dart';

import '../../components/auth/login_form.dart';
import '../../components/auth/register_form.dart';
import '../../components/custom_button.dart';
import '../../constants.dart';

enum AuthScreenStatus { login, register }

class AuthScreen extends StatefulWidget {
  createState() => _AuthScreen();
}

class _AuthScreen extends State<AuthScreen> {
  final spacing = kSpacing(3);
  AuthScreenStatus _status = AuthScreenStatus.login;

  bool get _isLogin => _status == AuthScreenStatus.login;

  void _switchStatus() {
    if (_isLogin) {
      setState(() => _status = AuthScreenStatus.register);
    } else {
      setState(() => _status = AuthScreenStatus.login);
    }
  }

  Widget _buildFormLayout() {
    final container = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(spacing * 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(spacing * 2),
          topRight: Radius.circular(spacing * 2),
        ),
      ),
      child: _isLogin ? LoginForm(spacing) : RegisterForm(spacing),
    );

    return _isLogin ? Expanded(child: container) : container;
  }

  Widget _buildAppLayout() {
    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: spacing,
            right: spacing,
            top: spacing * 4,
            bottom: spacing * 2,
          ),
          child: Text(
            _isLogin ? 'Login' : 'Create an account',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        _buildFormLayout(),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.white),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: spacing * 2,
              horizontal: spacing,
            ),
            width: MediaQuery.of(context).size.width,
            color: CustomColors.light_gray.withOpacity(.1),
            child: Center(
              child: CustomButton(
                full: true,
                text: _isLogin ? 'Create an account' : 'Login',
                onClick: _switchStatus,
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
    return _isLogin ? column : SingleChildScrollView(child: column);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildAppLayout(),
    );
  }
}
