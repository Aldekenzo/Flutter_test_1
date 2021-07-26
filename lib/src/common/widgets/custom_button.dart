import 'package:flutter/cupertino.dart';
import 'package:flutter_application_5/src/common/constants/color_constants.dart';
import 'package:flutter_application_5/src/common/constants/padding_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text,
    this.onPressed()?,
  }) : super(key: key);
  final String? text;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: AppColors.main,
      padding: AppPaddings.vertical,
      child: Text(text!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
      onPressed: () {
        onPressed!();
      },
    );
  }
}
