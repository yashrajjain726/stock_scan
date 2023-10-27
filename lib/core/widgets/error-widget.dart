import 'package:flutter/material.dart';
import 'package:stock_scan/features/stock-parse/presentation/bloc/stock_bloc.dart';
import 'package:stock_scan/injection.dart';

class ErrorOccuredWidget extends StatelessWidget {
  const ErrorOccuredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () => sl<StockBloc>().add(FetchStockEvent()),
      ),
    );
  }
}
