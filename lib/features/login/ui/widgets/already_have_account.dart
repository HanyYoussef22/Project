import 'package:flutter/material.dart';

import '../../../../core/theming/style/styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(

            children: [
              TextSpan(
                text: 'Already have an account? ',
                style: Styles.font13DarkBulemedium,
              ),
              TextSpan(
                text: 'Sign Up ',
                style: Styles.font13Buleregular,
              ),
            ]
        ));
  }
}
