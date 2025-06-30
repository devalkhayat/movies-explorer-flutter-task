import 'dart:ffi';

import '../../../domain/entities/cinema_entity.dart';
import '../../../domain/entities/movie_entity.dart';

sealed class CinemasState{}

class CinemasGetLoadingState extends CinemasState{
  final String message;
  CinemasGetLoadingState({required this.message});
}

class CinemasGetDisplayDataState extends CinemasState{
  final List<CinemaEntity> data;
  CinemasGetDisplayDataState({required this.data});
}

class CinemasGetErrorState extends CinemasState{
  final String message;
  CinemasGetErrorState({required this.message});
}


/////////////////////////

class CinemasCashDataState extends CinemasState{
  final Bool data;
  CinemasCashDataState({required this.data});
}

class CinemasCashErrorState extends CinemasState{
  final String message;
  CinemasCashErrorState({required this.message});
}

