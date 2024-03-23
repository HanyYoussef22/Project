import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/style/styles.dart';

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Create Account',style: Styles.font24BlueW700,),
        verticalSpace(8),
        Text('Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!', style: Styles.font12GryW700),
      ],
    );
  }
}
