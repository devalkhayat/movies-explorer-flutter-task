import 'package:dartz/dartz.dart';
import 'package:movies_explorer/feature/explore/domain/repo/explore_repository.dart';



class GetUpcomingMoviesUseCase{
  final ExploreRepository repository;
  GetUpcomingMoviesUseCase({required this.repository});
   call(){
    return repository.getUpcoming();
  }
}