import 'movie_details_model.dart';

class MovieGenresModel{
  final int id;
  final String name;
  MovieGenresModel({required this.id,required this.name});


  factory MovieGenresModel.fromJson(Map<String, dynamic> json) {
    return MovieGenresModel(
      id: json['id'],
      name: json['name'],
    );
  }



}

class MovieGenresModelResponse{

  final List<MovieGenresModel> genres;
  MovieGenresModelResponse({required this.genres});

  factory MovieGenresModelResponse.fromJson(Map<String,dynamic> json) {

    final List<MovieGenresModel> tempGenres = [];
    json["genres"].forEach((item) => tempGenres.add(MovieGenresModel.fromJson(item)));


  return MovieGenresModelResponse(genres: tempGenres);
  }
}