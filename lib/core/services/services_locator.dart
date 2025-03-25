import 'package:get_it/get_it.dart';
import 'package:shop_app_clean/core/network/api_service.dart';
import 'package:shop_app_clean/core/services/navigation_service.dart';
import 'package:shop_app_clean/features/authenticate/data/datasources/login_remote_data_source/login_remote_data_source.dart';
import 'package:shop_app_clean/features/authenticate/data/repositories/login_repository_impl/login_repository_impl.dart';
import 'package:shop_app_clean/features/authenticate/domain/repositories/login_repsitory/login_repository.dart';
import 'package:shop_app_clean/features/authenticate/domain/usecases/login_usecase/login_usecase.dart';
import 'package:shop_app_clean/features/authenticate/presentation/login_bloc/login_bloc.dart';
import 'package:shop_app_clean/features/authenticate/data/datasources/register_remote_data_source/register_remote_data_source.dart';
import 'package:shop_app_clean/features/authenticate/data/repositories/register_repsitory/register_repository_impl.dart';
import 'package:shop_app_clean/features/authenticate/domain/repositories/register_repository/register_repository.dart';
import 'package:shop_app_clean/features/authenticate/domain/usecases/register_usecase/register_usecase.dart';
import 'package:shop_app_clean/features/authenticate/presentation/bloc/register_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void setupLocator() {
    // Navigation
    sl.registerLazySingleton(() => NavigationService());
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
