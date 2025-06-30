import 'package:dartz/dartz.dart';
import 'package:movies_explorer/core/failure.dart';

import '../entities/movie_details_entity.dart';
import '../entities/movie_image_entity.dart';

abstract class MovieDetailsRepository{
  Future<Either<Failure,MovieDetailsEntity>> getDetails(int id);
  Future<Either<Failure,List<MovieImageEntity>>> getImages(int id);
}