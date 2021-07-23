import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/constants/app_colors.dart' as AppColors;

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.backgroung,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        middle: Text('Авторизация'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: CupertinoColors.white,
              child: Column(
                children: [
                  CupertinoTextField(
                    decoration: BoxDecoration(color: CupertinoColors.white),
                    placeholder: 'Логин или почта',
                    padding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 16),
                  ),
                  Container(
                    height: 1,
                    color: AppColors.textFieldBackground,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  CupertinoTextField(
                    decoration: BoxDecoration(color: CupertinoColors.white),
                    placeholder: 'Пароль',
                    padding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoButton(
                color: AppColors.authButtons,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text('Войти',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 19),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoButton(
                color: AppColors.authButtons,
                padding: EdgeInsets.symmetric(vertical: 20),
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