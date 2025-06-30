import 'package:movies_explorer/core/extensions.dart';

import '../../../../core/constants.dart';
import 'movie_genres_model.dart';

class MovieDetailsModel{
  final int id;
  final String title;
  final String date;
  final double rating;
  final bool adult;
  final String originalLanguage;
  final String overView;
  final List<MovieGenresModel> genresList;
  MovieDetailsModel({required this.id,required this.title,required this.date,required this.rating,required this.adult,required this.originalLanguage,required this.overView,required this.genresList});
  factory MovieDetailsModel.fromJson(Map<String,dynamic> json)=> MovieDetailsModel(id: json['id'], title: json['title'], date: json['release_date'].toString().toDate(),rating: json['vote_average'],adult: json['adult'],originalLanguage: json['original_language'],overView: json['overview'],genresList: MovieGenresModelResponse.fromJson(json).genres);

}


class MovieDetailsModelResponse{

  final MovieDetailsModel movie;
  MovieDetailsModelResponse({required this.movie});

  factory MovieDetailsModelResponse.fromJson(Map<String,dynamic> json) {

    final MovieDetailsModel tempMovie=(MovieDetailsModel.fromJson(json));

    return MovieDetailsModelResponse(  movie: tempMovie);
  }
}