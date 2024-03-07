import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_corse_project/core/helpers/app_regex.dart';
import 'package:new_corse_project/features/auth/login/ui/widgets/pasword_validations.dart';
import 'package:new_corse_project/features/auth/signup/logic/cubit/sign_up_cubit.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/themes/app_strings.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  bool isObscureTextpassword = true;
  bool isObscureTextConfirmPassword = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<SignUpCubit>().formStateKey,
        child: Column(
          children: [
            CustomTextFormField(
              text: AppStrings.name,
              controller: context.read<SignUpCubit>().nameController,
              validator: (name) {
                if (name == null || name.isEmpty) {
                  return "please enter valid Name";
                }
              },
            ),
            verticalSpacing(16),
            CustomTextFormField(
              text: AppStrings.email,
              controller: context.read<SignUpCubit>().emailController,
              validator: (email) {
                if (email == null ||
                    email.isEmpty ||
                    !AppRegex.isEmailValid(email)) {
                  return "please enter valid email";
                }
              },
            ),
            verticalSpacing(16),
            CustomTextFormField(
              text: AppStrings.phoneNumber,
              controller: context.read<SignUpCubit>().phoneController,
              validator: (phone) {
                if (phone == null ||
                    phone.isEmpty ||
                    !AppRegex.isPhoneNumberValid(phone)) {
                  return "please enter valid Phone Number";
                }
              },
            ),
            verticalSpacing(16),
            CustomTextFormField(
              controller: context.read<SignUpCubit>().passwordController,
              text: AppStrings.password,
              obscureText: isObscureTextpassword,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureTextpassword = !isObscureTextpassword;
                  });
                },
                child: Icon(isObscureTextpassword
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              validator: (pasword) {
                if (pasword == null || pasword.isEmpty) {
                  return "please enter valid password";
                }
              },
            ),
            verticalSpacing(16),
            CustomTextFormField(
              controller: context.read<SignUpCubit>().confirmPasswordController,
              text: AppStrings.confirmPassword,
              obscureText: isObscureTextConfirmPassword,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureTextConfirmPassword =
                        !isObscureTextConfirmPassword;
                  });
                },
                child: Icon(isObscureTextConfirmPassword
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              validator: (pasword) {
                if (pasword == null || pasword.isEmpty) {
                  return "please enter confirmation password";
                }
              },
            ),
            verticalSpacing(24),
            PasswordValidations(
                hasLowerCase: hasLowerCase,
                hasUpperCase: hasUpperCase,
                hasSpecialCharacters: hasSpecialCharacters,
                hasNumber: hasNumber,
                hasMinLength: hasMinLength),
          ],
        ));
  }
}
