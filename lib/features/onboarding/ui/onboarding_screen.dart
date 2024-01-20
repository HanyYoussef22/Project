import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/core/helpers/extenation.dart';
import 'package:project/core/theming/style/styles.dart';
import 'package:project/features/onboarding/ui/widgets/doc_image_and_text.dart';
import 'package:project/features/onboarding/ui/widgets/doc_logo_name.dart';

import '../../../core/routing/routers.dart';
import '../../../core/widgets/custom_button.dart';

class OnboarderScreen extends StatelessWidget {
  const OnboarderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const DocLogoName(),
                SizedBox(
                  height: 30.h,
                ),
                DocImageAndText(),
                Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    children: [
                      Text(
                        'Manage and schedule all of your medical appointments easily  with Docdoc to get a new experience.',
                        style: Styles.font12GryW700,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      CustomButton(
                          text: 'Get Start',
                          onTap: () {
                            context.pushNamed(Routers.loginScreen);
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
