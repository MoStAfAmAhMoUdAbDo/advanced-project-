import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_corse_project/core/helpers/spacing.dart';
import 'package:new_corse_project/core/themes/app_strings.dart';
import 'package:new_corse_project/core/themes/custom_text_style.dart';
import 'package:new_corse_project/core/widgets/custom_button.dart';
import 'package:new_corse_project/features/auth/signup/logic/cubit/sign_up_cubit.dart';
import 'package:new_corse_project/features/auth/signup/ui/widgets/already_have_account.dart';
import 'package:new_corse_project/features/auth/signup/ui/widgets/sign_up_bloc_listener.dart';
import 'package:new_corse_project/features/auth/signup/ui/widgets/sign_up_form.dart';
import 'package:new_corse_project/features/auth/signup/ui/widgets/sign_up_terms_and_conditions.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  AppStrings.createAccount,
                  style: CustomTextStyle.font24BlueBold,
                ),
                verticalSpacing(8),
                Text(
                  AppStrings.largeStringInSignUpSreen,
                  style: CustomTextStyle.font15GreyRegular,
                ),
                verticalSpacing(36),
                Column(
                  children: [
                    const SignUpForm(),
                    verticalSpacing(35),
                    CustomButton(
                      btnText: AppStrings.createAccount,
                      onPressed: () {
                        validateThenSignUp(context);
                      },
                      textStyle: CustomTextStyle.font16WhiteSemiBold,
                    ),
                    verticalSpacing(16),
                    const SignUpTermsAndConditions(),
                    verticalSpacing(60),
                    const AlreadyHaveAccount(),
                    const SginUpBlocListener(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formStateKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpState();
    }
  }
}
