import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:movies_explorer/feature/home/domain/entities/movie_entity.dart';

import '../../../../core/failure.dart';
import '../entities/cinema_entity.dart';

abstract class HomeRepository{

  Future<Either<Failure,List<MovieEntity>>>  getComingSoon();

  Future<Either<Failure,List<CinemaEntity>>>  getCinemas();

  Future<Either<Failure,Bool>>  saveCinemas(List<CinemaEntity> cinemasList);
}