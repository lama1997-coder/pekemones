import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:peko_application/domin/repositories/pekemones_repository.dart';
import 'package:peko_application/domin/usecacess/get_pekemons.dart';

import 'data/datasources/remote_data_source.dart';
import 'data/repositories/pekemones_repository_impl.dart';
import 'presention/bloc/pekemones_bloc.dart';


final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => PekemonesBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetPekemoens(locator()));

  // repository
  locator.registerLazySingleton<PekemonsRepository>(
    () => PekemonsRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImp(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => Dio());
}