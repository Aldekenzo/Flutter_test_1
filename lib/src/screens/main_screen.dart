import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/src/common/constants/color_constants.dart';
import 'package:flutter_application_5/src/lenta.dart';
import 'package:flutter_application_5/src/profile.dart';
import 'register/register_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        iconSize: 25.0,
      
        inactiveColor: AppColors.iconColor,
        activeColor: AppColors.main,
        items: [
          BottomNavigationBarItem(label: 'Лента', icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
              label: 'Карта', icon: Icon(CupertinoIcons.map)),
          BottomNavigationBarItem(
              label: 'Избранные', icon: Icon(CupertinoIcons.heart)),
          BottomNavigationBarItem(
              label: 'Профиль', icon: Icon(CupertinoIcons.profile_circled)),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return Lenta();
              case 1:
                return RegScreen();
              case 2:
                return RegScreen();
              case 3:
                return Profile();
              default:
                return Lenta();
            }
          },
        );
      },
    );
  }
}
