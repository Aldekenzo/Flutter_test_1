import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/src/common/constants/color_constants.dart';

import 'package:flutter_application_5/src/router/router.dart';
import 'package:flutter_application_5/src/router/routing_const.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokens');
  await Hive.openBox('user');
  await Hive.openBox('lenta');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRoute = AuthRoute;

  void initState() {
    Box tokensBox = Hive.box('tokens');
    if (tokensBox.get('access') != null || tokensBox.get('refresh') != null) {
      initialRoute = MainRoute;
    }
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      theme: CupertinoThemeData(
        
          textTheme: CupertinoTextThemeData(
              textStyle:
                  TextStyle(fontFamily: 'Manrope-VariableFont_wght.ttf')),
          scaffoldBackgroundColor: AppColors.scaffoldBackground),
    );
  }
}
