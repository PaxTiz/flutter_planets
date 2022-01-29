import 'package:flutter/cupertino.dart';

abstract class Constants {
  static const API_URL = 'localhost:8080';
}

abstract class CustomColors {
  static final extra_light_gray = Color.fromARGB(255, 199, 232, 255);

  static final light_gray = Color.fromARGB(255, 113, 128, 147);
  static final light_blue = Color.fromARGB(255, 72, 219, 251);

  static final dark_blue = Color.fromARGB(255, 34, 47, 62);

  static final button_color = CupertinoColors.systemIndigo;
}

double kSpacing(double count) => 8 * count;
