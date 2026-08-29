import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:marketi/core/network/api/api_consumer.dart';
import 'package:marketi/core/network/api/dio_consumer.dart';

import 'package:marketi/features/auth/login/data/repo/login_repository.dart';
import 'package:marketi/features/auth/login/presentation/view_model/login_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Dio
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );

  // Api Consumer
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(
      dio: getIt<Dio>(),
    ),
  );

  // Login Repository
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepository(
      apiConsumer: getIt<ApiConsumer>(),
    ),
  );

  // Login Cubit
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(
      repository: getIt<LoginRepository>(),
    ),
  );
}