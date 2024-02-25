import 'package:flutter/material.dart';
import 'package:new_corse_project/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_corse_project/core/routing/routes.dart';
import 'package:new_corse_project/core/themes/app_colors.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
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
