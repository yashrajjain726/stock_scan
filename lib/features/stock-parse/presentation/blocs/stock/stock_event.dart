part of 'stock_bloc.dart';

abstract class StockEvent extends Equatable {
  const StockEvent();

  @override
  List<Object> get props => [];
}

class FetchStockEvent extends StockEvent {
  @override
  List<Object> get props => [];
}
