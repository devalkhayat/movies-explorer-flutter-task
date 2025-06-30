import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_explorer/feature/home/domain/entities/movie_entity.dart';
import 'package:movies_explorer/feature/home/ui/bloc/coming_soon_bloc/coming_soon_bloc.dart';
import 'package:movies_explorer/feature/home/ui/util/home_strings.dart';

import '../../../../../core/widgets/CircleLoading.dart';
import '../../../../../core/widgets/RoundImage.dart';
import '../../bloc/coming_soon_bloc/coming_soon_event.dart';
import '../../bloc/coming_soon_bloc/coming_soon_state.dart';

class MoviesSection extends StatelessWidget {
  const MoviesSection({super.key});

  @override
  Widget build(BuildContext context) {

    context.read<ComingSoonBloc>().add(GetComingSoonEvent());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(HomeStrings.comingSoonTitle,style: Theme.of(context).textTheme.titleLarge,),
       const SizedBox(height: 8,),
         Container(
           height: 310,
           child: moviesList(context),
         ),
      ],
    );
  }
}

moviesList(BuildContext context){
return  BlocBuilder<ComingSoonBloc,ComingSoonState>(
    builder:(context,state){

      switch(state){

        case  ComingSoonLoadingState():
          return  const Center(child:Circleloading());

        case ComingSoonDisplayDataState() :
          return display(state.data);

        case ComingSoonErrorState() :
          return Center(child: Text(state.message));
      };
    }

);
}

display(List<MovieEntity> data){

  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: data.length,
    itemBuilder: (context, index) {
      return movieCard(context,data[index]);
    },

  );
}
movieCard(BuildContext context, MovieEntity data){

 return Padding(
   padding: const EdgeInsets.all(4.0),
   child: InkWell(
     onTap: (){

       GoRouter.of(context).push("/movie_details/${data.id}");

     },
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         RoundImage(urlLocation: data.posterImage,),
         const SizedBox(height: 10,),
         Text(data.title,style: Theme.of(context).textTheme.titleLarge,),
         Text(data.date,style: Theme.of(context).textTheme.labelMedium,)
       ],),
   ),
 );
}
