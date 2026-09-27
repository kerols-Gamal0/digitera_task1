import 'package:digitera_task1/core/network/dio_module.dart';
import 'package:digitera_task1/core/services/push_notification_service.dart';
import 'package:digitera_task1/features/category/data/repository/category_repository.dart';
import 'package:digitera_task1/features/category/presentation/cubit/category_cubit.dart';
import 'package:digitera_task1/features/home/data/repository/home_repository.dart';
import 'package:digitera_task1/features/home/presentation/cubit/home_cubit.dart';
import 'package:digitera_task1/features/register/data/repository/register_repository.dart';
import 'package:digitera_task1/features/register/presentation/cubit/register_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  if (getIt.isRegistered<Dio>()) return;

  final dio = DioModule().provideDio();
  getIt.registerSingleton<Dio>(dio);

  // Push Notification Service
  getIt.registerLazySingleton<PushNotificationService>(
    () => PushNotificationService(),
  );

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

  getIt.registerLazySingleton<RegisterRepository>(
    () => RegisterRepository(getIt<Dio>()),
  );
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterRepository>()),
  );
}
