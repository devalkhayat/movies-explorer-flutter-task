
import 'dart:convert';

import 'package:movies_explorer/feature/explore/data/models/top_movie_model.dart';
import 'package:movies_explorer/feature/explore/data/models/upcoming_movie_model.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/endpoints.dart';
import '../models/recommended_movie_model.dart';


abstract class ExploreRemoteDataSource{
  Future<List<TopMovieModel>> getTopMovies();
  Future<List<RecommendedMovieModel>> getRecommendedMovies();
  Future<List<UpcomingMovieModel>> getUpcomingMovies();
}

class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource{

  final ApiClient apiClient;

  ExploreRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<RecommendedMovieModel>> getRecommendedMovies() async {

    final response = await apiClient.get(Endpoints.popular);

    if (response.statusCode == 200) {
      return RecommendedMoviesResponse.fromJson(json.decode(response.body)).movies;
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }

  @override
  Future<List<TopMovieModel>> getTopMovies() async {

    final response = await apiClient.get(Endpoints.getTopMovies);

    if (response.statusCode == 200) {

      return TopMoviesResponse.fromJson(json.decode(response.body)).movies;
    } else {

      throw Exception('Failed to fetch tasks');
    }
  }

  @override
  Future<List<UpcomingMovieModel>> getUpcomingMovies() async{

    final response = await apiClient.get(Endpoints.upComing);

    if (response.statusCode == 200) {


      return UpcomingMovieModelResponse.fromJson(json.decode(response.body)).movies;
    } else {

      throw Exception('Failed to fetch tasks');
    }
  }

}
