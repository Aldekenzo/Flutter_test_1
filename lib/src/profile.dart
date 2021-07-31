import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/src/common/constants/color_constants.dart';
import 'package:flutter_application_5/src/common/constants/padding_constants.dart';
import 'package:flutter_application_5/src/common/models/users_model.dart';
import 'package:flutter_application_5/src/router/routing_const.dart';
import 'package:flutter_application_5/src/screens/auth/user_bloc/user_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();

    context.read<UserBloc>().add(LoadProfile());
  }

  Dio dio = Dio();
  final Box tokensBox = Hive.box('tokens');
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: AppColors.white,
        middle: Text(
          'Профиль',
          style: TextStyle(fontSize: 15.0),
        ),
      ),
      child: SafeArea(child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if(state is UserLoading){
            return Center(child: CupertinoActivityIndicator(),);
          } if(state is UserLoaded){
          return ListView.separated(
              padding: AppPaddings.zero,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 350.0,
                  padding: AppPaddings.zero,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Icon(
                          CupertinoIcons.profile_circled,
                          size: 84.0,
                          color: AppColors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text(
                          state.user.nickname,
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            state.user.email,
                            style: TextStyle(
                                color: AppColors.textFieldTextColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          child: CupertinoButton(
                            child: Text(
                              'Выйти',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.red),
                            ),
                            padding: EdgeInsets.only(right: 296.0),
                            onPressed: () {
                              tokensBox.delete('access');
                              tokensBox.delete('refresh');

                              Navigator.of(context, rootNavigator: true)
                                  .pushNamedAndRemoveUntil(
                                      AuthRoute, (route) => false);
                            },
                          ),
                          color: AppColors.white,
                          height: 55.0,
                          width: MediaQuery.of(context).size.width,
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 12.0,
                );
              },
              itemCount: 1);}
              return Offstage();
        },
      )),
    );
  }
}
