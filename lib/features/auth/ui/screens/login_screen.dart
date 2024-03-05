import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_corse_project/core/helpers/spacing.dart';
import 'package:new_corse_project/core/themes/app_colors.dart';
import 'package:new_corse_project/core/themes/app_strings.dart';
import 'package:new_corse_project/core/themes/custom_text_style.dart';
import 'package:new_corse_project/core/widgets/custom_button.dart';
import 'package:new_corse_project/core/widgets/custom_text_form_field.dart';
import 'package:new_corse_project/features/auth/ui/widgets/already_have_account.dart';
import 'package:new_corse_project/features/auth/ui/widgets/terms_and_conditions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formStateKey = GlobalKey<FormState>();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.welcomeBack,
                  style: CustomTextStyle.font24BlueBold,
                ),
                verticalSpacing(8),
                Text(
                  AppStrings.loginLargText,
                  style: CustomTextStyle.font15GreyRegular,
                ),
                verticalSpacing(36),
                Form(
                  key: formStateKey,
                  child: Column(
                    children: [
                      CustomTextFormField(text: AppStrings.email),
                      verticalSpacing(16),
                      CustomTextFormField(
                        text: AppStrings.password,
                        obscureText: isObscureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      verticalSpacing(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          AppStrings.forgotPassword,
                          style: CustomTextStyle.font13greyRegular
                              .copyWith(color: AppColors.myBlue),
                        ),
                      ),
                      verticalSpacing(40),
                      CustomButton(
                        btnText: AppStrings.login,
                        onPressed: () {},
                        textStyle: CustomTextStyle.font16WhiteSemiBold,
                      ),
                      verticalSpacing(16),
                      const TermsAndConditionsText(),
                      verticalSpacing(60),
                      const AlreadyHaveAccount()
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
