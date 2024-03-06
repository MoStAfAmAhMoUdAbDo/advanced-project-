import 'package:flutter/material.dart';
import 'package:new_corse_project/core/di/dependency_injection.dart';
import 'package:new_corse_project/core/routing/app_router.dart';
import 'package:new_corse_project/doc_app.dart';

void main() {
  setUpGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
