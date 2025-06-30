import 'package:dartz/dartz.dart';
import 'package:movies_explorer/core/failure.dart';
import 'package:movies_explorer/feature/explore/data/datasources/explore_remote_datasource.dart';
import 'package:movies_explorer/feature/explore/domain/entities/Upcoming_movie_entity.dart';
import 'package:movies_explorer/feature/explore/domain/entities/recommended_movie_entity.dart';
import 'package:movies_explorer/feature/explore/domain/entities/top_movie_entity.dart';

import 'package:movies_explorer/feature/explore/domain/repo/explore_repository.dart';

class ExploreRepoImpl extends ExploreRepository{

  final ExploreRemoteDataSource remoteDataSource;

  ExploreRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<RecommendedMovieEntity>>> getRecommendedMovies() async {

    try {

      List<RecommendedMovieEntity> moviesResult = [];

      var data = await remoteDataSource.getRecommendedMovies();
      //

      for (var item in data) {
        moviesResult.add(RecommendedMovieEntity(id:item.id,imageUrl: item.posterImage));
      }
      return Right(moviesResult);
    } catch (ex) {
      return Left(Failure(errorMessage: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TopMovieEntity>>> getTopMovies() async {
    try {

      List<TopMovieEntity> moviesResult = [];

      var data = await remoteDataSource.getTopMovies();
      //

      for (var item in data) {
        moviesResult.add(TopMovieEntity(id:item.id,name:item.title,rating: item.voteAverage,imageUrl: item.posterImage));
      }
      return Right(moviesResult);
    } catch (ex) {
      return Left(Failure(errorMessage: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UpcomingMovieEntity>>> getUpcoming() async {
    try {

      List<UpcomingMovieEntity> moviesResult = [];

      var data = await remoteDataSource.getUpcomingMovies();
      //

      for (var item in data) {
        moviesResult.add(UpcomingMovieEntity(id: item.id, title: item.title,date: item.date,posterImage: item.posterImage,adult: item.adult,originalLanguage: item.originalLanguage,overView: item.overView));
      }
      return Right(moviesResult);
    } catch (ex) {
      return Left(Failure(errorMessage: ex.toString()));
    }
  }

}