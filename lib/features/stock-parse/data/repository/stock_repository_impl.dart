import 'package:dartz/dartz.dart';
import 'package:stock_scan/core/errors/exceptions.dart';
import 'package:stock_scan/core/errors/failure.dart';
import 'package:stock_scan/features/stock-parse/data/datasource/api_client.dart';
import 'package:stock_scan/features/stock-parse/data/models/scan/scan_model.dart';
import 'package:stock_scan/features/stock-parse/domain/repository/stock_repository.dart';

class StockRepositoryImpl extends StockRepository {
  final ApiClient apiClient;

  StockRepositoryImpl({required this.apiClient});

  @override
  Future<Either<Failure, List<ScanModel>>> fetchStockData() async {
    try {
      final List<ScanModel> data = await apiClient.fetchStocksData();
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
