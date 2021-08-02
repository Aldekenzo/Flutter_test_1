import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/src/common/constants/color_constants.dart';
import 'package:flutter_application_5/src/common/constants/padding_constants.dart';

class CustomTextFieldDivider extends StatelessWidget {
  const CustomTextFieldDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      color: AppColors.textFieldBorder,
      margin: AppPaddings.horizontal,
    );
  }
}
