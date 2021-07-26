import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/src/common/constants/color_constants.dart';
import 'package:flutter_application_5/src/router/router.dart';
import 'package:flutter_application_5/src/screens/auth/widgets/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(fontFamily: 'Manrope-VariableFont_wght.ttf')
        ),
          scaffoldBackgroundColor: AppColors.scaffoldBackground),
    );
  }
}
