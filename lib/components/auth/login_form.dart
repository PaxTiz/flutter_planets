import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../core/stores/auth_store.dart';
import '../custom_button.dart';
import 'forgot_password_dialog.dart';

class LoginForm extends StatelessWidget {
  final double spacing;
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginForm(this.spacing);

  void _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;
      if (await context.read<AuthStore>().login(username, password)) {
        Constants.navigatorKey.currentState?.pushNamed('/');
      }
    }
  }

  void _showForgotPasswordModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => ForgotPasswordDialog(),
      barrierColor: Colors.black87,
    );
  }

  @override
  Widget build(BuildContext context) {
    final formErrors = context.watch<AuthStore>().errors;

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: Fix error showing (formErrors['username'] always returns null)
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: CustomColors.lightGray.withOpacity(.2),
              hintText: 'Username',
              errorText: formErrors['username'] ?? 'fixme',
              contentPadding: EdgeInsets.all(spacing),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(spacing * 2),
              ),
            ),
          ),
          SizedBox(height: spacing / 2),
          // TODO: Fix error showing (formErrors['password'] always returns null)
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: CustomColors.lightGray.withOpacity(.2),
              hintText: 'Password',
              errorText: formErrors['password'] ?? 'fixme',
              contentPadding: EdgeInsets.all(spacing),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(spacing * 2),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => _showForgotPasswordModal(context),
              child: Text(
                'Forgot your password ?',
                style: TextStyle(color: CustomColors.buttonColor),
              ),
            ),
          ),
          SizedBox(height: spacing),
          CustomButton(
            full: true,
            text: 'Login',
            onClick: () => _login(context),
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 0,
            ),
          ),
        ],
      ),
    );
  }
}
