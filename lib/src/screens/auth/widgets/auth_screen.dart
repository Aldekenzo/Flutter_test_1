import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/src/common/constants/color_constants.dart';
import 'package:flutter_application_5/src/common/constants/padding_constants.dart';
import 'package:flutter_application_5/src/common/widgets/custom_button.dart';
import 'package:flutter_application_5/src/common/widgets/text_field_divider.dart';
import 'package:flutter_application_5/src/router/routing_const.dart';
import 'package:flutter_application_5/src/common/widgets/custom_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_5/src/screens/auth/log_in_bloc/log_in_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Dio dio = Dio();

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
                    controller: emailController,
                  ),
                  CustomTextFieldDivider(),
                  CustomTextField(
                    placeholder: 'Пароль',
                    controller: passwordController,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Padding(
              padding: AppPaddings.horizontal,
              child: BlocConsumer<LogInBloc, LogInState>(
                listener: (context, state) {
                  if (state is LogInLoaded) {
                    Navigator.pushReplacementNamed(context, MainRoute);
                  } else if (state is LogInFailed) {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text('Ошибка'),
                          content: Text(state.message ?? ''),
                          actions: [
                            CupertinoButton(
                              child: Text('ОК'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    text: 'Войти',
                    onPressed: state is LogInLoading
                        ? null
                        : () {
                            context.read<LogInBloc>().add(
                                  LogInPressed(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                          },
                  );
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


/**
 * BlocListener<LogInBloc, LogInState>(
                listener: (context, state) {
                  if (state is LogInLoaded) {
                    Navigator.pushReplacementNamed(context, MainRoute);
                  } else if (state is LogInFailed) {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text('Ошибка'),
                          content: Text(state.message ?? ''),
                          actions: [
                            CupertinoButton(
                              child: Text('ОК'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: BlocBuilder<LogInBloc, LogInState>(
                    builder: (context, state) {
                  return CustomButton(
                    text: 'Войти',
                    onPressed: state is LogInLoading
                        ? null
                        : () {
                            context.read<LogInBloc>().add(
                                  LogInPressed(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                          },
                  );
                }),
              ),
 */