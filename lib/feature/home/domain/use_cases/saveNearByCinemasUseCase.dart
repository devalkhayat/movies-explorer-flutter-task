import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:movies_explorer/core/failure.dart';
import 'package:movies_explorer/feature/home/domain/entities/cinema_entity.dart';
import 'package:movies_explorer/feature/home/domain/repo/home_repository.dart';

class SaveNearByCinemasUseCase{
  final HomeRepository repository;
  SaveNearByCinemasUseCase({required this.repository});
  Future<Either<Failure,Bool>> call(List<CinemaEntity> cinemasList){

    return repository.saveCinemas(cinemasList);
  }
}