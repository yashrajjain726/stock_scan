import 'package:flutter/material.dart';
import 'package:stock_scan/core/utils.dart';
import 'package:stock_scan/features/stock-parse/domain/entities/scan/scan.dart';

class StockDetailHeadWidget extends StatelessWidget {
  const StockDetailHeadWidget({
    super.key,
    required this.scan,
  });

  final Scan scan;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: const Color.fromRGBO(22, 134, 176, 1.000),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            scan.name,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
          Text(
            scan.tag,
            style: TextStyle(
              fontSize: 12,
              color: checkColor(scan.color),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
