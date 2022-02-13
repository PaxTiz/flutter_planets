import 'package:flutter/material.dart';

import 'constants.dart';

final theme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: CustomColors.extraLightGray,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
  ),
  cardTheme: CardTheme(
    color: Colors.white,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 0, 48, 81),
    selectedItemColor: CustomColors.lightBlue,
    selectedLabelStyle: TextStyle(
      color: CustomColors.lightBlue,
    ),
    unselectedItemColor: CustomColors.lightGray,
    unselectedLabelStyle: TextStyle(
      color: CustomColors.lightGray,
    ),
  ),
);

final darkTheme = ThemeData(
  fontFamily: 'Poppins',
  primarySwatch: Colors.blue,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Color.fromARGB(75, 25, 42, 86),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Color.fromARGB(255, 53, 59, 72),
  ),
  cardTheme: CardTheme(color: Color.fromARGB(255, 53, 59, 72)),
  textTheme: TextTheme(
    headline6: TextStyle(
      fontSize: 28,
      color: Colors.white,
    ),
    headline5: TextStyle(
      fontSize: 12,
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: CustomColors.darkBlue,
    selectedItemColor: CustomColors.lightBlue,
    selectedLabelStyle:
        TextStyle(color: CustomColors.lightBlue, fontFamily: 'Montserrat'),
    unselectedItemColor: CustomColors.lightGray,
    unselectedLabelStyle:
        TextStyle(color: CustomColors.lightGray, fontFamily: 'Montserrat'),
  ),
);
