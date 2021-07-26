import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/src/common/constants/color_constants.dart';
import 'package:flutter_application_5/src/common/constants/padding_constants.dart';
import 'package:flutter_application_5/src/common/widgets/custom_button.dart';
import 'package:flutter_application_5/src/common/widgets/text_field_divider.dart';
import 'package:flutter_application_5/src/router/routing_const.dart';
import 'package:flutter_application_5/src/common/widgets/custom_text_field.dart';
import 'package:dio/dio.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        middle: Text(
          'Авторизация',
          style: TextStyle(fontSize: 15.0),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: AppColors.white,
              child: Column(
                children: [
                  CustomTextField(
                    placeholder: 'Логин или почта',
                  ),
                  CustomTextFieldDivider(),
                  CustomTextField(
                    placeholder: 'Пароль',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Padding(
              padding: AppPaddings.horizontal,
              child: CustomButton(
                text: 'Войти',
                onPressed: () async {
                  Dio dio = Dio();
                  Response response = await dio.get(
                    'https://web.codeunion.kz/',
                  );

                  print(response.data);
                },
              ),
            ),
            SizedBox(height: 19.0),
            Padding(
              padding: AppPaddings.horizontal,
              child: CustomButton(
                text: 'Зарегистрироваться',
                onPressed: () {
                  Navigator.pushNamed(context, RegisterRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
