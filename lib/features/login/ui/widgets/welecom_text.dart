import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/style/styles.dart';

class WelecomText extends StatelessWidget {
  const WelecomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome Back',style: Styles.font24BlueW700,),
        verticalSpace(8),
        Text('We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.', style: Styles.font12GryW700),
      ],
    );
  }
}
