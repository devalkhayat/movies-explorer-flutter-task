import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_explorer/feature/home/domain/entities/cinema_entity.dart';
import 'package:movies_explorer/feature/home/ui/util/home_strings.dart';

import '../../../../../core/widgets/CircleLoading.dart';
import '../../../../../core/widgets/IconImage.dart';
import '../../../../../core/widgets/RoundImage.dart';
import 'package:movies_explorer/core/theme/util/colors.dart' as colors;

import '../../bloc/cinemas_bloc/cinemas_bloc.dart';
import '../../bloc/cinemas_bloc/cinemas_event.dart';
import '../../bloc/cinemas_bloc/cinemas_state.dart';
class CinemasSection extends StatelessWidget {
  const CinemasSection({super.key});

  @override
  Widget build(BuildContext context) {

    List<CinemaEntity> cinemas=[];

    cinemas.add(CinemaEntity(id: 100, name: "test1", distance: "2.2", closeTime: "22:00", logoUrl: "https://media0078.elcinema.com/uploads/_320x_9ad5cdee298cc9765c7d87bfa86556533633d9b3fe8f61b1cb43a3f1129ce0dd.jpg", rating: "1.0"));
    cinemas.add(CinemaEntity(id: 200, name: "test2", distance: "2.2", closeTime: "22:00", logoUrl: "https://rnscinemas.net/public/qv/cinema.jpg", rating: "2.0"));
    cinemas.add(CinemaEntity(id: 300, name: "test3", distance: "2.2", closeTime: "22:00", logoUrl: "https://media0078.elcinema.com/uploads/_320x_9ad5cdee298cc9765c7d87bfa86556533633d9b3fe8f61b1cb43a3f1129ce0dd.jpg", rating: "3.0"));
    cinemas.add(CinemaEntity(id: 400, name: "test4", distance: "2.2", closeTime: "22:00", logoUrl: "https://rnscinemas.net/public/qv/cinema.jpg", rating: "4.0"));

    context.read<CinemasBloc>().add(CashCinemasEvent(cinemasList: cinemas));

    Future.delayed(const Duration(milliseconds: 500), () {
      context.read<CinemasBloc>().add(GetCinemasEvent());
    });



    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text(HomeStrings.cinemasNearYouTitle,style: Theme.of(context).textTheme.titleLarge,)),
            Text(HomeStrings.seeAll,style: Theme.of(context).textTheme.labelMedium,)
          ],
        ),
        const SizedBox(height: 16,),

    BlocBuilder<CinemasBloc,CinemasState>(
    builder:(context,state) {
      switch (state) {
        case CinemasGetLoadingState():
          return const Center(child: Circleloading());

        case CinemasGetDisplayDataState() :
          return display(state.data);

        case CinemasGetErrorState() :
          return Center(child: Text(state.message));

        default:
          return const Text("unknown state");
      }
    }

    )

      ],
    );
  }
}



display(List<CinemaEntity> data){

  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: data.length,
    itemBuilder: (context, index) {
      return cinemaCard(context,data[index]);
    },
  );
}

cinemaCard(BuildContext context, CinemaEntity data) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        RoundImage(width: 80, height: 80,urlLocation:data.logoUrl ,),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                distance(context,data.distance),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data.name, style: Theme.of(context).textTheme.labelLarge),
                    rating(context,data.rating)
                  ],
                ),
                Text(
                  "Closed ${data.closeTime}",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ),
        Container()



      ],
    ),
  );
}

distance(BuildContext context, String distance) {
  return Row(
    children: [
      IconImage(imageLocation: "assets/images/ic_location.svg"),
      Text("$distance ${HomeStrings.km}",style: Theme.of(context).textTheme.labelSmall?.copyWith(color: colors.blue100)),
    ],
  );
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