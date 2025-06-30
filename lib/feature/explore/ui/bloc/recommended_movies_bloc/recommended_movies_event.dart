import '../../../domain/entities/recommended_movie_entity.dart';

sealed class RecommendedMoviesEvent{}
class GetRecommendedMoviesEvent extends RecommendedMoviesEvent{}