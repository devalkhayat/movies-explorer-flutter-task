import '../repo/search_result_respository.dart';

class GetSearchResultUseCase{
  final SearchResultRepository repository;
  GetSearchResultUseCase({required this.repository});
  call(String keyword,int page){

    return repository.search(keyword,page);
  }
}