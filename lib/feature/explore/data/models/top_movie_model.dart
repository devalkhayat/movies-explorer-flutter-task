import '../../../../core/constants.dart';
class TopMovieModel{
  final int id;
  final String title;
  final String posterImage;
  final double voteAverage;

  TopMovieModel({required this.id,required this.title,required this.posterImage,required this.voteAverage});

  factory TopMovieModel.fromJson(Map<String,dynamic> json)=> TopMovieModel(id: json['id'], title: json['title'], posterImage:basicImageUrl+ json['poster_path'], voteAverage: json['vote_average']);
}

class TopMoviesResponse{

  final List<TopMovieModel> movies;
  TopMoviesResponse({required this.movies});
  factory TopMoviesResponse.fromJson(Map<String,dynamic> json){

    final List<TopMovieModel> tempMovies=[];
    json["results"].forEach((item)  {
      try{
        tempMovies.add(TopMovieModel.fromJson(item));
        }
     catch(e)
    {
      print("*********************"+e.toString());
    }
    });
    return TopMoviesResponse(movies: tempMovies);
  }
}