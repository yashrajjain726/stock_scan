import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stock_scan/features/stock-parse/data/models/subvariable/subvariable_model.dart';
import 'package:stock_scan/features/stock-parse/domain/entities/criteria/criteria.dart';
import 'package:stock_scan/features/stock-parse/presentation/pages/stock_detail/widgets/subvariable_item_widget.dart';

class StockCriteriaItemWidget extends StatelessWidget {
  const StockCriteriaItemWidget({
    super.key,
    required this.criteria,
  });

  final Criteria criteria;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    final texts = criteria.text.split(" ");
    if (criteria.type == "plain_text") {
      for (var item in texts) {
        widgets.add(Text(utf8.decode(item.codeUnits)));
      }
    } else if (criteria.type == "variable") {
      for (var item in texts) {
        if (item.startsWith('\$')) {
          criteria.variables!.forEach((key, value) {
            if (key == item) {
              SubVariableModel subVariable = SubVariableModel.fromJson(value);
              widgets.add(
                  SubVariableItemWidget(name: item, subVariable: subVariable));
            }
          });
        } else {
          widgets.add(Text(utf8.decode(item.codeUnits)));
        }
      }
    }
    return stockCriteriaBody(widgets);
  }

  Padding stockCriteriaBody(List<Widget> widgets) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Wrap(spacing: 4, children: widgets)]),
      ),
    );
  }
}
