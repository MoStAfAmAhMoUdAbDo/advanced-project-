import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_corse_project/core/themes/app_colors.dart';
import 'package:new_corse_project/core/themes/custom_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.text,
    this.obscureText,
    this.contentPadding,
    this.enabledBorder,
    this.focesdBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.suffixIcon,
    this.fieldBackGroundColor,
    this.controller,
    required this.validator,
  });
  final String text;
  final bool? obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focesdBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Color? fieldBackGroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validator(value);
      },
      controller: controller,
      decoration: InputDecoration(
        fillColor: fieldBackGroundColor ?? AppColors.moreLightGrey,
        filled: true,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focesdBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppColors.myBlue,
                  width: 1.3,
                )),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppColors.lighterGrey,
                  width: 1.3,
                )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            )),
        hintStyle: hintStyle ?? CustomTextStyle.font14LightGreyRegular,
        hintText: text,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
      style: CustomTextStyle.font14DarkBlueMedium,
    );
  }
}
