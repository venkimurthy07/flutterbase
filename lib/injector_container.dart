import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/features/domain/usecase/get_breeds_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/utils/my_shared_pref.dart';
import 'features/data/client/client.dart';
import 'features/data/datasource/local_datasource.dart';
import 'features/data/datasource/remote_datasource.dart';
import 'features/data/repositories/repository_impl.dart';
import 'features/domain/repositories/repository.dart';
import 'features/presentation/breeds_bloc.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => BreedsBloc(getBreedsUseCase: sl()));

  // UseCase
  sl.registerLazySingleton(() => GetBreedsUseCase(sl()));

  // repository
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(
        localDataSource: sl(),
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  // Data Sources
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));
  // No access to DB provider, job of LocalDataSource to choose which source
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(
        mySharedPref: sl(),
      ));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<MySharedPref>(() => MySharedPref(sl()));

  // initializing dio
  final dio = Dio();
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  final diologout = Dio();
  diologout.interceptors
      .add(LogInterceptor(requestBody: true, responseBody: true));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton(() => RestClient(dio, sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());
}
