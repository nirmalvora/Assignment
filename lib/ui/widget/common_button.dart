import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sequoiacapdemo/core/constants/color_constants.dart';
import 'package:sequoiacapdemo/core/utils/utils.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPress;
  const CustomButton({Key? key, required this.text, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 16)),
          backgroundColor:
              MaterialStateProperty.all(ColorConstants.primaryColor)),
      onPressed: onPress,
      child: Center(
        child: Text(
          text,
          style: Utils.boldTextStyle(
              color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
