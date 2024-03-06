import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_corse_project/core/helpers/spacing.dart';
import 'package:new_corse_project/core/themes/app_colors.dart';
import 'package:new_corse_project/core/themes/app_strings.dart';
import 'package:new_corse_project/core/themes/custom_text_style.dart';
import 'package:new_corse_project/core/widgets/custom_button.dart';
import 'package:new_corse_project/features/auth/data/models/login_request_body.dart';
import 'package:new_corse_project/features/auth/logic/cubit/login_cubit.dart';
import 'package:new_corse_project/features/auth/ui/widgets/already_have_account.dart';
import 'package:new_corse_project/features/auth/ui/widgets/email_and_password.dart';
import 'package:new_corse_project/features/auth/ui/widgets/terms_and_conditions.dart';

import '../widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Column(
                  children: [
                    const EmailAndPasswordSection(),
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
                      onPressed: () {
                        validateThenLogin(context);
                      },
                      textStyle: CustomTextStyle.font16WhiteSemiBold,
                    ),
                    verticalSpacing(16),
                    const TermsAndConditionsText(),
                    verticalSpacing(60),
                    const AlreadyHaveAccount(),
                    const LoginBlocListener(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formStateKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoadingState(
            LoginRequestBody(
              email: context.read<LoginCubit>().emailController.text,
              password: context.read<LoginCubit>().passwordcontrller.text,
            ),
          );
    }
  }
}
