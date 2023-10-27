import 'package:flutter/material.dart';
import 'package:stock_scan/core/widgets/page_not_found.dart';
import 'package:stock_scan/features/stock-parse/domain/entities/scan/scan.dart';
import 'package:stock_scan/features/stock-parse/presentation/pages/home/home_screen.dart';
import 'package:stock_scan/features/stock-parse/presentation/pages/stock_detail/stock_detail_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/home':
      return buildRoute(screen: const HomeScreen());
    case "/details":
      var scan = settings.arguments as Scan;
      return buildRoute(screen: StockDetailScreen(scan: scan));

    default:
      return buildRoute(screen: const NoPageFound());
  }
}

buildRoute({required Widget screen}) {
  return MaterialPageRoute(builder: (_) => screen);
}
