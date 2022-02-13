import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import './core/stores/app_store.dart';
import './core/stores/auth_store.dart';
import 'config/config.dart';
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
      title: Constants.appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: theme,
      darkTheme: darkTheme,
      navigatorKey: Constants.navigatorKey,
      routes: routes,
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
