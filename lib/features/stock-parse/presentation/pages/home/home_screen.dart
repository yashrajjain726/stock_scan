import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan/core/widgets/loading_widget.dart';
import 'package:stock_scan/features/stock-parse/presentation/blocs/internet/internet_bloc.dart';
import 'package:stock_scan/features/stock-parse/presentation/blocs/stock/stock_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<StockBloc>(
          create: (context) => sl(),
        ),
        BlocProvider<InternetBloc>(
          create: (context) => sl(),
        ),
      ],
      child: Scaffold(
          appBar: _appBar(),
          body: BlocListener<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetConnectionPassedState) {
                context.read<StockBloc>().add(FetchStockEvent());
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              } else if (state is InternetConnectionFailedState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: BlocConsumer<StockBloc, StockState>(
              listener: (context, state) {
                if (state is StockFetchFailed) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                return BlocBuilder<StockBloc, StockState>(
                  builder: (context, state) {
                    if (state is StockInitial) {
                      context.read<StockBloc>().add(FetchStockEvent());
                    } else if (state is StockFetchFailed) {
                      return const ErrorOccuredWidget();
                    } else if (state is StockLoading) {
                      return const LoadingWidget();
                    } else if (state is StockLoaded) {
                      return ListView.builder(
                          itemCount: state.scans.length,
                          itemBuilder: (context, index) {
                            final scan = state.scans[index];
                            return ScanItemWidget(scan: scan);
                          });
                    }
                    return Container();
                  },
                );
              },
            ),
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
