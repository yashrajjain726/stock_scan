import 'package:equatable/equatable.dart';
import 'package:stock_scan/features/stock-parse/domain/entities/variable/variable.dart';

class Criteria extends Equatable {
  final String type;
  final String text;
  final Variable? variable;

  const Criteria({required this.type, required this.text, this.variable});

  @override
  List<Object?> get props => [type, text, variable];
}
