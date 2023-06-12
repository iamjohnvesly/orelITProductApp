abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String refreshToken;

  LoginSuccess(this.refreshToken);
}

class LoginError extends LoginState {
  final String errorMessage;

  LoginError(this.errorMessage);
}
