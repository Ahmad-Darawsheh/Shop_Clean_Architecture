import 'package:get_it/get_it.dart';
import 'package:shop_app_clean/core/network/api_service.dart';
import 'package:shop_app_clean/features/login/data/datasources/login_remote_data_source.dart';
import 'package:shop_app_clean/features/login/data/repositories/login_repository_impl.dart';
import 'package:shop_app_clean/features/login/domain/repositories/login_repository.dart';
import 'package:shop_app_clean/features/login/domain/usecases/login_usecase.dart';
import 'package:shop_app_clean/features/login/presentation/bloc/login_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void setupLocator() {
    // Core
    sl.registerLazySingleton(() => DioClient());
    
    // Data Sources
    sl.registerLazySingleton(() => LoginRemoteDataSource(dio: sl()));
    
    // Repositories
    sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginRemoteDataSource: sl())
    );
    
    // Use Cases
    sl.registerLazySingleton(() => LoginUseCase(loginRepository: sl()));
    
    // BLoCs
    sl.registerFactory(() => LoginBloc(sl()));
  }
}