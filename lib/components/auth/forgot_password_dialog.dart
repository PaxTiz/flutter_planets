import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/config.dart';
import '../../core/stores/auth_store.dart';
import '../custom_button.dart';

class ForgotPasswordDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _sendResetCodeTo(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthStore>().sendResetCodeTo(_emailController.text);
    }
  }

  void _verifyResetCode(BuildContext context, String code) async {
    if (await context.read<AuthStore>().verifyResetCode(code)) {
      // Show reset password form
    } else {
      // Show error message
    }
  }

  void _resetPassword(BuildContext context) async {
    if (await context.read<AuthStore>().resetPassword('')) {
      // Show success message and ask for login
    } else {
      // Show error message
    }
  }

  @override
  Widget build(BuildContext context) {
    final _spacing = kSpacing(2);
    return Center(
      child: Container(
        width: double.infinity,
        padding:
            EdgeInsets.symmetric(horizontal: _spacing, vertical: _spacing * 2),
        margin: EdgeInsets.all(_spacing),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(_spacing * 2),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                borderRadius: BorderRadius.circular(_spacing * 2),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      (value == null || value.isEmpty || !value.contains('@'))
                          ? 'Please enter a valid email address\n'
                          : null,
                  decoration: InputDecoration(
                    filled: false,
                    fillColor: CustomColors.lightGray.withOpacity(.2),
                    hintText: 'Enter your email',
                    errorMaxLines: 2,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: _spacing,
                      horizontal: _spacing * 1.5,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(_spacing * 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: _spacing),
              CustomButton(
                onClick: () => _sendResetCodeTo(context),
                text: 'Send me an email',
                full: true,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
