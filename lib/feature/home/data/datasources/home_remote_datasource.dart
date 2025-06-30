import 'dart:convert';

import 'package:movies_explorer/core/network/api_client.dart';
import 'package:movies_explorer/feature/home/data/models/movie_model.dart';

import '../../../../core/network/endpoints.dart';

abstract class HomeRemoteDataSource{
  Future<List<MovieModel>> getComingSoonMovies();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{

  final ApiClient apiClient;

  HomeRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<MovieModel>> getComingSoonMovies() async{

    final response = await apiClient.get(Endpoints.upComing);

    if (response.statusCode == 200) {
      return ComingSoonMoviesResponse.fromJson(json.decode(response.body)).movies;
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }

}