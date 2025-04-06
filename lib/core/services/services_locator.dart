import 'package:get_it/get_it.dart';
import 'package:shop_app_clean/core/network/api_service.dart';
import 'package:shop_app_clean/core/services/navigation_service.dart';
import 'package:shop_app_clean/features/authenticate/data/datasources/local_storage_data_source.dart';
import 'package:shop_app_clean/features/authenticate/data/datasources/login_remote_data_source/login_remote_data_source.dart';
import 'package:shop_app_clean/features/authenticate/data/repositories/login_repository_impl/login_repository_impl.dart';
import 'package:shop_app_clean/features/authenticate/domain/repositories/login_repsitory/login_repository.dart';
import 'package:shop_app_clean/features/authenticate/domain/usecases/login_usecase/login_usecase.dart';
import 'package:shop_app_clean/features/authenticate/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:shop_app_clean/features/authenticate/data/datasources/register_remote_data_source/register_remote_data_source.dart';
import 'package:shop_app_clean/features/authenticate/data/repositories/register_repsitory/register_repository_impl.dart';
import 'package:shop_app_clean/features/authenticate/domain/repositories/register_repository/register_repository.dart';
import 'package:shop_app_clean/features/authenticate/domain/usecases/register_usecase/register_usecase.dart';
import 'package:shop_app_clean/features/authenticate/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:shop_app_clean/features/favorites/data/data_source/favorites_remote_data_source.dart';
import 'package:shop_app_clean/features/favorites/data/repository/favorites_impl_repo.dart';
import 'package:shop_app_clean/features/favorites/domain/repository/favorites_base_repo.dart';
import 'package:shop_app_clean/features/favorites/domain/uscase/favorites_use_case.dart';
import 'package:shop_app_clean/features/favorites/presentation/controller/bloc/favorites_bloc.dart';
import 'package:shop_app_clean/features/home/data/datasource/home_remote_data_source.dart';
import 'package:shop_app_clean/features/home/data/repositories/home_repository_impl.dart';
import 'package:shop_app_clean/features/home/domain/repository/home_repository.dart';
import 'package:shop_app_clean/features/home/domain/usecases/home_products_use_case.dart';
import 'package:shop_app_clean/features/home/presentation/bloc/home_bloc.dart';
import 'package:shop_app_clean/features/profile/data/data_source/edit_profile_remote_data_source.dart';
import 'package:shop_app_clean/features/profile/data/repository/edit_profile_impl_repository.dart';
import 'package:shop_app_clean/features/profile/domain/repository/edit_profile_base_repository.dart';
import 'package:shop_app_clean/features/profile/domain/usecase/edit_profile_usecase.dart';
import 'package:shop_app_clean/features/profile/presentation/controller/bloc/edit_profile_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void setupLocator() {
    //Auth :

    //Secure Local Storage for tokens/keys
    sl.registerLazySingleton<LocalStorageDataSource>(
        () => LocalStorageDataSourceImpl());
    // Navigation
    sl.registerLazySingleton(() => NavigationService());
    // Core
    sl.registerLazySingleton(() => DioClient());
    //CacheHelper

    // sl.registerLazySingleton(() => CacheHelper());

    // Data Sources
    sl.registerLazySingleton(() => LoginRemoteDataSource(dio: sl()));

    // Repositories
    sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
        loginRemoteDataSource: sl(), localStorageDataSource: sl()));

    // Use Cases
    sl.registerLazySingleton(() => LoginUseCase(loginRepository: sl()));

    // BLoCs
    sl.registerFactory(() => LoginBloc(sl()));

    sl.registerLazySingleton(() => RegisterRemoteDataSource(dio: sl()));

    sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(
        registerRemoteDataSource: sl(), localStorageDataSource: sl()));

    sl.registerLazySingleton(() => RegisterUseCase(repository: sl()));

    sl.registerLazySingleton(() => RegisterBloc(registerUseCase: sl()));

    //Home :

    sl.registerLazySingleton(
        () => HomeRemoteDataSource(dio: sl(), localStorageDataSource: sl()));

    sl.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(homeRemoteDataSource: sl()));

    sl.registerLazySingleton(() => HomeUseCases(homeRepository: sl()));

    sl.registerLazySingleton(() => HomeBloc(homeUseCase: sl()));

    //Registering stuff for the fetch Favorites screen

    sl.registerLazySingleton(() => FavoritesRemoteDataSource(sl(), sl()));

    sl.registerLazySingleton<FavoritesBaseRepository>(
        () => FavoritesImplRepository(sl()));

    sl.registerLazySingleton(() => FavoritesUseCase(favoritesRepository: sl()));

    sl.registerLazySingleton(() => FavoritesBloc(favoritesUseCase: sl()));

    //Registering stuff for Edit Profile

    sl.registerLazySingleton(() =>
        EditProfileRemoteDataSource(dio: sl(), localStorageDataSource: sl()));

    sl.registerLazySingleton<EditProfileBaseRepository>(
        () => EditProfileImplRepository(sl()));

    sl.registerLazySingleton(() => EditProfileUseCase(sl()));

    sl.registerLazySingleton(() => EditProfileBloc(editProfileUseCase: sl()));
  }
}
