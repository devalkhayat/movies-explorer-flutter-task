import 'package:dartz/dartz.dart';
import 'package:movies_explorer/core/failure.dart';
import 'package:movies_explorer/feature/home/domain/entities/movie_entity.dart';
import 'package:movies_explorer/feature/home/domain/repo/home_repository.dart';

class GetComingSoonUseCase{
  final HomeRepository repository;
  GetComingSoonUseCase({required this.repository});
  Future<Either<Failure, List<MovieEntity>>> call(){
    return repository.getComingSoon();
  }
}