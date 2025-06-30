import 'package:movies_explorer/feature/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_explorer/feature/movie_details/domain/entities/movie_image_entity.dart';

sealed class ImagesState{}
class ImagesGetLoadingState extends ImagesState{
  final String message;
  ImagesGetLoadingState({required this.message});
}

class ImagesGetDisplayDataState extends ImagesState{
  final List<MovieImageEntity> data;
  ImagesGetDisplayDataState({required this.data});
}

class ImagesGetErrorState extends ImagesState{
  final String message;
  ImagesGetErrorState({required this.message});
}