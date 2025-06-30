import 'package:dartz/dartz.dart';
import 'package:movies_explorer/core/failure.dart';
import 'package:movies_explorer/feature/movie_details/data/datasources/movie_details_remote_datasource.dart';
import 'package:movies_explorer/feature/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_explorer/feature/movie_details/domain/entities/movie_image_entity.dart';
import 'package:movies_explorer/feature/movie_details/domain/repo/movie_details_repository.dart';

class MovieDetailsRepoImpl extends MovieDetailsRepository{
  final MovieDetailsRemoteDataSource remoteDataSource;
  MovieDetailsRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, MovieDetailsEntity>> getDetails(int id) async{

    try {

      MovieDetailsEntity movieResult ;

      var data = await remoteDataSource.getDetails(id);
      //
      List<MovieCategory> _categories=[];
      data.genresList.forEach((item)=> _categories.add(MovieCategory(name: item.name)));

      movieResult=MovieDetailsEntity(id:data.id,title: data.title,date: data.date,rating: data.rating,adult: data.adult,originalLanguage: data.originalLanguage,overView: data.overView,categories: _categories);

      return Right(movieResult);
    } catch (ex) {
      return Left(Failure(errorMessage: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieImageEntity>>> getImages(int id) async{
    try {

      List<MovieImageEntity> imagesResult = [];

      var data = await remoteDataSource.getImages(id);
      //

      for (var item in data) {
        imagesResult.add(MovieImageEntity(url: item.filePath));
      }
      return Right(imagesResult);
    } catch (ex) {
      return Left(Failure(errorMessage: ex.toString()));
    }
  }

}