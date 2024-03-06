import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_corse_project/core/helpers/app_regex.dart';
import 'package:new_corse_project/features/auth/logic/cubit/login_cubit.dart';
import 'package:new_corse_project/features/auth/ui/widgets/pasword_validations.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/themes/app_strings.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class EmailAndPasswordSection extends StatefulWidget {
  const EmailAndPasswordSection({super.key});

  @override
  State<EmailAndPasswordSection> createState() =>
      _EmailAndPasswordSectionState();
}

class _EmailAndPasswordSectionState extends State<EmailAndPasswordSection> {
  bool isObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordcontrller;
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
        key: context.read<LoginCubit>().formStateKey,
        child: Column(
          children: [
            CustomTextFormField(
              text: AppStrings.email,
              controller: context.read<LoginCubit>().emailController,
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
              controller: context.read<LoginCubit>().passwordcontrller,
              text: AppStrings.password,
              obscureText: isObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                    isObscureText ? Icons.visibility_off : Icons.visibility),
              ),
              validator: (pasword) {
                if (pasword == null || pasword.isEmpty) {
                  return "please enter valid password";
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
