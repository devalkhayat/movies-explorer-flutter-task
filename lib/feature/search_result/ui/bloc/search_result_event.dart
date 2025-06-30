import 'package:movies_explorer/feature/explore/domain/entities/top_movie_entity.dart';

sealed class SearchResultEvent{}
class GetSearchResultEvent extends SearchResultEvent{
  final String keyword;
  final int page;
  GetSearchResultEvent({required this.keyword,required this.page});
}