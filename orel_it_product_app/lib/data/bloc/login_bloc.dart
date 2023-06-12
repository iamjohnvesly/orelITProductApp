import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import '../../api/api_client.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiClient _apiClient = ApiClient();

  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is PerformLoginEvent) {
      yield LoginLoading();

      try {
        final response = await _apiClient.loginAPI(
          email: event.email,
          password: event.password,
        );

        if (response['error_code'] == null) {
          String refreshToken = response['refresh_token'];
          yield LoginSuccess(refreshToken);
        } else {
          yield LoginError('Error: Invalid Email or Password');
        }
      } catch (e) {
        _apiClient.handleError(e);
        yield LoginError('An error occurred');
      }
    }
  }
}
