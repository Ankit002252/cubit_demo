import '../model/memes_model.dart';
import '../model/user_model.dart';

abstract class MemesState {}

class MemesWelcomeState extends MemesState {
  @override
  List<Object> get props => [];
}

class MemesLoadingState extends MemesState {
  @override
  List<Object> get props => [];
}

class MemesLoadedState extends MemesState {
  MemesData? memesData;

  MemesLoadedState(this.memesData);

  @override
  List<Object> get props => [];
}
