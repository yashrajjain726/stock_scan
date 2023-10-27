import 'package:flutter/material.dart';
import 'package:stock_scan/core/constants/routes.dart';
import 'package:stock_scan/features/stock-parse/presentation/pages/home/home_screen.dart';
import 'injection.dart' as di;

Future<void> main() async {
  await di.init();
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
