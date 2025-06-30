import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/CircleLoading.dart';
import '../../../../../core/widgets/RoundImage.dart';
import '../../../domain/entities/recommended_movie_entity.dart';
import '../../bloc/recommended_movies_bloc/recommended_movies_bloc.dart';
import '../../bloc/recommended_movies_bloc/recommended_movies_event.dart';
import '../../bloc/recommended_movies_bloc/recommended_movies_state.dart';
import '../../util/explore_strings.dart';

class RecommendedMoviesSection extends StatelessWidget {
  const RecommendedMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {

    context.read<RecommendedMoviesBloc>().add(GetRecommendedMoviesEvent());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(ExploreStrings.topRecommendedTitle,style: Theme.of(context).textTheme.titleLarge,),
            Text(ExploreStrings.seeMore,style: Theme.of(context).textTheme.labelMedium,),
          ],),
        const SizedBox(height: 8,),
        Container(
          height: 250,
          child: moviesList(context),
        ),
      ],
    );
  }


  moviesList(BuildContext context){

    return  BlocBuilder<RecommendedMoviesBloc,RecommendedMoviesState>(
        builder:(context,state){

          switch(state){

            case  RecommendedMoviesGetLoadingState():
              return   const Center(child: Circleloading());

            case RecommendedMoviesGetDisplayDataState() :
              return display(state.data);

            case RecommendedMoviesGetErrorState() :
              return Text(state.message);
          };
        }

    );
  }

  display(List<RecommendedMovieEntity> data){

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return movieCard(context,data[index]);
      },

    );
  }
  movieCard(BuildContext context, RecommendedMovieEntity data){

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: ()=>  GoRouter.of(context).push("/movie_details/${data.id}"),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundImage(urlLocation: data.imageUrl,width: 120,),

          ],
        ),
      ),
    );
  }
}
