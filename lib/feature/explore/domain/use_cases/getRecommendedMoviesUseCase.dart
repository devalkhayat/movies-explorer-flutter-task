import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../entities/recommended_movie_entity.dart';
import '../repo/explore_repository.dart';

class GetRecommendedMoviesUseCase{
  final ExploreRepository repository;
  GetRecommendedMoviesUseCase({required this.repository});
  Future<Either<Failure,List<RecommendedMovieEntity>>> call(){
    return repository.getRecommendedMovies();
  }
}