import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:new_corse_project/core/helpers/check_device_size.dart';
import 'package:new_corse_project/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_corse_project/core/routing/routes.dart';
import 'package:new_corse_project/core/themes/app_colors.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final height = screenSize.height;
    final width = screenSize.width;
    final bool isTablet = checkDeviceIsTablet(context);
    return ScreenUtilInit(
        designSize: Size(
          isTablet ? 400 : width,
          isTablet ? 800 : height,
        ),
        minTextAdapt: true,
        child: MaterialApp(
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.myBlue,
            scaffoldBackgroundColor: Colors.white,
          ),
          initialRoute: Routes.onBordingScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
