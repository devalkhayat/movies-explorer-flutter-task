import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_explorer/feature/explore/ui/bloc/recommended_movies_bloc/recommended_movies_event.dart';
import 'package:movies_explorer/feature/explore/ui/bloc/recommended_movies_bloc/recommended_movies_state.dart';

import '../../../../../core/failure.dart';
import '../../../domain/entities/recommended_movie_entity.dart';
import '../../../domain/use_cases/getRecommendedMoviesUseCase.dart';

class RecommendedMoviesBloc extends Bloc<RecommendedMoviesEvent,RecommendedMoviesState>{
  final GetRecommendedMoviesUseCase getRecommendedMoviesUseCase;

  RecommendedMoviesBloc({required this.getRecommendedMoviesUseCase}):super(RecommendedMoviesGetLoadingState(message: "Loading....")){

    on<GetRecommendedMoviesEvent>((event,emit) async{

      Either<Failure, List<RecommendedMovieEntity>> data = await getRecommendedMoviesUseCase();
      data.fold(
            (fail) => emit(RecommendedMoviesGetErrorState(message: "Error")),
            (result) => emit(RecommendedMoviesGetDisplayDataState(data: result)),
      );


    });
  }

}