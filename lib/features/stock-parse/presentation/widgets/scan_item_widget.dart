import 'package:flutter/material.dart';
import 'package:stock_scan/core/utils.dart';

import 'package:stock_scan/features/stock-parse/domain/entities/scan/scan.dart';

class ScanItemWidget extends StatelessWidget {
  final Scan scan;
  const ScanItemWidget({
    Key? key,
    required this.scan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = checkColor(scan.color);
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/details', arguments: scan),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Container(
          decoration: const BoxDecoration(color: Colors.black),
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    scan.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    scan.tag,
                    style: TextStyle(
                      fontSize: 10,
                      color: color,
                    ),
                  ),
                ],
              ),
              Icon(
                color == Colors.green
                    ? Icons.arrow_upward
                    : Icons.arrow_downward,
                color: color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
