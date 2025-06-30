import 'dart:convert';

import 'package:movies_explorer/core/extensions.dart';
import 'package:movies_explorer/core/network/api_client.dart';
import 'package:movies_explorer/feature/movie_details/data/models/movie_details_model.dart';

import '../../../../core/network/endpoints.dart';
import '../models/movie_image_model.dart';

abstract class MovieDetailsRemoteDataSource{
  Future<MovieDetailsModel> getDetails(int id);
  Future<List<MovieImageModel>> getImages(int id);
}

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource{
  final ApiClient apiClient;

  MovieDetailsRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<MovieDetailsModel> getDetails(int id) async {

    final response = await apiClient.get(Endpoints.movieDetails.getPath(id));

    if (response.statusCode == 200) {

      return MovieDetailsModelResponse.fromJson(json.decode(response.body)).movie;
    } else {
      throw Exception('Failed to fetch tasks');
    }

  }

  @override
  Future<List<MovieImageModel>> getImages(int id) async{

    final response = await apiClient.get(Endpoints.movieImages.getPath(id));

    if (response.statusCode == 200) {

      return MovieImagesModelResponse.fromJson(json.decode(response.body)).images;
    } else {
      throw Exception('Failed to fetch tasks');
    }
  }

}