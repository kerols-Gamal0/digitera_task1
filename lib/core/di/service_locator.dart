import 'package:digitera_task1/core/network/dio_module.dart';
import 'package:digitera_task1/features/category/data/repository/category_repository.dart';
import 'package:digitera_task1/features/category/presentation/cubit/category_cubit.dart';
import 'package:digitera_task1/features/home/data/repository/home_repository.dart';
import 'package:digitera_task1/features/home/presentation/cubit/home_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  if (getIt.isRegistered<Dio>()) return;

  final dio = DioModule().provideDio();
  getIt.registerSingleton<Dio>(dio);

  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepository(getIt<Dio>()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepository>()));

  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepository(getIt<Dio>()),
  );
  getIt.registerFactory<CategoryCubit>(
    () => CategoryCubit(getIt<CategoryRepository>()),
  );
}
