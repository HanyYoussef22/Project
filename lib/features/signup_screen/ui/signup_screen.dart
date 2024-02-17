import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/features/signup_screen/logic/signup_cubit.dart';
import 'package:project/features/signup_screen/ui/widgets/already_have_account_text.dart';
import 'package:project/features/signup_screen/ui/widgets/create_account_text.dart';
import 'package:project/features/signup_screen/ui/widgets/sign_up_bloc_lisener.dart';
import 'package:project/features/signup_screen/ui/widgets/signup_form.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/style/styles.dart';
import '../../../core/widgets/text_button.dart';
import '../../login/ui/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 35.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CreateAccountText(),
                Column(
                  children: [
                    verticalSpace(20),
                    const SignUpForm(),
                    verticalSpace(10),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forget Password?',
                          style: Styles.font13Buleregular,
                        )),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: 'Sign Up ',
                      textStyle: Styles.font16semiBold,
                      onPressed: () {
                        validateThenDoSignUp(context);
                      },
                    ),

                    verticalSpace(50),
                    const AlreadyHaveAccountText(),
                    const SignUpBlocListener(),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
  void  validateThenDoSignUp(BuildContext context) {
    if(context.read<SignupCubit>().formKey.currentState!.validate()){
      context.read<SignupCubit>().emitSignupState();
    }
}}
