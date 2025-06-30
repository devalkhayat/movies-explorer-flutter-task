
import '../../domain/entities/result_movie_entity.dart';

sealed class SearchResultState{}

class SearchResultGetLoadingState extends SearchResultState{
  final String message;
  SearchResultGetLoadingState({required this.message});
}

class SearchResultGetDisplayDataState extends SearchResultState{
  final List<ResultMovieEntity> data;
  SearchResultGetDisplayDataState({required this.data});
}

class SearchResultGetErrorState extends SearchResultState{
  final String message;
  SearchResultGetErrorState({required this.message});
}