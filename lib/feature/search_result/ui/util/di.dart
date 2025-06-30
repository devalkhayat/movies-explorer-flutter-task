import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movies_explorer/core/network/api_client.dart';

import '../../../../core/network/di.dart';
import '../../data/datasources/search_result_remote_datasource.dart';
import '../../data/repository/search_result_impl.dart';
import '../../domain/use_cases/getSearchResultUseCase.dart';


Future<void> searchResultSetupLocator () async{

  getCoreIt.registerSingleton<SearchResultDataSourceImpl>(SearchResultDataSourceImpl(apiClient:getCoreIt<ApiClient>()));
  getCoreIt.registerSingleton<SearchResultImpl>(SearchResultImpl(remoteDataSource:getCoreIt<SearchResultDataSourceImpl>()));

  getCoreIt.registerSingleton<GetSearchResultUseCase>(GetSearchResultUseCase(repository: getCoreIt<SearchResultImpl>()));

}