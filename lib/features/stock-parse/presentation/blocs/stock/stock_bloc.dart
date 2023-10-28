// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stock_scan/features/stock-parse/domain/entities/scan/scan.dart';
import 'package:stock_scan/features/stock-parse/domain/usecases/get_stock_usecase.dart';

part 'stock_event.dart';
part 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final GetStocksUseCase getStocksUseCase;
  StockBloc({
    required this.getStocksUseCase,
  }) : super(StockInitial()) {
    on<StockEvent>((event, emit) {});
    on<FetchStockEvent>(_fetchStockData);
  }

  _fetchStockData(FetchStockEvent event, Emitter emitter) async {
    try {
      final data = await getStocksUseCase();
      data.fold(
          (failure) =>
              emit(const StockFetchFailed(message: 'Something went wrong')),
          (scans) => emit(StockLoaded(scans: scans)));
    } catch (e) {
      emit(StockFetchFailed(message: 'Something went wrong'));
    }
  }
}
