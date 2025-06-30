import 'package:dartz/dartz.dart';
import 'package:movies_explorer/feature/search_result/domain/entities/result_movie_entity.dart';

import '../../../../core/failure.dart';

abstract class SearchResultRepository{

  Future<Either<Failure,List<ResultMovieEntity>>> search(String keyword,int page);

}