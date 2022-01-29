import 'package:flutter/material.dart';

import '../../constants.dart';
import '../custom_button.dart';

class LoginForm extends StatelessWidget {
  final double spacing;
  const LoginForm(this.spacing);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: CustomColors.light_gray.withOpacity(.2),
              hintText: 'Username',
              contentPadding: EdgeInsets.all(spacing),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(spacing * 2),
              ),
            ),
          ),
          SizedBox(height: spacing / 2),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: CustomColors.light_gray.withOpacity(.2),
              hintText: 'Password',
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
              onPressed: () {},
              child: Text(
                'Forgot your password ?',
                style: TextStyle(color: CustomColors.button_color),
              ),
            ),
          ),
          SizedBox(height: spacing),
          CustomButton(
            full: true,
            text: 'Login',
            onClick: () {},
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
