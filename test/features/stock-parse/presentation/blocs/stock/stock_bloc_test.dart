import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_scan/core/constants/app_constants.dart';
import 'package:stock_scan/core/errors/failure.dart';
import 'package:stock_scan/features/stock-parse/domain/entities/scan/scan.dart';
import 'package:stock_scan/features/stock-parse/domain/usecases/get_stock_usecase.dart';
import 'package:stock_scan/features/stock-parse/presentation/blocs/stock/stock_bloc.dart';

import 'stock_bloc_test.mocks.dart';

@GenerateMocks([GetStocksUseCase])
void main() {
  late StockBloc stockBloc;
  late MockGetStocksUseCase mockGetStocksUseCase;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockGetStocksUseCase = MockGetStocksUseCase();
    stockBloc = StockBloc(getStocksUseCase: mockGetStocksUseCase);
  });

  blocTest<StockBloc, StockState>(
    'emits StockLoaded when FetchStockEvent is added successfully',
    build: () {
      final scans = [
        const Scan(
            id: 1,
            name: 'Scan 1',
            tag: 'Tag 1',
            color: 'Color 1',
            criterias: [])
      ];
      when(mockGetStocksUseCase()).thenAnswer((_) async => Right(scans));
      return stockBloc;
    },
    act: (bloc) => bloc.add(FetchStockEvent()),
    expect: () => [
      StockLoading(),
      const StockLoaded(scans: [
        Scan(
            id: 1,
            name: 'Scan 1',
            tag: 'Tag 1',
            color: 'Color 1',
            criterias: [])
      ])
    ],
  );

  blocTest<StockBloc, StockState>(
    'emits StockFetchFailed when FetchStockEvent fails',
    build: () {
      when(mockGetStocksUseCase())
          .thenAnswer((_) async => Left(ServerFailure()));
      return stockBloc;
    },
    act: (bloc) => bloc.add(FetchStockEvent()),
    expect: () => [
      StockLoading(),
      const StockFetchFailed(message: Localization.somethingWentWrong)
    ],
  );
}
