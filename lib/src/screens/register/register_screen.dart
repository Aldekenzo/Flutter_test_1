import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/constants/app_colors.dart' as AppColors;

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.background,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.whiteBackground,
        leading: SizedBox(
          height: 16.0,
          width: 9.0,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Icon(
              CupertinoIcons.back,
              color: AppColors.iconColor,
            ),
          ),
        ),
        middle: Text('Регистрация'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: AppColors.whiteBackground,
                child: Column(
                  children: [
                    CupertinoTextField(
                      placeholder: 'Логин',
                      padding: const EdgeInsets.symmetric(
                          vertical: 19.0, horizontal: 16.0),
                    ),
                    Container(
                      height: 1.0,
                      color: AppColors.textFieldBackground,
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    CupertinoTextField(
                      placeholder: 'Телефон',
                      padding: const EdgeInsets.symmetric(
                          vertical: 19.0, horizontal: 16.0),
                    ),
                    Container(
                      height: 1.0,
                      color: AppColors.textFieldBackground,
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    CupertinoTextField(
                      placeholder: 'Почта',
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
                      suffix: Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: SizedBox(
                          height: 19.0,
                          width: 24.0,
                          child: CupertinoButton(
                            padding: EdgeInsets.only(bottom: 22.0, right: 19.0),
                            onPressed: () {},
                            child: Icon(
                              CupertinoIcons.eye_slash,
                              color: AppColors.iconColor,
                            ),
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 19.0, horizontal: 16.0),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 56.0),
                child: CupertinoButton(
                  color: AppColors.authButtons,
                  padding:
                      EdgeInsets.symmetric(vertical: 19.0, horizontal: 16.0),
                  child: Text(
                    'Создать Аккаунт',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
