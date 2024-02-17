import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/widgets/text_form_field.dart';
import 'package:project/features/login/logic/login_cubit.dart';
import 'package:project/features/login/ui/widgets/password_validdation.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool ObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLenght = false;
  bool visibilty = false;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passController;
    setupPasswordControllerListenner();
  }

  void setupPasswordControllerListenner() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLenght = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: EmailValidate,
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(20),
          AppTextFormField(
            hintText: 'Password',
            validator: PassValidate,
            controller: context.read<LoginCubit>().passController,
            isObscureText: ObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  ObscureText = !ObscureText;
                });
              },
              child: Icon(
                ObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(24),
          Visibility(
            visible: visibilty,
            child: PasswordValiddation(
              hasLowerCase: hasLowerCase,
              hasMinLenght: hasMinLenght,
              hasNumber: hasNumber,
              hasSpecialCharacters: hasSpecialCharacters,
              hasUpperCase: hasUpperCase,
            ),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
  String? EmailValidate(text) {
    if (text!.isEmpty || text.trim().isEmpty) {
      return 'Pleas Enter Your valid Email';
    }
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
    if (!emailValid) {
      return 'Email not Valid';
    }
    return null;
  }

  String? PassValidate(String? text) {
    if (text == null || text.trim().isEmpty) {
      visibilty = true;
      return 'Password is required';
    }

    bool passValid = RegExp(
      r'^(?=.*[a-z])' // At least one lowercase letter
      r'(?=.*[A-Z])'  // At least one uppercase letter
      r'(?=.*\d)'     // At least one digit
      r'(?=.*[@$!%*?&])'  // At least one special character
      ,
    ).hasMatch(text);

    if (!passValid) {
      visibilty = true;
      return 'Password must meet criteria';
    }

    if (text.length < 8) {
      visibilty = true;
      return 'Password must be at least 8 characters long';
    }

    return null;
  }



}
