import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planets/screens/planets/planet_details.dart';
import 'package:planets/screens/planets/welcome_screen.dart';

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
        scaffoldBackgroundColor: Color.fromARGB(255, 199, 232, 255),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
        ),
        cardTheme: CardTheme(
          color: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 0,48,81),
          selectedItemColor: Color.fromARGB(255, 72, 219, 251),
          selectedLabelStyle:
              TextStyle(color: Color.fromARGB(255, 72, 219, 251)),
          unselectedItemColor: Color.fromARGB(255, 113, 128, 147),
          unselectedLabelStyle:
              TextStyle(color: Color.fromARGB(255, 113, 128, 147)),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Color.fromARGB(75, 25, 42, 86),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Color.fromARGB(255, 53, 59, 72),
        ),
        cardTheme: CardTheme(
          color: Color.fromARGB(255, 53, 59, 72)
        ),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 28),
          headline5: TextStyle(color: Colors.white, fontSize: 12),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 34, 47, 62),
          selectedItemColor: Color.fromARGB(255, 72, 219, 251),
          selectedLabelStyle:
              TextStyle(color: Color.fromARGB(255, 72, 219, 251)),
          unselectedItemColor: Color.fromARGB(255, 113, 128, 147),
          unselectedLabelStyle:
              TextStyle(color: Color.fromARGB(255, 113, 128, 147)),
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
