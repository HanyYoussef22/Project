import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/core/helpers/extenation.dart';

import '../../../../core/routing/routers.dart';
import '../../../../core/theming/style/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(

            children: [
              TextSpan(
                text: 'Already have an account ? ',
                style: Styles.font13DarkBulemedium,
              ),
              TextSpan(
                  text: 'Login ',
                  style: Styles.font13Buleregular,
                  recognizer: TapGestureRecognizer()..onTap=(){
                    context.pushReplacementNamed(Routers.loginScreen);
                  }
              ),
            ]
        ));
  }
}
