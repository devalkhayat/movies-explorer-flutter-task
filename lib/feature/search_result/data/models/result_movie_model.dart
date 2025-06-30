import 'package:movies_explorer/core/extensions.dart';

import '../../../../core/constants.dart';

class ResultMovieModel{
  final int id;
  final String title;

  final String posterImage;
  final bool adult;
  final String originalLanguage;
  final String overView;
  ResultMovieModel({required this.id,required this.title,required this.posterImage,required this.adult,required this.originalLanguage,required this.overView});

  factory ResultMovieModel.fromJson(Map<String,dynamic> json)=> ResultMovieModel(id: json['id'], title: json['title'], posterImage:  (json['backdrop_path'] ==null? "not_found":basicImageUrl+json['backdrop_path']

    ),adult: json['adult'],originalLanguage: json['original_language'],overView: json['overview']);

}

class ResultMoviesModelResponse{

  final List<ResultMovieModel> movies;
  ResultMoviesModelResponse({required this.movies});

  factory ResultMoviesModelResponse.fromJson(Map<String,dynamic> json) {

    final List<ResultMovieModel> tempMovies = [];
    json["results"].forEach((item) => tempMovies.add(ResultMovieModel.fromJson(item)));

    return ResultMoviesModelResponse(movies: tempMovies);
  }
}