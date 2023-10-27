import 'package:flutter/material.dart';
import 'package:stock_scan/features/stock-parse/domain/entities/scan/scan.dart';
import 'package:stock_scan/features/stock-parse/presentation/pages/stock_detail/widgets/stock_criteria_item_widget.dart';
import 'package:stock_scan/features/stock-parse/presentation/pages/stock_detail/widgets/stock_detail_head_widget.dart';

class StockDetailScreen extends StatelessWidget {
  final Scan scan;
  const StockDetailScreen({super.key, required this.scan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            StockDetailHeadWidget(scan: scan),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                  itemCount: scan.criterias.length,
                  itemBuilder: (context, index) {
                    return StockCriteriaItemWidget(
                        criteria: scan.criterias[index]);
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
