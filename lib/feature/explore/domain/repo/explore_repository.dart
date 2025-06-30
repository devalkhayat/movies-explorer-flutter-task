import 'package:dartz/dartz.dart';
import 'package:movies_explorer/core/failure.dart';
import 'package:movies_explorer/feature/explore/domain/entities/Upcoming_movie_entity.dart';
import 'package:movies_explorer/feature/explore/domain/entities/recommended_movie_entity.dart';
import 'package:movies_explorer/feature/explore/domain/entities/top_movie_entity.dart';



abstract class ExploreRepository{

  Future<Either<Failure,List<TopMovieEntity>>> getTopMovies();
  Future<Either<Failure,List<RecommendedMovieEntity>>> getRecommendedMovies();
  Future<Either<Failure,List<UpcomingMovieEntity>>>  getUpcoming();
}