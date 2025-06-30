import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../../../core/network/api_client.dart';
import '../../../../core/network/di.dart';
import '../../data/datasources/home_local_datasource.dart';
import '../../data/datasources/home_remote_datasource.dart';
import '../../data/repository/home_repo_impl.dart';
import '../../domain/use_cases/saveNearByCinemasUseCase.dart';
import '../../domain/use_cases/getComingSoonUsesCase.dart';
import '../../domain/use_cases/getNearByCinemasUseCase.dart';


Future<void> homeSetupLocator()async {

  getCoreIt.registerSingleton<HomeRemoteDataSourceImpl>(HomeRemoteDataSourceImpl(getCoreIt<ApiClient>()));
  getCoreIt.registerSingleton<HomeLocalDataSourceImpl>(HomeLocalDataSourceImpl());
  getCoreIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(remoteDataSource:getCoreIt<HomeRemoteDataSourceImpl>(),localDataSource:getCoreIt<HomeLocalDataSourceImpl>()));
  //
  getCoreIt.registerSingleton<GetComingSoonUseCase>(GetComingSoonUseCase(repository: getCoreIt<HomeRepoImpl>()));
  getCoreIt.registerSingleton<GetNearByCinemasUseCase>(GetNearByCinemasUseCase(repository: getCoreIt<HomeRepoImpl>()));
  getCoreIt.registerSingleton<SaveNearByCinemasUseCase>(SaveNearByCinemasUseCase(repository: getCoreIt<HomeRepoImpl>()));

}