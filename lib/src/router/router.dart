import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/src/screens/auth/log_in_bloc/log_in_bloc.dart';
import 'package:flutter_application_5/src/screens/auth/widgets/auth_screen.dart';
import 'package:flutter_application_5/src/screens/main_screen.dart';
import 'package:flutter_application_5/src/screens/register/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routing_const.dart';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LogInBloc(),
            child: AuthScreen(),
          ),
        );
      case MainRoute:
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
