import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/login/data/models/login_request_body.dart';
import 'package:project/features/login/logic/login_state.dart';

import '../data/repos/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void emitLoginState() async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(LoginRequestBody(
        email: emailController.text, password: passController.text));

    response.when(success: (loginResponse) {

      emit(LoginState.success(loginResponse));

    }, failure: (error) {

      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));

    });
  }
}
