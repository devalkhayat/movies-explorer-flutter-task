import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_explorer/core/widgets/Tag.dart';
import 'package:movies_explorer/feature/explore/ui/util/explore_strings.dart';

import '../../../../../core/widgets/CircleLoading.dart';
import '../../../../../core/widgets/RoundImage.dart';
import '../../../domain/entities/Upcoming_movie_entity.dart';
import '../../bloc/upcoming_movies_bloc/upcoming_movies_bloc.dart';
import '../../bloc/upcoming_movies_bloc/upcoming_movies_event.dart';
import '../../bloc/upcoming_movies_bloc/upcoming_movies_state.dart';
import 'package:movies_explorer/core/theme/util/colors.dart' as colors;

class UpcomingMoviesSection extends StatelessWidget {
  const UpcomingMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UpcomingMoviesBloc>().add(GetUpcomingMoviesEvent());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(ExploreStrings.upcomingTitle,style: Theme.of(context).textTheme.titleLarge,),

        const SizedBox(height: 8,),

        moviesList(context),
      ],
    );
  }


  moviesList(BuildContext context){

    return  BlocBuilder<UpcomingMoviesBloc,UpcomingMoviesState>(
        builder:(context,state){

          switch(state){

            case  UpcomingMoviesGetLoadingState():
              return   const Center(child: Circleloading());

            case UpcomingMoviesGetDisplayDataState() :
              return display(state.data);

            case UpcomingMoviesGetErrorState() :
              return Text(state.message);
          };
        }

    );
  }

  display(List<UpcomingMovieEntity> data){

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
  movieCard(BuildContext context, UpcomingMovieEntity data){
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
                RoundImage(urlLocation: data.posterImage,),
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
            Text(data.date,style: Theme.of(context).textTheme.labelMedium,),
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
