import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/features/login/ui/widgets/dont_have_account.dart';
import 'package:project/features/login/ui/widgets/email_and_password.dart';
import 'package:project/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:project/features/login/ui/widgets/tearm_contion_text.dart';
import 'package:project/features/login/ui/widgets/welecom_text.dart';
import '../../../core/widgets/text_button.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/style/styles.dart';
import '../logic/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 35.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const WelecomText(),
                horizontalSpace(38),
                Column(
                  children: [
                    verticalSpace(20),
                    const EmailAndPassword(),
                    verticalSpace(10),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forget Password?',
                          style: Styles.font13Buleregular,
                        )),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: 'Login',
                      textStyle: Styles.font16semiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(20),
                    const TearmAndCondionText(),
                    verticalSpace(50),
                    const DontHaveAccount(),
                    const LoginBlocListener(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void validateThenDoLogin(BuildContext context) {
  if(context.read<LoginCubit>().formKey.currentState!.validate()){
    context.read<LoginCubit>().emitLoginState();
  }

}

