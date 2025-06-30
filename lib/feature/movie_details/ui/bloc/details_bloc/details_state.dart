import 'package:movies_explorer/feature/movie_details/domain/entities/movie_details_entity.dart';

sealed class DetailsState{}
class DetailsGetLoadingState extends DetailsState{
  final String message;
  DetailsGetLoadingState({required this.message});
}

class DetailsGetDisplayDataState extends DetailsState{
  final MovieDetailsEntity data;
  DetailsGetDisplayDataState({required this.data});
}

class DetailsGetErrorState extends DetailsState{
  final String message;
  DetailsGetErrorState({required this.message});
}