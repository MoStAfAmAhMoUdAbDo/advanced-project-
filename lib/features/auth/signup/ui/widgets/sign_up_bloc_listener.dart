import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_corse_project/core/helpers/extenions.dart';
import 'package:new_corse_project/core/routing/routes.dart';
import 'package:new_corse_project/core/themes/app_colors.dart';
import 'package:new_corse_project/core/widgets/error_dialog.dart';
import 'package:new_corse_project/features/auth/signup/logic/cubit/sign_up_cubit.dart';
import 'package:new_corse_project/features/auth/signup/logic/cubit/sign_up_state.dart';

class SginUpBlocListener extends StatelessWidget {
  const SginUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.myBlue,
                ),
              ),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.loginScreen);
          },
          error: (error) {
            context.pop();
            showDialog(
              context: context,
              builder: (context) => ErrorDialog(
                content: error,
                context: context,
              ),
            );
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
