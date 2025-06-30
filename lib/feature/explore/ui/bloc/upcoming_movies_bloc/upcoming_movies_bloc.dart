import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_explorer/feature/explore/ui/bloc/upcoming_movies_bloc/upcoming_movies_event.dart';
import 'package:movies_explorer/feature/explore/ui/bloc/upcoming_movies_bloc/upcoming_movies_state.dart';

import '../../../../../core/failure.dart';
import '../../../domain/entities/Upcoming_movie_entity.dart';
import '../../../domain/use_cases/getUpComingMoviesUseCase.dart';



class UpcomingMoviesBloc extends Bloc<UpcomingMoviesEvent,UpcomingMoviesState>{
  final GetUpcomingMoviesUseCase getUpcomingMoviesUseCase;

  UpcomingMoviesBloc({required this.getUpcomingMoviesUseCase}):super(UpcomingMoviesGetLoadingState(message: "Loading....")){

    on<GetUpcomingMoviesEvent>((event,emit) async{


      var data = await getUpcomingMoviesUseCase();
      data.fold(
            (fail) => emit(UpcomingMoviesGetErrorState(message: "Error")),
            (result) => emit(UpcomingMoviesGetDisplayDataState(data: result)),
      );


    });
  }

}