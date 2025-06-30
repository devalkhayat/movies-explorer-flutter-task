import 'package:dartz/dartz.dart';
import 'package:movies_explorer/core/failure.dart';
import 'package:movies_explorer/feature/search_result/domain/entities/result_movie_entity.dart';
import 'package:movies_explorer/feature/search_result/domain/repo/search_result_respository.dart';

import '../datasources/search_result_remote_datasource.dart';

class SearchResultImpl extends SearchResultRepository{

  final SearchResultRemoteDataSource remoteDataSource;

  SearchResultImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ResultMovieEntity>>> search(String keyword, int page) async {

    try {


      List<ResultMovieEntity> moviesResult = [];


      try {
        var data = await remoteDataSource.search(keyword, page);
        //

        for (var item in data) {
          moviesResult.add(ResultMovieEntity(id: item.id,
              title: item.title,
              posterImage: item.posterImage,
              adult: item.adult,
              originalLanguage: item.originalLanguage,
              overView: item.overView));
        }
      }catch(e){

      }
      return Right(moviesResult);
    } catch (ex) {
      return Left(Failure(errorMessage: ex.toString()));
    }
  }

}