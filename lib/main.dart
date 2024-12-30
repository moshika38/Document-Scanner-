import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/theme.dart';
import 'package:flutter_application_1/routing/routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Document Scanner',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouting.router,
    );
  }
}
