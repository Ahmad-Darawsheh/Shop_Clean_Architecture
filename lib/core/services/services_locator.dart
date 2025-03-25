import 'package:get_it/get_it.dart';
import 'package:shop_app_clean/core/network/api_service.dart';
import 'package:shop_app_clean/features/login/data/datasources/login_remote_data_source.dart';
import 'package:shop_app_clean/features/login/data/repositories/login_repository_impl.dart';
import 'package:shop_app_clean/features/login/domain/repositories/login_repository.dart';
import 'package:shop_app_clean/features/login/domain/usecases/login_usecase.dart';
import 'package:shop_app_clean/features/login/presentation/bloc/login_bloc.dart';
import 'package:shop_app_clean/features/register/data/datasources/register_remote_data_source.dart';
import 'package:shop_app_clean/features/register/data/repositories/register_repository_impl.dart';
import 'package:shop_app_clean/features/register/domain/repository/register_repository.dart';
import 'package:shop_app_clean/features/register/domain/usecases/register_usecase.dart';
import 'package:shop_app_clean/features/register/presentation/bloc/register_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void setupLocator() {
    // Core
    sl.registerLazySingleton(() => DioClient());

    // Data Sources
    sl.registerLazySingleton(() => LoginRemoteDataSource(dio: sl()));

    // Repositories
    sl.registerLazySingleton<LoginRepository>(
        () => LoginRepositoryImpl(loginRemoteDataSource: sl()));

    // Use Cases
    sl.registerLazySingleton(() => LoginUseCase(loginRepository: sl()));

    // BLoCs
    sl.registerFactory(() => LoginBloc(sl()));

    sl.registerLazySingleton(() => RegisterRemoteDataSource(dio: sl()));

    sl.registerLazySingleton<RegisterRepository>(
        () => RegisterRepositoryImpl(registerRemoteDataSource: sl()));

    sl.registerLazySingleton(() => RegisterUseCase(repository: sl()));

    sl.registerLazySingleton(() => RegisterBloc(registerUseCase: sl()));
  }
}
