import 'package:flutter/material.dart';
import 'package:planets/constants.dart';
import './screens/planets/planet_details.dart';
import './screens/welcome_screen.dart';

import 'app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: CustomColors.extra_light_gray,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
        ),
        cardTheme: CardTheme(
          color: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 0, 48, 81),
          selectedItemColor: CustomColors.light_blue,
          selectedLabelStyle: TextStyle(
            color: CustomColors.light_blue,
          ),
          unselectedItemColor: CustomColors.light_gray,
          unselectedLabelStyle: TextStyle(
            color: CustomColors.light_gray,
          ),
        ),
      ),
      darkTheme: ThemeData(
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
          backgroundColor: CustomColors.dark_blue,
          selectedItemColor: CustomColors.light_blue,
          selectedLabelStyle: TextStyle(
              color: CustomColors.light_blue, fontFamily: 'Montserrat'),
          unselectedItemColor: CustomColors.light_gray,
          unselectedLabelStyle: TextStyle(
              color: CustomColors.light_gray, fontFamily: 'Montserrat'),
        ),
      ),
      routes: {
        '/': (_) => App(),
        '/planet-details': (ctx) => PlanetDetails(),
        '/welcome': (_) => WelcomeScreen()
      },
      initialRoute: '/welcome',
    );
  }
}
