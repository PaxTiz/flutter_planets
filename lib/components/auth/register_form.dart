import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../custom_button.dart';

class RegisterForm extends StatelessWidget {
  final double spacing;
  const RegisterForm(this.spacing);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: CustomColors.lightGray.withOpacity(.2),
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
              fillColor: CustomColors.lightGray.withOpacity(.2),
              hintText: 'Email',
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
              fillColor: CustomColors.lightGray.withOpacity(.2),
              hintText: 'Password',
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
              fillColor: CustomColors.lightGray.withOpacity(.2),
              hintText: 'Password confirmation',
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
                style: TextStyle(color: CustomColors.buttonColor),
              ),
            ),
          ),
          SizedBox(height: spacing),
          CustomButton(
            full: true,
            text: 'Create my account',
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
