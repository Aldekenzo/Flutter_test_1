import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_5/src/common/models/users_model.dart';
import 'package:flutter_application_5/src/profile.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  Dio dio = Dio();
  final Box tokensBox = Hive.box('tokens');
  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if(event is LoadProfile)
    {
      yield UserLoading();
      try {
      dio.options.headers['Authorization'] = 'Bearer ' + tokensBox.get('access');
      Response response = await dio.get(
      'http://api.codeunion.kz/api/v1/auth/login/profile');
      UserModel userModel = UserModel.fromJson(response.data);
    yield UserLoaded(user: UserModel(id: response.data['id'], email: response.data['email'], nickname: response.data['nickname']));
    } on DioError catch (e) {
       yield UserFailed(message: 'Some errors 1');
      throw e;
    }catch (e) {
        yield UserFailed(message: 'Some errors 2');
        throw e;
      }
    }
  }
}
