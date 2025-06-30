import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_explorer/core/failure.dart';
import 'package:movies_explorer/feature/movie_details/domain/use_cases/getDetailsUseCase.dart';
import 'package:movies_explorer/feature/movie_details/ui/bloc/details_bloc/details_event.dart';
import 'package:movies_explorer/feature/movie_details/ui/bloc/details_bloc/details_state.dart';

import '../../../domain/entities/movie_details_entity.dart';

class DetailsBloc extends Bloc<DetailsEvent,DetailsState>{
  final GetDetailsUseCase getDetailsUseCase;

  DetailsBloc({required this.getDetailsUseCase}):super(DetailsGetLoadingState(message: "Loading....")){


    on<GetDetailsEvent>((event,emit) async{

      Either<Failure, MovieDetailsEntity> data = await getDetailsUseCase(event.id);
      data.fold(
            (fail) => emit(DetailsGetErrorState(message: "Error")),
            (result) => emit(DetailsGetDisplayDataState(data: result)),
      );


    });
  }

}