import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/signup_screen/data/models/signup_request_body.dart';
import 'package:project/features/signup_screen/logic/signup_state.dart';

import '../data/repos/signup_repo.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpRepo _signupRepo;

  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmationController = TextEditingController();

  void emitSignupState() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signup(SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        gender: 0,
        password: passController.text,
        passwordConfirmation: passConfirmationController.text));
    response.when(success: (signupResponse) {
      emit(SignupState.success(signupResponse));
    }, failure: (error) {
      emit(SignupState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
