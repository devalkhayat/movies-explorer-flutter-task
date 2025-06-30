import 'package:dartz/dartz.dart';
import 'package:movies_explorer/core/failure.dart';
import 'package:movies_explorer/feature/explore/domain/entities/top_movie_entity.dart';
import 'package:movies_explorer/feature/explore/domain/repo/explore_repository.dart';

class GetTopMoviesUseCase{
  final ExploreRepository repository;
  GetTopMoviesUseCase({required this.repository});
  Future<Either<Failure,List<TopMovieEntity>>> call(){
    return repository.getTopMovies();
  }
}