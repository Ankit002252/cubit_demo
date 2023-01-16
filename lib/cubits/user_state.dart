import '../model/user_model.dart';

abstract class UserState {}

class WelcomeState extends UserState {
  @override
  List<Object> get props => [];
}

class LoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class LoadedState extends UserState {
  UserModel? userModel;

  LoadedState(this.userModel);

  @override
  List<Object> get props => [];
}
