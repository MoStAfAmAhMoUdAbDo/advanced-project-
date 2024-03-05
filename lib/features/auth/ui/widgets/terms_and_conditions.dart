import 'package:flutter/material.dart';
import 'package:new_corse_project/core/themes/app_strings.dart';
import 'package:new_corse_project/core/themes/custom_text_style.dart';
import 'package:new_corse_project/core/themes/font_weight_helper.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
            style: CustomTextStyle.font13greyRegular,
            text: AppStrings.loggingYouAgree,
            children: [
              TextSpan(
                  style: CustomTextStyle.font13DarkBlueRegular
                      .copyWith(fontWeight: FontWeightHelper.mediam),
                  text: AppStrings.termsAndConditionsPrivacyPolicy),
            ]));
  }
}
