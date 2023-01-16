// enum InternetState {
//   initialInternetState,
//   internetGainedState,
//   lostInternetState
// }

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? _subscription;
  InternetCubit() : super(InternetInitial());

  // void connected() {
  //   emit(ConnectedState(message: "Connected"));
  // }

  // void notConnected() {
  //   emit(NotConnectedState(message: "Not Connected"));
  // }

  void checkConnection() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        emit(ConnectedState(message: "Connected"));
      } else {
        emit(NotConnectedState(message: "Not Connected"));
      }
    });
  }

  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}