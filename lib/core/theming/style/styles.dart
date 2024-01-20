import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/core/theming/font_wiight_helper.dart';
import 'package:project/core/theming/style/colors.dart';

abstract class Styles {

  static  TextStyle font24BlackW700 = TextStyle(
  fontSize: 24.sp,
  fontWeight: FontWeight.w700
   );
  static  TextStyle font16semiBold = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.semiBold,
    color: ColorsManger.whiteColor,
  );
  static  TextStyle font14DarkBulemedium = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsManger.darkblue
  );
  static  TextStyle font13DarkBulemedium = TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsManger.darkblue
  );
  static  TextStyle font13Gryregular = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManger.greyColor
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
  static  TextStyle font24BlueW700 = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: ColorsManger.primaryColor
  );
  static  TextStyle font14LightGryRegular = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.medium,
      color: ColorsManger.lightgrey
  );
  static  TextStyle font13Buleregular = TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManger.primaryColor
  );

}

