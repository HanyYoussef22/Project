import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/core/theming/style/colors.dart';

abstract class Styles {


  static const titleStyle30 = TextStyle(

    fontSize: 30,
    fontWeight: FontWeight.w600,
      // fontFamily: kGtSwctrafine
  );

  static  TextStyle font24BlackW700 = TextStyle(
  fontSize: 24.sp,
  fontWeight: FontWeight.w700
   );
  static  TextStyle font32BlueW700 = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
    color: ColorsManger.primaryColor,
  );
  static  TextStyle font12GryW700 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color:ColorsManger.greyColor,
  );

  static const titleStyle20N = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      // fontFamily: kGtSwctrafine
  );

  static const titleStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const titleStyle18N = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  static const titleStyle18o = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static const titleStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const titleStyle14N = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const titleStyle16 = TextStyle(
    fontSize: 14,
    color: Color(0xff707070),

  );
}

