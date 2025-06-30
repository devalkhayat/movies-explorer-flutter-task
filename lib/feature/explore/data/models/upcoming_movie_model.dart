

import 'package:movies_explorer/core/extensions.dart';

import '../../../../core/constants.dart';

class UpcomingMovieModel{
  final int id;
  final String title;
  final String date;
  final String posterImage;
  final bool adult;
  final String originalLanguage;
  final String overView;
  UpcomingMovieModel({required this.id,required this.title,required this.date,required this.posterImage,required this.adult,required this.originalLanguage,required this.overView});

  factory UpcomingMovieModel.fromJson(Map<String,dynamic> json)=> UpcomingMovieModel(id: json['id'], title: json['title'], date: json['release_date'].toString().toDate(), posterImage: basicImageUrl+ json['poster_path'],adult: json['adult'],originalLanguage: json['original_language'],overView: json['overview']);

}

class UpcomingMovieModelResponse{

  final List<UpcomingMovieModel> movies;
  UpcomingMovieModelResponse({required this.movies});

  factory UpcomingMovieModelResponse.fromJson(Map<String,dynamic> json) {

    final List<UpcomingMovieModel> tempMovies = [];
    json["results"].forEach((item) => tempMovies.add(UpcomingMovieModel.fromJson(item)));

    return UpcomingMovieModelResponse(movies: tempMovies);
  }
}