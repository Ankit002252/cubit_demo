import 'package:cubit_demo/cubits/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api_repo.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.data) : super(WelcomeState()) {
    emit(WelcomeState());
  }

  final DataServices data;


  void getData() {
  //  emit(LoadingState());

    data.getInfo().then((value) {
      print("valyueeeeee-----${value!.toJson()}");
      if(value.data!.isNotEmpty){
        emit(LoadedState(value!));
      }
      else
      {
        emit(LoadedState(value!));
      }

    });



  }
}
