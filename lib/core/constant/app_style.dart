import 'package:flutter/material.dart';

mixin AppStyle {
  static const Color lightBlue70 = Color.fromARGB(255, 184, 208, 248);
  static const Color lightBlue = Color(0xFF448AFF);
  static const Color blueAccent = Color(0xFF448AFF);
  static const Color white70 = Color(0xB3FFFFFF);
  static const Color ash = Color(0xFFBDBDBD);
  static const Color errorRed = Color(0xFFB71C1C);

  static const InputDecorationTheme inputDecoration = InputDecorationTheme(
    fillColor: white70,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: ash, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: errorRed, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: lightBlue, width: 1),
    ),
  );

  static final ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    ),
  );
}
