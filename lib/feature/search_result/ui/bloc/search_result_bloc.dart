import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_explorer/feature/explore/ui/bloc/upcoming_movies_bloc/upcoming_movies_event.dart';
import 'package:movies_explorer/feature/explore/ui/bloc/upcoming_movies_bloc/upcoming_movies_state.dart';
import 'package:movies_explorer/feature/search_result/ui/bloc/search_result_event.dart';
import 'package:movies_explorer/feature/search_result/ui/bloc/search_result_state.dart';

import '../../../../../core/failure.dart';
import '../../domain/use_cases/getSearchResultUseCase.dart';



class SearchResultBloc extends Bloc<SearchResultEvent,SearchResultState>{
  final GetSearchResultUseCase getSearchResultUseCase;

  SearchResultBloc({required this.getSearchResultUseCase}):super(SearchResultGetLoadingState(message: "Loading....")){

    on<GetSearchResultEvent>((event,emit) async{


      var data = await getSearchResultUseCase(event.keyword,event.page);

      data.fold(
            (fail) => emit(SearchResultGetErrorState(message: "Error")),
            (result) => emit(SearchResultGetDisplayDataState(data: result)),
      );


    });
  }

}