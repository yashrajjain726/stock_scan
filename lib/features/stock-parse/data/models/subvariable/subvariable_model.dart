import 'package:stock_scan/features/stock-parse/domain/entities/subvariable/subvariable.dart';

class SubVariableModel extends SubVariable {
  const SubVariableModel(
      {required super.type,
      super.values,
      super.defaultValue,
      super.maxValue,
      super.minValue,
      super.parameterName,
      super.studyType});

  factory SubVariableModel.fromJson(Map<String, dynamic> json) {
    return SubVariableModel(
      type: json['type'],
      values: json['values'] != null
          ? List.from(json['values'].map((element) => element as num))
          : null,
      studyType: json['study_type'],
      parameterName: json['parameter_name'],
      minValue: json['min_value'],
      maxValue: json['max_value'],
      defaultValue: json['default_value'],
    );
  }
}
