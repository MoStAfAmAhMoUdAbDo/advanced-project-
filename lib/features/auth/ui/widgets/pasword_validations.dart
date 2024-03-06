import 'package:flutter/material.dart';
import 'package:new_corse_project/core/helpers/spacing.dart';
import 'package:new_corse_project/core/themes/app_colors.dart';
import 'package:new_corse_project/core/themes/custom_text_style.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("At least 1 lowerCase letter", hasLowerCase),
        horizontalSpacing(2),
        buildValidationRow("At least 1 upperCase letter", hasUpperCase),
        horizontalSpacing(2),
        buildValidationRow("At least 1 number letter", hasNumber),
        horizontalSpacing(2),
        buildValidationRow(
            "At least 1 has special character letter", hasSpecialCharacters),
        horizontalSpacing(2),
        buildValidationRow("At least 8 character long", hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColors.myGrey,
        ),
        horizontalSpacing(6),
        Text(
          text,
          style: CustomTextStyle.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? AppColors.myGrey : AppColors.darckBlue,
          ),
        )
      ],
    );
  }
}
