part of 'stock_bloc.dart';

abstract class StockState extends Equatable {
  const StockState();

  @override
  List<Object> get props => [];
}

class StockInitial extends StockState {}

class StockLoading extends StockState {}

class StockLoaded extends StockState {
  final List<Scan> scans;
  const StockLoaded({
    required this.scans,
  });
  @override
  List<Object> get props => [scans];
}

class StockFetchFailed extends StockState {
  final String message;
  const StockFetchFailed({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
