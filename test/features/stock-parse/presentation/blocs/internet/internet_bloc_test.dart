import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_scan/core/constants/app_constants.dart';
import 'package:stock_scan/features/stock-parse/presentation/blocs/internet/internet_bloc.dart';

import 'internet_bloc_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  group('InternetBloc Tests', () {
    late InternetBloc internetBloc;
    late MockConnectivity mockConnectivity;

    setUp(() {
      mockConnectivity = MockConnectivity();
      internetBloc = InternetBloc();
    });

    tearDown(() {
      internetBloc.close();
    });

    blocTest<InternetBloc, InternetState>(
      'emits InternetConnectionPassedState when connectivity is successful',
      build: () {
        when(mockConnectivity.onConnectivityChanged).thenAnswer(
          (_) => Stream<ConnectivityResult>.fromIterable(
              [ConnectivityResult.mobile]),
        );
        return internetBloc;
      },
      act: (bloc) => bloc.add(InternetConnectionSuccessEvent()),
      expect: () => [
        const InternetConnectionPassedState(
            message: Localization.internetConnected)
      ],
    );

    blocTest<InternetBloc, InternetState>(
      'emits InternetConnectionFailedState when connectivity fails',
      build: () {
        when(mockConnectivity.onConnectivityChanged).thenAnswer(
          (_) => Stream<ConnectivityResult>.fromIterable(
              [ConnectivityResult.none]),
        );
        return internetBloc;
      },
      act: (bloc) => bloc.add(InternetConnectionFailureEvent()),
      expect: () => [
        const InternetConnectionFailedState(
            message: Localization.internetDisconnected)
      ],
    );
  });
}
