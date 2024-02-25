import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_corse_project/core/themes/app_colors.dart';

class CustomTextStyle {
  static TextStyle font24Black700w = TextStyle(
      fontSize: 24.sp, fontWeight: FontWeight.w700, color: Colors.black);
  static TextStyle font32BlueBold = TextStyle(
      fontSize: 32.sp, fontWeight: FontWeight.bold, color: AppColors.myBlue);

  static TextStyle font13grey400w = TextStyle(
      fontSize: 13.sp, fontWeight: FontWeight.w400, color: AppColors.myGrey);

  static TextStyle font16white600w = TextStyle(
      fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white);
}
