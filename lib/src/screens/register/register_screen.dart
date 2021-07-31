import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/src/common/constants/color_constants.dart';
import 'package:flutter_application_5/src/common/constants/padding_constants.dart';
import 'package:flutter_application_5/src/common/widgets/custom_button.dart';
import 'package:flutter_application_5/src/common/widgets/custom_text_field.dart';
import 'package:flutter_application_5/src/common/widgets/text_field_divider.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        leading: SizedBox(
          height: 16.0,
          width: 9.0,
          child: CupertinoButton(
            padding: AppPaddings.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              color: AppColors.iconColor,
            ),
          ),
        ),
        middle: Text(
          'Регистрация',
          style: TextStyle(fontSize: 15.0),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: AppPaddings.customForRegPage,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: AppColors.white,
                child: Column(
                  children: [
                    CustomTextField(
                      placeholder: 'Логин',
                    ),
                    CustomTextFieldDivider(),
                    CustomTextField(
                      placeholder: 'Телефон',
                    ),
                    CustomTextFieldDivider(),
                    CustomTextField(
                      placeholder: 'Почта',
                    ),
                    CustomTextFieldDivider(),
                    CustomTextField(
                      placeholder: 'Пароль',
                      suffix: Container(
                        child: CupertinoButton(
                          onPressed: () {},
                          child: Icon(
                            CupertinoIcons.eye_slash,
                            color: AppColors.iconColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: AppPaddings.horizontal,
                child: CustomButton(
                  text: 'Создать Аккаунт',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
