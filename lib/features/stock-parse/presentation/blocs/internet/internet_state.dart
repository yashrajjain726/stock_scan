part of 'internet_bloc.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetInitial extends InternetState {}

class InternetConnectionPassedState extends InternetState {
  final String message;
  const InternetConnectionPassedState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class InternetConnectionFailedState extends InternetState {
  final String message;
  const InternetConnectionFailedState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
