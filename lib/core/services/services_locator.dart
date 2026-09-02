import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:marketi/core/network/api/api_consumer.dart';
import 'package:marketi/core/network/api/dio_consumer.dart';

import 'package:marketi/features/auth/login/data/repo/login_repository.dart';
import 'package:marketi/features/auth/login/presentation/view_model/login_cubit.dart';

import 'package:marketi/features/home/data/repos/products_repo.dart';
import 'package:marketi/features/home/presentation/view_model/products_cubit.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  // =========================
  // Network
  // =========================

  sl.registerLazySingleton<Dio>(
    () => Dio(),
  );

  sl.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: sl<Dio>()),
  );

  // =========================
  // Login
  // =========================

  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepository(
      apiConsumer: sl<ApiConsumer>(),
    ),
  );

  sl.registerFactory<LoginCubit>(
    () => LoginCubit(
      repository: sl<LoginRepository>(),
    ),
  );

  // =========================
  // Products
  // =========================
sl.registerLazySingleton<ProductsRepo>(
    () => ProductsRepoImpl(
      apiConsumer: sl<ApiConsumer>(),
    ),
  );

  sl.registerFactory<ProductsCubit>(
    () => ProductsCubit(
      sl<ProductsRepo>(),
    ),
  );
}