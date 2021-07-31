import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_5/src/common/constants/color_constants.dart';
import 'package:flutter_application_5/src/screens/auth/rest_bloc/rest_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool favoriteIcon = false;
    @override
  void initState() {
    super.initState();
    
    context.read<RestBloc>().add(LoadRests());
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: BlocBuilder<RestBloc, RestState>(
        builder: (context, state) {
          
          if(state is RestLoading){
            return Center(child: CupertinoActivityIndicator(),);
          }
          if(state is RestLoaded){
            favoriteIcon = state.rest.is_favourite;
        
        return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Container(
                height: 320,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/images/tree.jpg"),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              height: 100,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xAF000000),
                    spreadRadius: 1,
                    blurRadius: 40,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 23.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: CupertinoButton(
                    child: Icon(
                      CupertinoIcons.back,
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
                  Container(
                    child: Text(
                      state.rest.title.toString(),
                      style: TextStyle(color: AppColors.white, fontSize: 15),
                    ),
                  ),
                  Container(
                      child: CupertinoButton(
                    child: Icon(
                      CupertinoIcons.heart,
                      color: (favoriteIcon) ? AppColors.red : AppColors.white,
                    ),
                    onPressed: () {
                      favoriteIcon = true;
                    },
                  )),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: 32,
          padding: EdgeInsets.only(top: 16, left: 16),
          child: Text(
            'Описание',
            style: TextStyle(color: AppColors.textFieldTextColor, fontSize: 14),
          ),
        ),
        Flexible(
          child: Container(
              padding: EdgeInsets.only(left: 16, top: 3, right: 18),
              child: Text(
                'Новый способ обжарки хачапури только у нас. И вкуснейшие салатики малибу и ...',
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal),
              )),
        ),
        Container(
            padding: EdgeInsets.only(left: 16, right: 56),
            height: 32,
            width: 303,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              child: Text(
                'Подробнее...',
                style: TextStyle(
                    fontSize: 14, decoration: TextDecoration.underline),
              ),
              onPressed: () {},
            )),
        Divider(),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 14),
              child: Icon(
                CupertinoIcons.time,
                color: AppColors.black,
                size: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 14),
              child: Text(
                'Работаем с 08:00 до 18:00',
                style: TextStyle(color: AppColors.black, fontSize: 16),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 14, bottom: 14),
              child: Icon(
                CupertinoIcons.location,
                color: AppColors.black,
                size: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 14, bottom: 14),
              child: Text(
                'Аль-Фараби',
                style: TextStyle(color: AppColors.black, fontSize: 16),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );}
    return Offstage();
    }
    
    ),

    );
  }
}
