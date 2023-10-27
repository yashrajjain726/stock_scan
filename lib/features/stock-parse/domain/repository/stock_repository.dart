import 'package:dartz/dartz.dart';
import 'package:stock_scan/core/errors/failure.dart';
import 'package:stock_scan/features/stock-parse/domain/entities/scan/scan.dart';

abstract class StockRepository {
  Future<Either<Failure, List<Scan>>> fetchStockData();
}
