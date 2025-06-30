import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_explorer/feature/explore/domain/use_cases/getTopMoviesUseCase.dart';
import 'package:movies_explorer/feature/explore/ui/bloc/top_movies_bloc/top_movies_event.dart';
import 'package:movies_explorer/feature/explore/ui/bloc/top_movies_bloc/top_movies_state.dart';

import '../../../../../core/failure.dart';
import '../../../domain/entities/top_movie_entity.dart';

class TopMoviesBloc extends Bloc<TopMoviesEvent,TopMoviesState>{
  final GetTopMoviesUseCase getTopMoviesUseCase;

  TopMoviesBloc({required this.getTopMoviesUseCase}):super(TopMoviesGetLoadingState(message: "Loading....")){

    on<GetTopMoviesEvent>((event,emit) async{

      Either<Failure, List<TopMovieEntity>> data = await getTopMoviesUseCase();
      data.fold(
            (fail) => emit(TopMoviesGetErrorState(message: "Error")),
            (result) => emit(TopMoviesGetDisplayDataState(data: result)),
      );


    });
  }

}