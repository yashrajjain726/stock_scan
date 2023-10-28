part of 'internet_bloc.dart';

abstract class InternetEvent extends Equatable {
  const InternetEvent();

  @override
  List<Object> get props => [];
}

class InternetConnectionSuccessEvent extends InternetEvent {}

class InternetConnectionFailureEvent extends InternetEvent {}
