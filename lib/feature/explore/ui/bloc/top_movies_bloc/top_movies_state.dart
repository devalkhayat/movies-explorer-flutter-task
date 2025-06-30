import '../../../domain/entities/top_movie_entity.dart';

sealed class TopMoviesState{}

class TopMoviesGetLoadingState extends TopMoviesState{
  final String message;
  TopMoviesGetLoadingState({required this.message});
}

class TopMoviesGetDisplayDataState extends TopMoviesState{
  final List<TopMovieEntity> data;
  TopMoviesGetDisplayDataState({required this.data});
}

class TopMoviesGetErrorState extends TopMoviesState{
  final String message;
  TopMoviesGetErrorState({required this.message});
}