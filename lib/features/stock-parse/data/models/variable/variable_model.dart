import 'package:stock_scan/features/stock-parse/data/models/subvariable/subvariable_model.dart';
import 'package:stock_scan/features/stock-parse/domain/entities/variable/variable.dart';

class VariableModel extends Variable {
  const VariableModel(
      {super.subVariablesOne,
      super.subVariablesTwo,
      super.subVariablesThree,
      super.subVariablesFour});

  factory VariableModel.fromJson(Map<String, dynamic> json) {
    return VariableModel(
      subVariablesOne:
          json["\$1"] != null ? SubVariableModel.fromJson(json["\$1"]) : null,
      subVariablesTwo:
          json["\$2"] != null ? SubVariableModel.fromJson(json["\$2"]) : null,
      subVariablesThree:
          json["\$3"] != null ? SubVariableModel.fromJson(json["\$3"]) : null,
      subVariablesFour:
          json["\$4"] != null ? SubVariableModel.fromJson(json["\$4"]) : null,
    );
  }
}
