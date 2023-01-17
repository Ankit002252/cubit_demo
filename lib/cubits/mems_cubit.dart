import 'dart:convert';

import 'package:cubit_demo/cubits/user_state.dart';
import 'package:cubit_demo/model/memes_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api_repo.dart';
import '../model/user_model.dart';
import '../network/rest_api.dart';
import 'memes_state.dart';

class MemesCubit extends Cubit<MemesState> {
  MemesCubit({this.data}) : super(MemesWelcomeState()) {
    emit(MemesWelcomeState());
  }

  DataServices? data;

  void getData() {
    //  emit(LoadingState());

    getMemesList().then((value) {
      MemesData memesData = MemesData.fromJson(jsonDecode(value));

      if (memesData.data!=null) {
        emit(MemesLoadedState(memesData));
      } else {
        emit(MemesWelcomeState());
      }
    });
  }
}
