import '../app.dart';
import '../screens/auth/auth_screen.dart';
import '../screens/planets/planet_details.dart';
import '../screens/profile_screen.dart';
import '../screens/welcome_screen.dart';

final routes = {
  '/': (_) => App(),
  '/auth': (_) => AuthScreen(),
  '/profile': (_) => ProfileScreen(),
  '/planet-details': (_) => PlanetDetails(),
  '/welcome': (_) => WelcomeScreen()
};
