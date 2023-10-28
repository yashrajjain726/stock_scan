import 'package:dartz/dartz.dart';
import 'package:stock_scan/core/errors/failure.dart';
import 'package:stock_scan/features/stock-parse/domain/entities/scan/scan.dart';
import 'package:stock_scan/features/stock-parse/domain/repository/stock_repository.dart';

class GetStocksUseCase {
  StockRepository stockRepository;
  GetStocksUseCase({
    required this.stockRepository,
  });
  Future<Either<Failure, List<Scan>>> call() async {
    return await stockRepository.fetchStockData();
  }
}
