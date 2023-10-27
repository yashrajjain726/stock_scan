import 'package:flutter/material.dart';
import 'package:stock_scan/features/stock-parse/data/models/subvariable/subvariable_model.dart';

class SubVariableItemWidget extends StatelessWidget {
  const SubVariableItemWidget(
      {super.key, this.subVariable, required this.name});
  final SubVariableModel? subVariable;
  final String name;

  @override
  Widget build(BuildContext context) {
    return subVariableItem(context);
  }

  subVariableItem(context) {
    if (subVariable!.type == "value") {
      final firstVal = subVariable!.values!.first;
      return subVariableBodyWidget(context, '', subVariable!.values, firstVal);
    } else if (subVariable!.type == "indicator") {
      final defaultVal = subVariable!.defaultValue;
      return subVariableBodyWidget(context, '', subVariable, defaultVal);
    }
    return const SizedBox.shrink();
  }

  InkWell subVariableBodyWidget(
      BuildContext context, String route, Object? args, num? val) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, route, arguments: args);
        },
        child: Text(
          '($val)',
          style: const TextStyle(
              color: Color.fromARGB(255, 0, 80, 217),
              fontWeight: FontWeight.bold),
        ));
  }
}
