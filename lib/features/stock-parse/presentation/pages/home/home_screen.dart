import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan/core/widgets/loading_widget.dart';
import 'package:stock_scan/features/stock-parse/presentation/bloc/stock_bloc.dart';
import 'package:stock_scan/features/stock-parse/presentation/widgets/scan_item_widget.dart';
import '../../../../../injection.dart';
import '../../../../../core/widgets/error-widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StockBloc>(
      create: (context) => sl(),
      child: Scaffold(
          appBar: _appBar(),
          body: BlocBuilder<StockBloc, StockState>(
            builder: (context, state) {
              if (state is StockInitial) {
                context.read<StockBloc>().add(FetchStockEvent());
              } else if (state is StockFetchFailed) {
                return const ErrorOccuredWidget();
              } else if (state is StockLoaded) {
                return ListView.builder(
                    itemCount: state.scans.length,
                    itemBuilder: (context, index) {
                      final scan = state.scans[index];
                      return ScanItemWidget(scan: scan);
                    });
              }
              return const LoadingWidget();
            },
          )),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'STOCKSCAN MARKET',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
      ),
      centerTitle: true,
    );
  }
}
