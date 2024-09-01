import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_corse_project/core/di/dependency_injection.dart';
import 'package:new_corse_project/core/routing/app_router.dart';
import 'package:new_corse_project/doc_app.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  setUpGetIt();
  // runApp(DevicePreview(
  //   builder: (context) => DocApp(
  //     appRouter: AppRouter(),
  //   ),
  // ));
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
