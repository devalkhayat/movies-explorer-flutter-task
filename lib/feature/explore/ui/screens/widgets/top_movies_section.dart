import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_explorer/core/widgets/IconImage.dart';
import 'package:movies_explorer/feature/explore/ui/bloc/top_movies_bloc/top_movies_bloc.dart';

import '../../../../../core/widgets/CircleLoading.dart';
import '../../../../../core/widgets/RoundImage.dart';
import '../../../domain/entities/top_movie_entity.dart';
import '../../bloc/top_movies_bloc/top_movies_event.dart';
import '../../bloc/top_movies_bloc/top_movies_state.dart';
import '../../util/explore_strings.dart';
import '../../../../../core/theme/util/colors.dart' as colors;

class TopMoviesSection extends StatelessWidget {
  const TopMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {

    context.read<TopMoviesBloc>().add(GetTopMoviesEvent());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(ExploreStrings.topMoviesTitle,style: Theme.of(context).textTheme.titleLarge,),
          Text(ExploreStrings.seeMore,style: Theme.of(context).textTheme.labelMedium,),
        ],),

        const SizedBox(height: 8,),
        Container(
          height: 310,
          child: moviesList(context),
        ),
      ],
    );
  }


  moviesList(BuildContext context){

    return  BlocBuilder<TopMoviesBloc,TopMoviesState>(
        builder:(context,state){

          switch(state){

            case  TopMoviesGetLoadingState():
              return   const Center(child: Circleloading());

            case TopMoviesGetDisplayDataState() :
              return display(state.data);

            case TopMoviesGetErrorState() :
              return Text(state.message);
          };
        }

    );
  }

  display(List<TopMovieEntity> data){

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return movieCard(context,data[index]);
      },

    );
  }
  movieCard(BuildContext context, TopMovieEntity data){

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: ()=>  GoRouter.of(context).push("/movie_details/${data.id}"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundImage(urlLocation: data.imageUrl,width: 180,height: 250,),
            const SizedBox(height: 10,),
            SizedBox(
              width: 180,
              child: Text(data.name,style: Theme.of(context).textTheme.labelLarge,maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
            ),
            AbsorbPointer(
              absorbing: true,
          child: RatingBar.builder(
            initialRating: data.rating-5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 12,
            unratedColor: colors.white100,
            tapOnlyMode: false,

            itemBuilder: (context, _) => IconImage(imageLocation: "assets/images/ic_star.svg"),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        )
          ],
            ),
      ),
    );
  }
}
