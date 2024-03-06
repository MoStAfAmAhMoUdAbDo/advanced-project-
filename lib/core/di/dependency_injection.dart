import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_corse_project/core/networking/api_service.dart';
import 'package:new_corse_project/core/networking/dio_factory.dart';
import 'package:new_corse_project/features/auth/data/repos/login_repo.dart';
import 'package:new_corse_project/features/auth/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;
Future<void> setUpGetIt() async {
  Dio dio = DioFActory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
