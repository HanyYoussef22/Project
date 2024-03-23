import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/widgets/text_form_field.dart';
import 'package:project/features/login/ui/widgets/password_validdation.dart';
import 'package:project/features/signup_screen/logic/signup_cubit.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<SignUpForm> {
  bool obscureText = true;
  bool passConfirmationObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLenght = false;
  bool isPassMatch=false;
  bool visibilty = false;
  late TextEditingController passwordController;
  late TextEditingController Controller;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passController;
    Controller=context.read<SignupCubit>().passConfirmationController;
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
       isPassMatch=AppRegex.isPasswordMatch(Controller.text, passwordController.text);


      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          verticalSpace(20),
          AppTextFormField(
            hintText: 'Phone number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<SignupCubit>().phoneController,
          ),
          verticalSpace(20),
          AppTextFormField(
            hintText: 'Email',
            validator: EmailValidate,
            controller: context.read<SignupCubit>().emailController,
          ),
          verticalSpace(20),
          AppTextFormField(
            hintText: 'Password',
            validator: PassValidate,
            controller: context.read<SignupCubit>().passController,
            isObscureText: obscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(20),
          AppTextFormField(
            hintText: 'Password',
            validator: PassValidate,
            controller: context.read<SignupCubit>().passConfirmationController,
            isObscureText: passConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  passConfirmationObscureText = !passConfirmationObscureText;
                });
              },
              child: Icon(
                passConfirmationObscureText ? Icons.visibility_off : Icons.visibility,
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
      r'(?=.*[A-Z])' // At least one uppercase letter
      r'(?=.*\d)' // At least one digit
      r'(?=.*[@$!%*?&])' // At least one special character
      ,
    ).hasMatch(text);

    if (!passValid ) {
      visibilty = true;
      return 'Password must meet criteria';
    }
    if (isPassMatch) {
      visibilty = true;
      return 'Don\'t match';
    }

    if (text.length < 8) {
      visibilty = true;
      return 'Password must be at least 8 characters long';
    }

    return null;
  }
}
