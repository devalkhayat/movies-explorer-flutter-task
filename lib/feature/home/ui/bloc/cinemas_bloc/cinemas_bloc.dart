import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:movies_explorer/feature/home/domain/entities/movie_entity.dart';
import 'package:movies_explorer/feature/home/domain/use_cases/getComingSoonUsesCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/failure.dart';
import '../../../domain/entities/cinema_entity.dart';
import '../../../domain/use_cases/saveNearByCinemasUseCase.dart';
import '../../../domain/use_cases/getNearByCinemasUseCase.dart';
import 'cinemas_event.dart';
import 'cinemas_state.dart';

class CinemasBloc extends Bloc<CinemasEvent, CinemasState> {

  final GetNearByCinemasUseCase getNearByCinemasUseCase;
  final SaveNearByCinemasUseCase cachNearByCinemasUseCase;

  CinemasBloc({required this.getNearByCinemasUseCase,required this.cachNearByCinemasUseCase})
      : super(CinemasGetLoadingState(message: "Loading....")) {


    on<GetCinemasEvent>((event, emit) async {
      Either<Failure, List<CinemaEntity>> data = await getNearByCinemasUseCase();
      data.fold(
            (fail) => emit(CinemasGetErrorState(message: "Error")),
            (result) => emit(CinemasGetDisplayDataState(data: result)),
      );
    });

     /////////////////////////////////////////////////

    on<CashCinemasEvent>((event,emit) async {
      Either<Failure, Bool> data = await cachNearByCinemasUseCase(event.cinemasList);
      data.fold(
            (fail) => emit(CinemasCashErrorState(message: "Error")),
            (result) => emit(CinemasCashDataState(data: result)),
      );
    });
  }
}
