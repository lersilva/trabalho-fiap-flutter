import 'package:trabalho2/models/user_model.dart';

abstract class AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  final UserModel user;

  Authenticated(this.user);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}


class AuthAuthState extends AuthState {
  List<UserModel> users;
  AuthAuthState(this.users);
}