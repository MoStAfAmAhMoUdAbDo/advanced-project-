import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_corse_project/features/auth/signup/data/models/sign_up_request_body.dart';
import 'package:new_corse_project/features/auth/signup/data/repos/sign_up_repo.dart';
import 'package:new_corse_project/features/auth/signup/logic/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(SignUpState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formStateKey = GlobalKey<FormState>();
  void emitSignUpState() async {
    emit(const SignUpState.loading());
    final response = await _signUpRepo.signUp(SignUpRequestBody(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      phone: phoneController.text,
      passwordConfirmation: confirmPasswordController.text,
      gender: 0,
    ));
    response.when(
      success: (signUpResponse) {
        emit(SignUpState.success(signUpResponse));
      },
      failure: (error) {
        emit(SignUpState.error(error: error.apiErrorModel.message ?? ""));
      },
    );
  }
}
