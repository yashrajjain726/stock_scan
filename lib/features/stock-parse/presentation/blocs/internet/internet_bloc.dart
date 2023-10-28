import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? subscription;
  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>((event, emit) {});
    on<InternetConnectionSuccessEvent>((event, emit) {
      emit(const InternetConnectionPassedState(message: 'CONNECTED'));
    });
    on<InternetConnectionFailureEvent>((event, emit) {
      emit(const InternetConnectionFailedState(message: 'DISCONNECTED'));
    });

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(InternetConnectionSuccessEvent());
      } else {
        add(InternetConnectionFailureEvent());
      }
    });
  }
  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }
}
