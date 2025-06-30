import '../../../../core/constants.dart';
class RecommendedMovieModel{
  final int id;
  final String posterImage;


  RecommendedMovieModel({required this.id,required this.posterImage});

  factory RecommendedMovieModel.fromJson(Map<String,dynamic> json)=> RecommendedMovieModel(id: json['id'], posterImage:basicImageUrl+ json['poster_path']);
}

class RecommendedMoviesResponse{

  final List<RecommendedMovieModel> movies;
  RecommendedMoviesResponse({required this.movies});
  factory RecommendedMoviesResponse.fromJson(Map<String,dynamic> json){

    final List<RecommendedMovieModel> tempMovies=[];
    json["results"].forEach((item) => tempMovies.add(RecommendedMovieModel.fromJson(item)));
    return RecommendedMoviesResponse(movies: tempMovies);
  }
}