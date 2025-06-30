import 'package:dartz/dartz.dart';
import 'package:movies_explorer/core/failure.dart';
import 'package:movies_explorer/feature/movie_details/domain/repo/movie_details_repository.dart';

import '../entities/movie_details_entity.dart';

class GetDetailsUseCase{
  final MovieDetailsRepository repository;
  GetDetailsUseCase({required this.repository});
  Future<Either<Failure,MovieDetailsEntity>> call(int id ){
    return repository.getDetails(id);
  }
}