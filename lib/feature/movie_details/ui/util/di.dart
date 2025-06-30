
import 'package:movies_explorer/feature/movie_details/data/repository/movie_details_repo_impl.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/di.dart';
import '../../data/datasources/movie_details_remote_datasource.dart';
import '../../domain/use_cases/getDetailsUseCase.dart';
import '../../domain/use_cases/getImagesUseCase.dart';

Future<void> movieDetailsSetupLocator()async {

  getCoreIt.registerSingleton<MovieDetailsRemoteDataSourceImpl>(MovieDetailsRemoteDataSourceImpl( apiClient: getCoreIt<ApiClient>()));
  getCoreIt.registerSingleton<MovieDetailsRepoImpl>(MovieDetailsRepoImpl(remoteDataSource:getCoreIt<MovieDetailsRemoteDataSourceImpl>()));

  getCoreIt.registerSingleton<GetDetailsUseCase>(GetDetailsUseCase(repository: getCoreIt<MovieDetailsRepoImpl>()));
  getCoreIt.registerSingleton<GetImagesUseCase>(GetImagesUseCase(repository: getCoreIt<MovieDetailsRepoImpl>()));


}