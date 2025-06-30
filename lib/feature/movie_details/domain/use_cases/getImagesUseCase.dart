import 'package:dartz/dartz.dart';
import 'package:movies_explorer/core/failure.dart';
import 'package:movies_explorer/feature/movie_details/domain/repo/movie_details_repository.dart';

import '../entities/movie_details_entity.dart';
import '../entities/movie_image_entity.dart';

class GetImagesUseCase{
  final MovieDetailsRepository repository;
  GetImagesUseCase({required this.repository});
  Future<Either<Failure,List<MovieImageEntity>>> call(int id ){
    return repository.getImages(id);
  }
}