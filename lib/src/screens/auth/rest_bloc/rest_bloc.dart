import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_5/src/common/models/rest_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'rest_event.dart';
part 'rest_state.dart';

class RestBloc extends Bloc<RestEvent, RestState> {
  RestBloc() : super(RestInitial());
   Dio dio = Dio();
  
  final Box tokensBox = Hive.box('tokens');
  final Box restBox = Hive.box('lenta');

  @override
  Stream<RestState> mapEventToState(
    RestEvent event,

  ) async* {
 if(event is LoadRests)
    {
      yield RestLoading();
      try {
      dio.options.headers['Authorization'] = 'Bearer ' + tokensBox.get('access');
      Response response = await dio.get(
      'http://api.codeunion.kz/api/v1/restaurants/details/5');
      RestModel restModel = RestModel.fromJson(response.data['restaurant'][0]);
    yield RestLoaded(rest: RestModel(
      id: restModel.id,
    is_favourite: restModel.is_favourite,
    title: restModel.title,
    description: restModel.description));
    } on DioError catch (e) {
       yield RestFailed(message: 'Some errors 1');
      throw e;
    }catch (e) {
        yield RestFailed(message: 'Some errors 2');
        throw e;
      }
  }
}}
/*
{
    "restaurant": [
        {
            "is_favourite": false,
            "id": 5,
            "title": "Friends Bar",
            "description": "Современный бар на Форуме!",
            "schedule_id": 5,
            "coords_id": 5,
            "user_id": 1,
            "schedule": {
                "id": 5,
                "opening": "10:00",
                "closing": "04:00"
            },
            "coords": {
                "id": 5,
                "longitude": 76.935175,
                "latitude": 43.233345,
                "address_name": "​проспект Сейфуллина, 617, Алматы"
            },
            "images": [
                {
                    "id": 1,
                    "url": "https://storage.googleapis.com/foody-dev-d054f.appspot.com//images1627733120070.jpg?GoogleAccessId=firebase-adminsdk-n7qvn%40foody-dev-d054f.iam.gserviceaccount.com&Expires=16447017600&Signature=JEqf55Rdb53mkxhnKQuIExLbGi%2Fg3g3lXBCQ8BFFQtnsI3OUFbslmmCCUaT4f3rgAmVyYYU3J83mLKBx8Ul4d%2BJY6n4cua0dkEpfguCLbrFPu7rlC%2BgJs%2FdiTxET2wBX6vnb51bN6NBjp1qhTsM2URrwV5SdE%2BI7gN3iJJ%2FsV%2FQucM3R4zgt4NECgBk3Bj1d9ovIslfvhRHicg7EHYKIkBTJgcI9VsJsNiSOmQLuiZ4hiBDswtOyphPLiICUPamB3H04NiUx7ElfzF3VYwCks1CXLpZaPwi18WoCNakkFRJ0nmwYsv3KY6E1nhhoRJC5gy4XAqNJGdFnnXj8IDgS%2Fg%3D%3D",
                    "restaurant_id": 5
                },
                {
                    "id": 2,
                    "url": "https://storage.googleapis.com/foody-dev-d054f.appspot.com//images1627733120071.jpg?GoogleAccessId=firebase-adminsdk-n7qvn%40foody-dev-d054f.iam.gserviceaccount.com&Expires=16447017600&Signature=QEj1hjyhegEma0f%2FLgWWDf1loMeU0bzv21D%2FbnxnJMQvnOYJc6l5ULZkqcGfzxmQXsqWxHVDEWVU2jV0e2pCd2mLk2ghay7fK1g2M1vae1czsTBFWHLbI6cPHsyJ%2FM7%2FShtjRigxZSbP2MIYG9PSYP4SVAYUyLJwWdYiMjyRuzQQA3ridzCqn3X4UX2CcTjofSO6xxpdNR4GyU2H8uTiQbIf9HTVjOcCjjKHm%2FiO5MvbPoA66rX53K2bZ0Gw1pZ3CJvTl1YpbW5i6TTG%2BvMEDpVp45Yk2ENdACgdVpwhSqRNYGrS3hVMcDP80xmsBDEobO4mvdkV60Hq4323WVYJJw%3D%3D",
                    "restaurant_id": 5
                }
            ],
            "user": {
                "id": 1,
                "email": "maripbekoff@gmail.com",
                "nickname": "maripbekoff"
            },
            "likes": []
        }
    ]
}*/