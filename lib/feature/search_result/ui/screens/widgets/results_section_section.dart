import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_explorer/core/widgets/Tag.dart';
import 'package:movies_explorer/feature/explore/ui/util/explore_strings.dart';
import 'package:movies_explorer/feature/search_result/ui/util/search_result_strings.dart';

import '../../../../../../core/widgets/CircleLoading.dart';
import '../../../../../../core/widgets/RoundImage.dart';
import 'package:movies_explorer/core/theme/util/colors.dart' as colors;

import '../../../domain/entities/result_movie_entity.dart';
import '../../bloc/search_result_bloc.dart';
import '../../bloc/search_result_event.dart';
import '../../bloc/search_result_state.dart';

class ResultsSectionSection extends StatelessWidget {

  final String keyword;
  const ResultsSectionSection({super.key,required this.keyword});

  @override
  Widget build(BuildContext context) {
    context.read<SearchResultBloc>().add(GetSearchResultEvent(keyword:keyword ,page: 1));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        moviesList(context),
      ],
    );
  }


  moviesList(BuildContext context){



    return  BlocBuilder<SearchResultBloc,SearchResultState>(
        builder:(context,state){

          switch(state) {
            case SearchResultGetLoadingState():
              return const Center(child: Circleloading());

            case SearchResultGetDisplayDataState() :
              if (state.data.isNotEmpty) {
                return display(state.data);
              } else {
                return emptyResult(context);
              }

            case SearchResultGetErrorState() :
              return Text(state.message);
          };
        }

    );
  }

  emptyResult(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(SearchResultStrings.notFound,style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colors.gray800,fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }
  display(List<ResultMovieEntity> data){


    return SingleChildScrollView(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return movieCard(context,data[index]);
        },
      
      ),
    );
  }
  movieCard(BuildContext context, ResultMovieEntity data){
    Color color;
    String status;

    if(data.adult){
      color=colors.red100;
      status=ExploreStrings.adult;
    }else{
      color=colors.blue100;
      status=ExploreStrings.notAdult;
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: ()=>  GoRouter.of(context).push("/movie_details/${data.id}"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(
              children: [
                //not_found
                RoundImage(urlLocation: data.posterImage,isNetwork: data.posterImage!="not_found"?true:false,),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Tag(caption :status,background: color,),
                      const SizedBox(width: 8,),
                      Tag(caption :data.originalLanguage)
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10,),
            Text(data.title,style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 4,),
            SizedBox(
              child:  Text(data.overView,style: Theme.of(context).textTheme.labelMedium,maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            ),
           SizedBox(height: 16,)

          ],),
      ),
    );
  }
}
