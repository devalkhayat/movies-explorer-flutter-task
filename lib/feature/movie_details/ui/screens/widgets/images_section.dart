import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_explorer/core/widgets/RoundImage.dart';
import 'package:movies_explorer/feature/movie_details/domain/entities/movie_image_entity.dart';

import '../../../../../core/widgets/CircleLoading.dart';
import '../../bloc/images_bloc/images_bloc.dart';
import '../../bloc/images_bloc/images_event.dart';
import '../../bloc/images_bloc/images_state.dart';

class ImagesSection extends StatelessWidget {
  final int movieID;
  const ImagesSection({super.key,required this.movieID});

  @override
  Widget build(BuildContext context) {

    context.read<ImagesBloc>().add(GetImagesEvent(id: movieID));
    return SizedBox(
      height: 370,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getData(),
        ],
      ),
    );
  }



  getData(){
    return BlocBuilder<ImagesBloc,ImagesState>(
        builder:(context,state){

          switch(state){

            case  ImagesGetLoadingState():

              return  const Center(child:Circleloading());

            case ImagesGetDisplayDataState() :

              return display(context,state.data);

            case ImagesGetErrorState() :

              return Center(child: Text(state.message));
          };
        }

    );
  }


  display(BuildContext context,List<MovieImageEntity> data){

    return SizedBox(
      height: 370,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundImage(urlLocation:data[index].url,width: 250,),
          );
        },

      ),
    );
  }
}
