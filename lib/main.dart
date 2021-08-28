import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planets/components/header.dart';
import 'package:planets/components/planets/most_popular_carousel.dart';
import 'package:planets/stores/planet_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ChangeNotifierProvider<PlanetStore>(
            create: (ctx) => PlanetStore(),
            child: Column(
              children: [
                Header(),
                SizedBox(height: 32),
                MostPopularCarousel()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
