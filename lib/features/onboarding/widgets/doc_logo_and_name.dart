import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_corse_project/core/themes/custom_text_style.dart';
import 'package:new_corse_project/core/themes/my_assets.dart';

import '../../../core/themes/app_strings.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.assetsImagesDocdocLogo),
        SizedBox(
          width: 10.w,
        ),
        Text(
          AppStrings.appTitle,
          style: CustomTextStyle.font24Black700w,
        )
      ],
    );
  }
}
