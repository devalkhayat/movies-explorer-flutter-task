import 'package:movies_explorer/feature/explore/domain/entities/top_movie_entity.dart';

sealed class TopMoviesEvent{}
class GetTopMoviesEvent extends TopMoviesEvent{
}