import 'package:stock_scan/features/stock-parse/data/models/variable/variable_model.dart';
import 'package:stock_scan/features/stock-parse/domain/entities/criteria/criteria.dart';

class CriteriaModel extends Criteria {
  const CriteriaModel(
      {required super.type, required super.text, super.variable});

  factory CriteriaModel.fromJson(Map<String, dynamic> json) {
    return CriteriaModel(
      type: json['type'],
      text: json['text'],
      variable: json['variable'] != null
          ? VariableModel.fromJson(json['variable'])
          : null,
    );
  }
}
