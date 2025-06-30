import 'package:dartz/dartz.dart';
import 'package:movies_explorer/feature/home/domain/entities/movie_entity.dart';
import 'package:movies_explorer/feature/home/domain/use_cases/getComingSoonUsesCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/failure.dart';
import 'coming_soon_event.dart';
import 'coming_soon_state.dart';

class ComingSoonBloc extends Bloc<ComingSoonEvent, ComingSoonState> {

  final GetComingSoonUseCase getComingSoonUseCase;

  ComingSoonBloc({required this.getComingSoonUseCase})
      : super(ComingSoonLoadingState(message: "Loading....")) {
    on<GetComingSoonEvent>((event, emit) async {
      Either<Failure, List<MovieEntity>> data = await getComingSoonUseCase();
      data.fold(
            (fail) => emit(ComingSoonErrorState(message: "Error")),
            (movies) => emit(ComingSoonDisplayDataState(data: movies)),
      );
    });
  }
}
