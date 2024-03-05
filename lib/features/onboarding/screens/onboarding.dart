import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_corse_project/core/helpers/extenions.dart';
import 'package:new_corse_project/core/routing/routes.dart';
import 'package:new_corse_project/core/themes/app_strings.dart';
import 'package:new_corse_project/core/themes/custom_text_style.dart';
import 'package:new_corse_project/features/onboarding/widgets/doctor_image_and_text.dart';
import 'package:new_corse_project/features/onboarding/widgets/get_start_btn.dart';

import '../widgets/doc_logo_and_name.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0.h, bottom: 30.h),
          child: Column(
            children: [
              const DocLogoAndName(),
              SizedBox(height: 30.h),
              const DoctorImageAndText(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                child: Column(
                  children: [
                    Text(
                      AppStrings.manageScheduleMedicalAppointmentsEasily,
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.font13greyRegular,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    GetStartesButton(
                      onPressed: () {
                        context.pushReplacementNamed(Routes.loginScreen);
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
