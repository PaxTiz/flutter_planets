import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planets/screens/planets/planet_details.dart';

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
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(75, 25, 42, 86),
        primaryColor: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 28),
          headline5: TextStyle(color: Colors.white, fontSize: 12),
        ),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => App(),
        '/planet-details': (ctx) => PlanetDetails()
      },
      initialRoute: '/',
    );
  }
}
