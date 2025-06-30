import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movies_explorer/core/network/api_client.dart';

import '../../../../core/network/di.dart';
import '../../data/datasources/explore_remote_datasource.dart';
import '../../data/repository/explore_repo_impl.dart';
import '../../domain/use_cases/getRecommendedMoviesUseCase.dart';
import '../../domain/use_cases/getTopMoviesUseCase.dart';
import '../../domain/use_cases/getUpComingMoviesUseCase.dart';


Future<void> exploreSetupLocator () async{

  getCoreIt.registerSingleton<ExploreRemoteDataSourceImpl>(ExploreRemoteDataSourceImpl(apiClient:getCoreIt<ApiClient>()));
  getCoreIt.registerSingleton<ExploreRepoImpl>(ExploreRepoImpl(remoteDataSource:getCoreIt<ExploreRemoteDataSourceImpl>()));

  getCoreIt.registerSingleton<GetTopMoviesUseCase>(GetTopMoviesUseCase(repository: getCoreIt<ExploreRepoImpl>()));
  getCoreIt.registerSingleton<GetRecommendedMoviesUseCase>(GetRecommendedMoviesUseCase(repository: getCoreIt<ExploreRepoImpl>()));

  getCoreIt.registerSingleton<GetUpcomingMoviesUseCase>(GetUpcomingMoviesUseCase(repository: getCoreIt<ExploreRepoImpl>()));

}