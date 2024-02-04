


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/login/data/models/login_reqest_body.dart';
import 'package:project/features/login/logic/login_state.dart';

import '../data/repos/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void emitLoginState(LoginRequestBody loginRequestBody) async{
    emit(const LoginState.loading());
    final response= await _loginRepo.login(loginRequestBody);
    response.when(success: (loginResponse){
      emit(LoginState.success(loginResponse));
    }, failure: (error){
      emit(LoginState.error(error: error.apiErrorModel.message ??''));
    });
}
}
