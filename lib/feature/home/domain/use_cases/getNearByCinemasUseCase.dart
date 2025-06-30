import 'package:dartz/dartz.dart';
import 'package:movies_explorer/core/failure.dart';
import 'package:movies_explorer/feature/home/domain/entities/cinema_entity.dart';
import 'package:movies_explorer/feature/home/domain/repo/home_repository.dart';

class GetNearByCinemasUseCase{
  final HomeRepository repository;
  GetNearByCinemasUseCase({required this.repository});
  Future<Either<Failure,List<CinemaEntity>>> call(){

    return repository.getCinemas();
  }
}