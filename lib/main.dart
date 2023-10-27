import 'package:flutter/material.dart';
import 'package:stock_scan/core/constants/routes.dart';
import 'package:stock_scan/features/stock-parse/presentation/pages/home_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      home: const HomeScreen(),
    );
  }
}
