import 'package:equatable/equatable.dart';
import 'package:stock_scan/features/stock-parse/domain/entities/subvariable/subvariable.dart';

class Variable extends Equatable {
  final SubVariable? subVariablesOne;
  final SubVariable? subVariablesTwo;
  final SubVariable? subVariablesThree;
  final SubVariable? subVariablesFour;
  const Variable({
    this.subVariablesOne,
    this.subVariablesTwo,
    this.subVariablesThree,
    this.subVariablesFour,
  });

  @override
  List<Object?> get props =>
      [subVariablesOne, subVariablesTwo, subVariablesThree, subVariablesFour];
}
