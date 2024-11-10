import 'package:example_flutter_hans/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyle with AppColor {


  static const InputDecorationTheme inputDecoration = InputDecorationTheme(
    fillColor: AppColor.white70,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AppColor.lightBlue70, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AppColor.errorRed, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AppColor.lightBlue, width: 1),
    ),
  );

  static final ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: const WidgetStatePropertyAll(
        TextStyle(color: Colors.white),
      ),
      backgroundColor: WidgetStateProperty.all(AppColor.lightBlue),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // 8px border radius
        ),
      ),
    ),
  );
}
