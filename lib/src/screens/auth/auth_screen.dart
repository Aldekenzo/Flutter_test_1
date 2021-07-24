import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/constants/app_colors.dart' as AppColors;

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.whiteBackground,
        middle: Text('Авторизация'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: AppColors.whiteBackground,
              child: Column(
                children: [
                  CupertinoTextField(
                    placeholder: 'Логин или почта',
                    padding: const EdgeInsets.symmetric(
                        vertical: 19.0, horizontal: 16.0),
                  ),
                  Container(
                    height: 1,
                    color: AppColors.textFieldBackground,
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  CupertinoTextField(
                    placeholder: 'Пароль',
                    padding: const EdgeInsets.symmetric(
                        vertical: 19.0, horizontal: 16.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CupertinoButton(
                color: AppColors.authButtons,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text('Войти',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 19.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CupertinoButton(
                color: AppColors.authButtons,
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Зарегистрироваться',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
