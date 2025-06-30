
import 'dart:convert';

import 'package:movies_explorer/core/extensions.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/endpoints.dart';
import '../models/result_movie_model.dart';

abstract class SearchResultRemoteDataSource{
  Future<List<ResultMovieModel>> search(String keyword,int page);
}


class SearchResultDataSourceImpl implements SearchResultRemoteDataSource{

  final ApiClient apiClient;

  SearchResultDataSourceImpl({required this.apiClient});

  @override
  Future<List<ResultMovieModel>> search(String keyword,int page) async{


    final response = await apiClient.get(Endpoints.search.getPathSearch(keyword,page));

    if (response.statusCode == 200) {



      try{
        ResultMoviesModelResponse.fromJson(json.decode(response.body)).movies;
      }
      catch(e){
        print("/*/*//*/*************************************************************************${e}");
      }
      return ResultMoviesModelResponse.fromJson(json.decode(response.body)).movies;
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }

}