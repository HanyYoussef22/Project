
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget CustomButton({
  required String text,
  required onTap,
}) {
  return SizedBox(
    height: 55.h,
    width: double.infinity,
    child: ElevatedButton(

      style: ElevatedButton.styleFrom(
          backgroundColor:  Colors.blueAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
          )
      ),
      onPressed: onTap,
      child: Text(
        text,
        style:  TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            fontFamily: 'Poppins'),
      ),
    ),
  );
}

