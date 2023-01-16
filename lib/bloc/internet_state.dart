part of 'internet_bloc.dart';


abstract class InternetStateBloc {}

class InternetInitial extends InternetStateBloc {}

class ConnectedState extends InternetStateBloc {
  final String message;

  ConnectedState({required this.message});
}

class NotConnectedState extends InternetStateBloc {
  final String message;

  NotConnectedState({required this.message});
}
