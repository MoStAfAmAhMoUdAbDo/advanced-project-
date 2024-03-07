// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';
import 'package:new_corse_project/core/di/dependency_injection.dart';
import 'package:new_corse_project/core/routing/routes.dart';
import 'package:new_corse_project/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:new_corse_project/features/auth/login/ui/screens/login_screen.dart';
import 'package:new_corse_project/features/auth/signup/logic/cubit/sign_up_cubit.dart';
import 'package:new_corse_project/features/auth/signup/ui/screens/sign_up_screen.dart';
import 'package:new_corse_project/features/home/ui/screens/hom_screen.dart';
import 'package:new_corse_project/features/onboarding/screens/onboarding.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBordingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
