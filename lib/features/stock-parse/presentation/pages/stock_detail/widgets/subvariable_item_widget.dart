import 'package:flutter/material.dart';
import 'package:stock_scan/core/constants/routes.dart';
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
      final sortedList;
      if (firstVal > 0) {
        sortedList = subVariable!.values!;
        sortedList.sort((num a, num b) {
          return a.compareTo(b);
        });
      } else {
        sortedList = subVariable!.values;
        sortedList.sort((num a, num b) {
          return b.compareTo(a);
        });
      }
      return subVariableBodyWidget(
          context, AppRoutes.valueDetail, sortedList, firstVal);
    } else if (subVariable!.type == "indicator") {
      final defaultVal = subVariable!.defaultValue;
      return subVariableBodyWidget(
          context, AppRoutes.setParam, subVariable, defaultVal);
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
