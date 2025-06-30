import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_explorer/feature/search_result/ui/screens/widgets/results_section_section.dart';

import '../../../../core/network/di.dart';
import '../../../../core/widgets/IconImage.dart';
import '../../domain/use_cases/getSearchResultUseCase.dart';
import '../bloc/search_result_bloc.dart';
import '../util/search_result_strings.dart';

class SearchResult extends StatelessWidget {

  final String keyword;
  const SearchResult({super.key,required this.keyword});

  @override
  Widget build(BuildContext context) {

    return  MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SearchResultBloc(getSearchResultUseCase:getCoreIt<GetSearchResultUseCase>())),

        ],
        child:  Scaffold(
          appBar: screenAppBar(context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ResultsSectionSection( keyword: keyword, )
                ],
              ),
            ),
          ),
        )
    );

  }

  screenAppBar(BuildContext context){
    return AppBar(
      title:  Text(SearchResultStrings.screenTitle,style: Theme.of(context).textTheme.titleLarge),
      centerTitle: true,
      leading: IconButton(
        icon: IconImage(imageLocation: "assets/images/ic_back.svg",),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),


    );
  }
}
