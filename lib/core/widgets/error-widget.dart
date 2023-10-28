import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan/injection.dart';

import '../../features/stock-parse/presentation/blocs/stock/stock_bloc.dart';

class ErrorOccuredWidget extends StatelessWidget {
  const ErrorOccuredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('No Internet connection found, please try again'),
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => context.read<StockBloc>().add(FetchStockEvent()),
          ),
        ],
      ),
    );
  }
}
