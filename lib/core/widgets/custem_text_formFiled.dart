import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/core/theming/font_wiight_helper.dart';
import 'package:project/core/theming/style/colors.dart';

Widget customField({
  VoidCallback? fieldTapping,
  double? height ,
  required String name,
  IconData? prefixIcon,
  Color? fillColor,
  required String? Function(String?) validate,
  IconButton? suffixIcon,
  required TextEditingController controller,
  bool? obsecureText,
  bool? autofocus,
}) {
  return TextFormField(

    autofocus: autofocus ?? false,
    controller: controller,
    validator: validate,
    onTap: fieldTapping,
    obscureText: obsecureText ?? false,
    decoration: InputDecoration(
      hintText: name,
      suffixIcon: suffixIcon,
      hintStyle:  TextStyle(
        color: ColorsManger.lightgrey,
        fontFamily: 'Poppins',
        fontWeight: FontWeightHelper.regular
        // fontWeight: FontWeight.w600,
      ),
      // prefixIcon: Icon(prefixIcon),
      contentPadding: EdgeInsets.symmetric(vertical: height ?? 12.0),
      filled: true,
      fillColor: fillColor,
      enabledBorder:  buildOutlineInputBorder(),
      focusedBorder:  buildOutlineInputBorderf(),
      errorBorder: buildOutlineInputBordere(),
      focusedErrorBorder: buildOutlineInputBordere(),

    ),
  );
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide:  BorderSide(
      width: 0.1.w,
      color: ColorsManger.lighterGray,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}
OutlineInputBorder buildOutlineInputBorderf() {
  return OutlineInputBorder(
    borderSide:  BorderSide(
      width: 0.8.w,
      color: ColorsManger.primaryColor,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}
OutlineInputBorder buildOutlineInputBordere() {
  return OutlineInputBorder(
    borderSide:  BorderSide(
      width: 0.8.w,
      color: Colors.red,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}

