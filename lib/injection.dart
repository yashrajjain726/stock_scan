import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:stock_scan/features/stock-parse/data/datasource/api_client.dart';
import 'package:stock_scan/features/stock-parse/data/repository/stock_repository_impl.dart';
import 'package:stock_scan/features/stock-parse/domain/repository/stock_repository.dart';
import 'package:stock_scan/features/stock-parse/domain/usecases/get_stock_usecase.dart';
import 'package:stock_scan/features/stock-parse/presentation/blocs/internet/internet_bloc.dart';
import 'package:stock_scan/features/stock-parse/presentation/blocs/stock/stock_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLOC INJECTION
  sl.registerFactory(() => StockBloc(
        getStocksUseCase: sl(),
      ));
  sl.registerFactory(() => InternetBloc());

  // USECASE INJECTION
  sl.registerLazySingleton(() => GetStocksUseCase(stockRepository: sl()));

  // REPOSITORY INJECTION
  sl.registerLazySingleton<StockRepository>(
    () => StockRepositoryImpl(
      apiClient: sl(),
    ),
  );

  // API CLIENT INJECTION
  sl.registerLazySingleton<ApiClient>(() => ApiClient(client: sl()));

  // EXTERNAL
  sl.registerLazySingleton(() => http.Client());
}
