import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/core/theming/style/styles.dart';

class DocImageAndText extends StatelessWidget {
  const DocImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svgs/doc_logo_opacity.svg'),
        Container(
            foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0.0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.14, 0.4])),
            child: Image.asset('assets/images/docdoc.png')),
        Positioned(
            bottom: 18.h,
            left: 0.w,
            right: 0.w,
            child: Text(
              'Best Doctor\nAppointment App',
              textAlign: TextAlign.center,
              style: Styles.font32BlueW700,
            ))
      ],
    );
  }
}
