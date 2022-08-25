import 'package:trabalho2/models/user_model.dart';

abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  String username;
  String password;
  String tipo;
}

class LoginUser extends AuthEvent {
  String username;
  String password;
}

class Logout extends AuthEvent {}

class InnerServerEvent extends AuthEvent {
  final UserModel userModel;

  InnerServerEvent(this.userModel);
}

class ReceivedNewList extends AuthEvent {
  List<UserModel> users;
  ReceivedNewList(this.users);
}
