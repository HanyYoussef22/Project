import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/core/helpers/extenation.dart';

import '../../../../core/routing/routers.dart';
import '../../../../core/theming/style/styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(

            children: [
              TextSpan(
                text: 'Don\'t have an account ? ',
                style: Styles.font13DarkBulemedium,
              ),
              TextSpan(
                text: 'Sign Up ',
                style: Styles.font13Buleregular,
                recognizer: TapGestureRecognizer()..onTap=(){
                  context.pushReplacementNamed(Routers.signupScreen);
                }
              ),
            ]
        ));
  }
}
