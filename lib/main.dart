import 'package:example_flutter_hans/core/routes/app_route.dart';
import 'package:example_flutter_hans/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with AppTheme {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
