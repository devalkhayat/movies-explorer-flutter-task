import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_explorer/core/failure.dart';
import 'package:movies_explorer/feature/movie_details/domain/entities/movie_image_entity.dart';
import 'package:movies_explorer/feature/movie_details/domain/use_cases/getDetailsUseCase.dart';
import 'package:movies_explorer/feature/movie_details/ui/bloc/details_bloc/details_event.dart';
import 'package:movies_explorer/feature/movie_details/ui/bloc/details_bloc/details_state.dart';

import '../../../domain/entities/movie_details_entity.dart';
import '../../../domain/use_cases/getImagesUseCase.dart';
import 'images_event.dart';
import 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent,ImagesState>{
  final GetImagesUseCase getImagesUseCase;

  ImagesBloc({required this.getImagesUseCase}):super(ImagesGetLoadingState(message: "Loading....")){


    on<GetImagesEvent>((event,emit) async{

      Either<Failure, List<MovieImageEntity>> data = await getImagesUseCase(event.id);
      data.fold(
            (fail) => emit(ImagesGetErrorState(message: "Error")),
            (result) => emit(ImagesGetDisplayDataState(data: result)),
      );


    });
  }

}