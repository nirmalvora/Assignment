import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sequoiacapdemo/core/constants/color_constants.dart';
import 'package:sequoiacapdemo/core/constants/font_family_constants.dart';

class Utils {
  static regularTextStyle(
          {fontSize = 14,
          color = Colors.black,
          fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontFamily: FontFamilyConstants.montserratRegular,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.toDouble());
  static boldTextStyle(
          {fontSize = 14,
          color = Colors.black,
          fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontFamily: FontFamilyConstants.montserratBold,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.toDouble());

  static void removeFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static inputBorderStyle({color = Colors.black}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: color,
        ),
      );

  static bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  static button12B(
          {fontSize = 12,
          color = Colors.black,
          fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontFamily: FontFamilyConstants.montserratRegular,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.toDouble());

  static TextStyle captionRegular12(
          {fontSize = 12,
          color = Colors.black,
          fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontFamily: FontFamilyConstants.montserratRegular,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.toDouble());

  static TextStyle bodyReg14(
          {fontSize = 14,
          color = Colors.black,
          fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontFamily: FontFamilyConstants.montserratRegular,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.toDouble());

  static bodyReg16(
          {fontSize = 16,
          color = Colors.black,
          fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontFamily: FontFamilyConstants.montserratRegular,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.toDouble());

  static bodyReg18(
          {fontSize = 18,
          color = Colors.black,
          fontWeight = FontWeight.normal}) =>
      TextStyle(
          fontFamily: FontFamilyConstants.montserratRegular,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.toDouble());

  static H6Bold14(
          {fontSize = 14,
          color = Colors.black,
          fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontFamily: FontFamilyConstants.montserratRegular,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.toDouble());

  static H5Bold16(
          {fontSize = 16,
          color = Colors.black,
          fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontFamily: FontFamilyConstants.montserratRegular,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.toDouble());

  static H4Bold18(
          {fontSize = 18,
          color = Colors.black,
          fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontFamily: FontFamilyConstants.montserratRegular,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.toDouble());

  static H3Bold24(
          {fontSize = 24,
          color = Colors.black,
          fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontFamily: FontFamilyConstants.montserratRegular,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.toDouble());

  static H2Bold32(
          {fontSize = 32,
          color = Colors.black,
          fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontFamily: FontFamilyConstants.montserratRegular,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.toDouble());

  static H1Bold42(
          {fontSize = 42,
          color = Colors.black,
          fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontFamily: FontFamilyConstants.montserratRegular,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.toDouble());

  static tabLabelStyle(
          {fontSize = 10,
          color = Colors.black,
          fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontFamily: FontFamilyConstants.montserratRegular,
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.toDouble());

  static textFieldDecoration(
          {String text = "",
          String? label,
          String? hintText,
          Widget? prefixIcon,
          Widget? suffixIcon}) =>
      InputDecoration(
        hintText: hintText,
        hintStyle: Utils.bodyReg14(
            fontWeight: FontWeight.w400, color: ColorConstants.mediumGrey),
        errorBorder: Utils.inputBorderStyle(color: ColorConstants.primaryColor),
        focusedErrorBorder:
            Utils.inputBorderStyle(color: ColorConstants.primaryColor),
        focusedBorder:
            Utils.inputBorderStyle(color: ColorConstants.primaryColor),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: label,
        labelStyle: Utils.regularTextStyle(color: ColorConstants.lightGrey),
        enabledBorder: Utils.inputBorderStyle(
            color: text != ""
                ? ColorConstants.primaryColor
                : ColorConstants.lightGrey),
      );
}
