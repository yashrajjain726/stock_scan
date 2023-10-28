import 'package:stock_scan/features/stock-parse/data/models/criteria/criteria_model.dart';
import 'package:stock_scan/features/stock-parse/domain/entities/scan/scan.dart';

class ScanModel extends Scan {
  const ScanModel(
      {required super.id,
      required super.name,
      required super.tag,
      required super.color,
      required super.criterias});

  factory ScanModel.fromJson(Map<String, dynamic> json) {
    return ScanModel(
        id: json["id"],
        name: json['name'],
        tag: json['tag'],
        color: json['color'],
        criterias: List<CriteriaModel>.from(
            json['criteria']?.map((x) => CriteriaModel.fromJson(x))));
  }
}
