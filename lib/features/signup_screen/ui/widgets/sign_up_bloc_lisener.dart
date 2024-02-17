import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/helpers/extenation.dart';
import 'package:project/core/theming/style/styles.dart';
import 'package:project/features/login/logic/login_state.dart';
import 'package:project/features/signup_screen/logic/signup_cubit.dart';
import 'package:project/features/signup_screen/logic/signup_state.dart';

import '../../../../core/routing/routers.dart';
import '../../../../core/theming/style/colors.dart';


class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit,SignupState>(
      listenWhen: (previous, current)=>current is SignupStateLoading || current is SignupStateSuccess || current is SignupStateError,
        listener: (context, state){
        state.whenOrNull(
          loading: (){
            showDialog(context: context, builder: (context) =>
                Center(
                  child: CircularProgressIndicator(
                    color: ColorsManger.primaryColor,
                  ),

                ));
          },
          success: (signUpResponse) {
            context.pop();
            showSuccessDialog(context);
          },
          error: (error) {
            context.pop();
            setupErrorState(context, error);
          },

        );

    },child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Continue'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
                onSurface: Colors.grey,
              ),
              onPressed: () {
                context.pushNamed(Routers.homeScreen);
              },
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context,String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
            size: 32,
          ),
          content: Text('Error: $error',style: Styles.font14DarkBulemedium,),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Got it',style: Styles.font14BlueSemiBold,),
            ),
          ],
        );
      },
    );
  }}
