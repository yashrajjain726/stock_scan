import 'package:equatable/equatable.dart';
import 'package:stock_scan/features/stock-parse/domain/entities/criteria/criteria.dart';

class Scan extends Equatable {
  final int id;
  final String name;
  final String tag;
  final String color;
  final List<Criteria> criterias;

  const Scan(
      {required this.id,
      required this.name,
      required this.tag,
      required this.color,
      required this.criterias});

  @override
  List<Object> get props {
    return [
      id,
      name,
      tag,
      color,
      criterias,
    ];
  }
}
