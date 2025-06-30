import '../../../domain/entities/Upcoming_movie_entity.dart';

sealed class UpcomingMoviesState{}

class UpcomingMoviesGetLoadingState extends UpcomingMoviesState{
  final String message;
  UpcomingMoviesGetLoadingState({required this.message});
}

class UpcomingMoviesGetDisplayDataState extends UpcomingMoviesState{
  final List<UpcomingMovieEntity> data;
  UpcomingMoviesGetDisplayDataState({required this.data});
}

class UpcomingMoviesGetErrorState extends UpcomingMoviesState{
  final String message;
  UpcomingMoviesGetErrorState({required this.message});
}