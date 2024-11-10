import 'package:example_flutter_hans/core/routes/app_route.dart';
import 'package:example_flutter_hans/core/theme/app_theme.dart';
import 'package:example_flutter_hans/data/client_service.dart';
import 'package:flutter/material.dart';

void main() {
  setupDependencies();
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
      themeMode: ThemeMode.system,
    );
  }
}
