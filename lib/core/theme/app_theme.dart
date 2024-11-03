import 'package:example_flutter_hans/core/constant/app_style.dart';
import 'package:flutter/material.dart';

mixin class AppTheme {
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      inputDecorationTheme: AppStyle.inputDecoration,
      elevatedButtonTheme: AppStyle.elevatedButtonThemeData,
    );
  }

  ThemeData get darkTheme {
    return ThemeData();
  }
}
