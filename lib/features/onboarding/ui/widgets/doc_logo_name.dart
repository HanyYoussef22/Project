import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/style/styles.dart';

class DocLogoName extends StatelessWidget {
  const DocLogoName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/doclogo.svg',),
         SizedBox(width: 8.w,),
         Text('DocDoc',style: Styles.font24BlackW700),
      ],
    );
  }
}
