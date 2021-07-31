import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/src/common/constants/color_constants.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MyMap extends StatefulWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          options: new MapOptions(
            center: new LatLng(43.235, 76.868),
            zoom: 13,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(43.235, 76.88),
                  builder: (ctx) => Container(
                    child: Icon(
                      CupertinoIcons.location_solid,
                      size: 34,
                      color: AppColors.main,
                    ),
                  ),
                ),
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(43.23, 76.85),
                  builder: (ctx) => Container(
                    child: Icon(
                      CupertinoIcons.person_circle,
                      size: 34,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: CupertinoTextField(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(6.0),
              border: Border.symmetric(
                vertical: BorderSide(
                    color: AppColors.textFieldBorder, style: BorderStyle.solid),
                horizontal: BorderSide(
                    color: AppColors.textFieldBorder, style: BorderStyle.solid),
              ),
            ),
            placeholder: 'Поиск',
            placeholderStyle:
                TextStyle(color: AppColors.textAndIconColor, fontSize: 13.0),
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
        Positioned(
          width: 52,
          height: 52,
          right: 30,
          bottom: 70,
          child: Container(
            child: CupertinoButton(
              onPressed: () {},
              child: Icon(CupertinoIcons.location_fill, color: AppColors.black),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
          ),
        )
      ],
    );
  }
}
