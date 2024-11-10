import 'package:example_flutter_hans/core/constant/app_text_styles.dart';
import 'package:example_flutter_hans/core/constant/app_theme.dart';
import 'package:flutter/material.dart';

mixin class AppTheme {
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      inputDecorationTheme: AppStyle.inputDecoration,
      elevatedButtonTheme: AppStyle.elevatedButtonThemeData,
      textTheme: AppTextStyle.textTheme
    );
  }

  ThemeData get darkTheme {
    return ThemeData();
  }
}
