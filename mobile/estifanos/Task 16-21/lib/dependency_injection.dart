import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Features/todo/Data/data sources/local_data_source.dart';
import 'Features/todo/Data/data sources/remote_data_source.dart';
import 'Features/todo/Data/repositories/product_repository_implementation.dart';
import 'Features/todo/Domain/repositories/ProductRepository.dart';
import 'Features/todo/Domain/usecase/DeleteProduct.dart';
import 'Features/todo/Domain/usecase/GetProductAll.dart';
import 'Features/todo/Domain/usecase/GetProductById.dart';
import 'Features/todo/Domain/usecase/InsertProduct.dart';
import 'Features/todo/Domain/usecase/UpdateProduct.dart';
import 'Features/todo/Presentation/bloc/home/home_bloc.dart';
import 'Core/platform/network_info.dart';
import 'package:http/http.dart' as http;

import 'authentication/Features/todo/Data/data sources/Remote_data_source.dart';
import 'authentication/Features/todo/Data/repositories/Product_repository_implementation.dart';
import 'authentication/Features/todo/Domain/repository/AuthRepository.dart';
import 'authentication/Features/todo/Domain/usecase/logOut.dart';
import 'authentication/Features/todo/Domain/usecase/login.dart';
import 'authentication/Features/todo/Domain/usecase/signUp.dart';
import 'authentication/Features/todo/Presentation/bloc/Auth/auth_bloc.dart';


// **by using getIT your classes don’t need to know how to create their dependencies. They just need to know how to use them.

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // External dependencies
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client()); // Register HTTP client


  // Register SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ProductLocalDataSource>(() => ProductLocalDataSourceImpl(sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
    remoteDataSource: sl(),
    localDataSource: sl(),
    networkInfo: sl(),
  ));

  sl.registerLazySingleton<AuthRemoteDataSource>(()=> AuthRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      RemoteDataSource: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => GetProductAllUsecase(sl()));
  sl.registerLazySingleton(() => InsertProductUsecase(sl()));
  sl.registerLazySingleton(() => GetProductByIdUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProductUsecase(sl()));
  sl.registerLazySingleton(() => DeleteProductUsecase(sl()));

  // --------------- for Authentication Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => signupUseCase(sl()));


  // BLoC
  sl.registerFactory(() => HomeBloc(
    getProductAllUsecase: sl(),
    deleteProductUsecase: sl(),
    insertProductUsecase: sl(),
    updateProductUsecase: sl(),
  ));

  // Auth Bloc
  sl.registerFactory(() => AuthBloc(
      loginUseCase: sl(),
      logoutUseCase: sl(),
      signUpUseCase: sl(),
  ));
}

//then initialize get it in the main