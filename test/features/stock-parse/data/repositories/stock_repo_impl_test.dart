import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_scan/core/errors/exceptions.dart';
import 'package:stock_scan/core/errors/failure.dart';
import 'package:stock_scan/features/stock-parse/data/datasource/api_client.dart';
import 'package:stock_scan/features/stock-parse/data/models/scan/scan_model.dart';
import 'package:stock_scan/features/stock-parse/data/repository/stock_repository_impl.dart';

import '../../../../utils/utils.dart';
import 'stock_repo_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  group('StockRepositoryImpl Tests', () {
    late StockRepositoryImpl stockRepository;
    late MockApiClient mockApiClient;

    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      mockApiClient = MockApiClient();
      stockRepository = StockRepositoryImpl(apiClient: mockApiClient);
    });

    test('fetchStockData should return a list of ScanModel on success',
        () async {
      final json = await getJsonData('assets/test/scan_model.json');
      final scan = ScanModel.fromJson(json);
      final mockData = [scan];
      when(mockApiClient.fetchStocksData()).thenAnswer((_) async => mockData);

      final result = await stockRepository.fetchStockData();

      expect(result, Right(mockData));
      verify(mockApiClient.fetchStocksData());
      verifyNoMoreInteractions(mockApiClient);
    });

    test('fetchStockData should return a ServerFailure on server exception',
        () async {
      when(mockApiClient.fetchStocksData()).thenThrow(ServerException());
      final result = await stockRepository.fetchStockData();
      expect(result, Left(ServerFailure()));
      verify(mockApiClient.fetchStocksData());
      verifyNoMoreInteractions(mockApiClient);
    });
  });
}
