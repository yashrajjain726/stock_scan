import 'package:stock_scan/features/stock-parse/domain/entities/criteria/criteria.dart';

class CriteriaModel extends Criteria {
  const CriteriaModel(
      {required super.type, required super.text, super.variables});

  factory CriteriaModel.fromJson(Map<String, dynamic> json) {
    return CriteriaModel(
        type: json['type'],
        text: json['text'],
        variables: json['variable'] != null
            ? json['variable'].cast<String, dynamic>()
            : {});
  }
}
