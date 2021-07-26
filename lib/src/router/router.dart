import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/src/screens/auth/widgets/auth_screen.dart';
import 'package:flutter_application_5/src/screens/main_screen.dart';
import 'package:flutter_application_5/src/screens/register/register_screen.dart';
import 'routing_const.dart';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
      case HomeRoute:
        return CupertinoPageRoute(
          builder: (context) => MainScreen(),
        );
      case RegisterRoute:
        return CupertinoPageRoute(
          builder: (context) => RegScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
    }
  }
}
