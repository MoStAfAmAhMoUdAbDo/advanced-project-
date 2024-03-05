import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_corse_project/core/themes/app_strings.dart';
import 'package:new_corse_project/core/themes/custom_text_style.dart';
import 'package:new_corse_project/core/themes/my_assets.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(Assets.assetsImagesDocdocLogoLowOpasity),
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.white, Colors.white.withOpacity(0.0)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [0.18, 0.4],
          )),
          child: Image.asset(Assets.assetsImagesOnboardingDoctor),
        ),
        Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: Text(
              AppStrings.bestDoctorAppointmentApp,
              textAlign: TextAlign.center,
              style: CustomTextStyle.font32BlueBold.copyWith(height: 1.4),
            ))
      ],
    );
  }
}
