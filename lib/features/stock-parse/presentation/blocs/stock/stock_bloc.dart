// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stock_scan/core/constants/app_constants.dart';
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
      emit(StockLoading());
      final data = await getStocksUseCase();
      data.fold(
          (failure) => emit(
              const StockFetchFailed(message: Localization.somethingWentWrong)),
          (scans) => emit(StockLoaded(scans: scans)));
    } catch (e) {
      emit(const StockFetchFailed(message: Localization.somethingWentWrong));
    }
  }
}
