import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import './core/stores/app_store.dart';
import './core/stores/auth_store.dart';
import './screens/auth/auth_screen.dart';
import './screens/planets/planet_details.dart';
import './screens/welcome_screen.dart';
import 'app.dart';
import 'constants.dart';
import 'core/auth_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await AuthManager.shared.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
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
      navigatorKey: Constants.navigatorKey,
      routes: {
        '/': (_) => App(),
        '/auth': (_) => AuthScreen(),
        '/planet-details': (ctx) => PlanetDetails(),
        '/welcome': (_) => WelcomeScreen()
      },
      initialRoute: AuthManager.shared.isAuth ? '/' : '/auth',
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppStore(),
        ),
        ChangeNotifierProxyProvider<AppStore, AuthStore>(
          create: (_) => AuthStore(null),
          update: (ctx, appStore, old) => AuthStore(appStore),
          lazy: true,
        ),
      ],
      child: app,
    );
  }
}
