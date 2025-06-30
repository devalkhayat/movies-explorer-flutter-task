import 'dart:convert';
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:movies_explorer/core/failure.dart';
import 'package:movies_explorer/feature/home/data/datasources/home_local_datasource.dart';
import 'package:movies_explorer/feature/home/data/datasources/home_remote_datasource.dart';
import 'package:movies_explorer/feature/home/data/models/cinema_model.dart';
import 'package:movies_explorer/feature/home/domain/entities/cinema_entity.dart';
import 'package:movies_explorer/feature/home/domain/entities/movie_entity.dart';
import 'package:movies_explorer/feature/home/domain/repo/home_repository.dart';

import '../../../../core/network/api_client.dart';
import '../models/movie_model.dart';

class HomeRepoImpl extends HomeRepository{

  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepoImpl({ required this.remoteDataSource,required this.localDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> getComingSoon() async {

    try {

      List<MovieEntity> moviesResult = [];

      var data = await remoteDataSource.getComingSoonMovies();
      //

      for (var item in data) {
        moviesResult.add(MovieEntity(id: item.id, title: item.title,date: item.date,posterImage: item.posterImage));
      }
      return Right(moviesResult);
    } catch (ex) {
      return Left(Failure(errorMessage: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CinemaEntity>>> getCinemas() async {

    try {

      List<CinemaEntity> cinemasResult = [];

      var data = await localDataSource.getCachedCinemas();

      //

      for (var item in data) {
        cinemasResult.add(CinemaEntity(id: item.id, name: item.name, distance: item.distance, closeTime: item.closeTime, logoUrl: item.logoUrl,rating: item.rating));
      }
      return Right(cinemasResult);
    } catch (ex) {
      return Left(Failure(errorMessage: ex.toString()));
    }


  }

  @override
  Future<Either<Failure, Bool>> saveCinemas(List<CinemaEntity> cinemasList) async {

    try {

      List<CinemaModel> convertedList=[];
      cinemasList.forEach((i){
        convertedList.add(CinemaModel(id: i.id, name: i.name, distance: i.distance, closeTime: i.closeTime, logoUrl: i.logoUrl,rating: i.rating));
      });
      var data = await localDataSource.cacheCinemas(convertedList);
      return Right(true as Bool);
    } catch (ex) {
      return Left(Failure(errorMessage: ex.toString()));
    }
  }




  }

