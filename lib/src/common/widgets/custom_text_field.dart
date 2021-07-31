import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/src/common/constants/color_constants.dart';
import 'package:flutter_application_5/src/common/constants/padding_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.placeholder,
    this.suffix,
    this.controller,
  }) : super(key: key);

  final String? placeholder;
  final Widget? suffix;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placeholder,
      controller: controller,
      style: TextStyle(color: AppColors.black),
      placeholderStyle:
          TextStyle(color: AppColors.textFieldTextColor, fontSize: 16.0),
      suffix: suffix,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide.none,
        top: BorderSide.none,
        left: BorderSide.none,
        right: BorderSide.none,
      )),
      padding: AppPaddings.verthori,
    );
  }
}
