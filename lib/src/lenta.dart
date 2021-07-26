import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/src/common/constants/color_constants.dart';

class Lenta extends StatefulWidget {
  const Lenta({Key? key}) : super(key: key);

  @override
  _LentaState createState() => _LentaState();
}

class _LentaState extends State<Lenta> {
  @override
  Color _iconColor = AppColors.black;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: CupertinoTextField(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.symmetric(
                    vertical: BorderSide(
                        color: AppColors.textFieldBorder,
                        style: BorderStyle.solid),
                    horizontal: BorderSide(
                        color: AppColors.textFieldBorder,
                        style: BorderStyle.solid),
                  ),
                ),
                placeholder: 'Поиск',
                placeholderStyle: TextStyle(
                    color: AppColors.textAndIconColor, fontSize: 13.0),
                padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 17.0),
                prefix: Container(
                  height: 16.0,
                  width: 16.0,
                  padding: EdgeInsets.only(left: 12.0),
                  child: Icon(
                    CupertinoIcons.search,
                    size: 16.0,
                    color: AppColors.textAndIconColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemCount: 5,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 234.0,
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.0),
                                color: AppColors.main),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 11.0, left: 16.0, right: 21.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mega Center',
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    SizedBox(
                                      height: 1.0,
                                    ),
                                    Text(
                                      'Один из крупнейших торговых центров в ...',
                                      style: TextStyle(
                                          color: AppColors.textAndIconColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.0,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    SizedBox(
                                      height: 2.0,
                                    ),
                                    Text(
                                      'Аль-Фараби',
                                      style: TextStyle(
                                          color: AppColors.textAndIconColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.0,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ],
                                ),
                              ),
                              CupertinoButton(
                                child: Icon(
                                  CupertinoIcons.heart,
                                  color: _iconColor,
                                ),
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    _iconColor = AppColors.red;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.symmetric(
                          vertical: BorderSide(
                              color: AppColors.textFieldBorder,
                              style: BorderStyle.solid),
                          horizontal: BorderSide(
                              color: AppColors.textFieldBorder,
                              style: BorderStyle.solid),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20.0,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
