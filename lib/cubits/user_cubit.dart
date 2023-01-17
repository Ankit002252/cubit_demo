import 'dart:convert';

import 'package:cubit_demo/cubits/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api_repo.dart';
import '../model/user_model.dart';
import '../network/rest_api.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.data) : super(WelcomeState()) {
    emit(WelcomeState());
  }

  final DataServices data;

  void getData() {
    //  emit(LoadingState());

    getUserList().then((value) {
      UserModel userModel = UserModel.fromJson(jsonDecode(value));

      if (!value) {
        emit(LoadedState(value));
      } else {
        emit(WelcomeState());
      }
    });
  }
}
