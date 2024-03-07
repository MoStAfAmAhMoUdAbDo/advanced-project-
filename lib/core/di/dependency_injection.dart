import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_corse_project/core/networking/api_service.dart';
import 'package:new_corse_project/core/networking/dio_factory.dart';
import 'package:new_corse_project/features/auth/login/data/repos/login_repo.dart';
import 'package:new_corse_project/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:new_corse_project/features/auth/signup/data/repos/sign_up_repo.dart';
import 'package:new_corse_project/features/auth/signup/logic/cubit/sign_up_cubit.dart';

final getIt = GetIt.instance;
Future<void> setUpGetIt() async {
  Dio dio = DioFActory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}
