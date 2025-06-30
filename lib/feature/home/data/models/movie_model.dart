

import 'package:movies_explorer/core/extensions.dart';

import '../../../../core/constants.dart';

class MovieModel{
  final int id;
  final String title;
  final String date;
  final String posterImage;
  MovieModel({required this.id,required this.title,required this.date,required this.posterImage});

  factory MovieModel.fromJson(Map<String,dynamic> json)=> MovieModel(id: json['id'], title: json['title'], date: json['release_date'].toString().toDate(), posterImage: basicImageUrl+ json['poster_path']);

}

class ComingSoonMoviesResponse{

  final List<MovieModel> movies;
  ComingSoonMoviesResponse({required this.movies});

  factory ComingSoonMoviesResponse.fromJson(Map<String,dynamic> json) {

    final List<MovieModel> tempMovies = [];
    json["results"].forEach((item) => tempMovies.add(MovieModel.fromJson(item)));

    return ComingSoonMoviesResponse(movies: tempMovies);
  }
}