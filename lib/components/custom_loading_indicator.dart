import 'package:flutter/material.dart';

import '../config/config.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final BuildContext parent;

  const CustomLoadingIndicator(this.parent);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(parent).size.height / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator.adaptive(
            backgroundColor: Colors.white,
          ),
          SizedBox(height: kSpacing(4)),
          Text(
            'Loading...',
            textAlign: TextAlign.center,
            style: TextStyle(color: CustomColors.lightGray),
          ),
        ],
      ),
    );
  }
}
