import 'package:flutter/material.dart';
import 'package:new_corse_project/core/themes/app_strings.dart';
import 'package:new_corse_project/core/themes/custom_text_style.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
            style: CustomTextStyle.font13DarkBlueRegular,
            text: AppStrings.alreadyHaveAcount,
            children: [
              TextSpan(
                  style: CustomTextStyle.font13BlueSemiBold,
                  text: AppStrings.signUp),
            ]));
  }
}
