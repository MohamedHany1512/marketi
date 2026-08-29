import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:marketi/core/network/api/api_consumer.dart';
import 'package:marketi/core/network/api/dio_consumer.dart';

import 'package:marketi/features/auth/login/data/repo/login_repository.dart';
import 'package:marketi/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:marketi/features/auth/sign_up/data/repo/sign_up_repo.dart';

import 'package:marketi/features/auth/sign_up/presentation/view_model/sign_up_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // =========================
  // Dio
  // =========================

  getIt.registerLazySingleton<Dio>(() => Dio());

  // =========================
  // API Consumer
  // =========================

  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: getIt<Dio>()),
  );

  // =========================
  // Login
  // =========================

  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepository(apiConsumer: getIt<ApiConsumer>()),
  );

  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(repository: getIt<LoginRepository>()),
  );

  // =========================
  // Sign Up
  // =========================

  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepo(apiConsumer: getIt<ApiConsumer>()),
  );

  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(repo: getIt<SignUpRepo>()),
  );
}
