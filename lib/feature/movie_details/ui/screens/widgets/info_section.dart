import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_explorer/feature/movie_details/data/models/movie_genres_model.dart';
import 'package:movies_explorer/feature/movie_details/domain/entities/movie_details_entity.dart';

import '../../../../../core/widgets/CircleLoading.dart';
import '../../../../../core/widgets/IconImage.dart';
import '../../../../../core/widgets/Tag.dart';
import '../../bloc/details_bloc/details_bloc.dart';
import '../../bloc/details_bloc/details_event.dart';
import '../../bloc/details_bloc/details_state.dart';
import '../../util/movie_details_strings.dart';
import 'package:movies_explorer/core/theme/util/colors.dart' as colors;

class InfoSection extends StatelessWidget {
  final int movieID;
  const InfoSection({super.key,required this.movieID});

  @override
  Widget build(BuildContext context) {

    context.read<DetailsBloc>().add(GetDetailsEvent(id: movieID));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getData(),
      ],
    );


  }


  getData(){
    return BlocBuilder<DetailsBloc,DetailsState>(
        builder:(context,state){

          switch(state){

            case  DetailsGetLoadingState():

              return  const Center(child:Circleloading());

            case DetailsGetDisplayDataState() :

              return display(context,state.data);

            case DetailsGetErrorState() :

              return Center(child: Text(state.message));
          };
        }

    );
  }
  display(BuildContext context,MovieDetailsEntity data){

    Color color;
    String status;

    if(data.adult){
      color=colors.red100;
      status=MovieDetailsStrings.adult;
    }else{
      color=colors.blue100;
      status=MovieDetailsStrings.notAdult;
    }


    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [
            Expanded(child: Text(data.title,style: Theme.of(context).textTheme.titleLarge,)),
            rating(context, data.rating.toStringAsFixed(1))
          ],
        ),
        const SizedBox(height: 8.0,),
        Row(children: [
          Tag(caption :status,background: color,),
          SizedBox(width: 8.0,),
          Tag(caption :data.originalLanguage,background: colors.gray900,textColor:colors.gray1000),
        ],),

       SizedBox(
         height: 50,
         child:  tags(data.categories),
       ),
        Text(data.overView,style: Theme.of(context).textTheme.labelMedium?.copyWith(color: colors.gray300),),
      ],
    );
  }

 tags(List<MovieCategory> categories ){

   return ListView.builder(
        scrollDirection: Axis.horizontal,
         itemCount: categories.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
        return  Padding(
          padding: const EdgeInsets.only(right: 8.0,top: 8.0,bottom: 8.0),
          child: Tag(caption :categories[index].name,background: colors.gray900,textColor:colors.gray1000),
        );
        });


}


  rating(BuildContext context, String rating){

    return Row(
      children: [
        IconImage(imageLocation: "assets/images/ic_star.svg",width: 14,height: 14,),
        const SizedBox(width: 4,),
        Text(rating,style: Theme.of(context).textTheme.labelMedium?.copyWith(color: colors.gray500)),
      ],
    );
  }
}
