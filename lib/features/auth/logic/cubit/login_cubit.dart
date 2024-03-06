import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_corse_project/features/auth/data/models/login_request_body.dart';
import 'package:new_corse_project/features/auth/data/repos/login_repo.dart';
import 'package:new_corse_project/features/auth/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordcontrller = TextEditingController();
  final formStateKey = GlobalKey<FormState>();
  void emitLoadingState(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await loginRepo.login(loginRequestBody);
    response.when(success: (loginResponse) {
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
}
