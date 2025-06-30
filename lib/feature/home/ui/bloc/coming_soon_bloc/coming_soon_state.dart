import '../../../domain/entities/movie_entity.dart';

sealed class ComingSoonState{}

class ComingSoonLoadingState extends ComingSoonState{
  final String message;
  ComingSoonLoadingState({required this.message});
}

class ComingSoonDisplayDataState extends ComingSoonState{
  final List<MovieEntity> data;
  ComingSoonDisplayDataState({required this.data});
}

class ComingSoonErrorState extends ComingSoonState{
  final String message;
  ComingSoonErrorState({required this.message});
}