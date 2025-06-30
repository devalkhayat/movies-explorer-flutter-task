import '../../../domain/entities/recommended_movie_entity.dart';

sealed class RecommendedMoviesState{}

class RecommendedMoviesGetLoadingState extends RecommendedMoviesState{
  final String message;
  RecommendedMoviesGetLoadingState({required this.message});
}

class RecommendedMoviesGetDisplayDataState extends RecommendedMoviesState{
  final List<RecommendedMovieEntity> data;
  RecommendedMoviesGetDisplayDataState({required this.data});
}

class RecommendedMoviesGetErrorState extends RecommendedMoviesState{
  final String message;
  RecommendedMoviesGetErrorState({required this.message});
}