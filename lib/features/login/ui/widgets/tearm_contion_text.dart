import 'package:flutter/material.dart';
import 'package:project/core/theming/style/styles.dart';

class TearmAndCondionText extends StatelessWidget {
  const TearmAndCondionText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
        text: TextSpan(
      children: [
        TextSpan(
          text: 'By logging, you agree to our ',
          style: Styles.font13Gryregular,
        ),
        TextSpan(
          text: 'Terms & Conditions ',
          style: Styles.font13DarkBulemedium,
        ),
        TextSpan(
          text: 'and',
          style: Styles.font13Gryregular.copyWith(height: 1.56),
        ),
        TextSpan(
          text: ' PrivacyPolicy.',
          style: Styles.font13DarkBulemedium,
        ),
      ]
    ));
  }
}
