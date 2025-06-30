import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_explorer/feature/movie_details/ui/screens/widgets/images_section.dart';
import 'package:movies_explorer/feature/movie_details/ui/screens/widgets/info_section.dart';

import '../../../../core/network/di.dart';
import '../../../../core/widgets/IconImage.dart';
import '../../domain/use_cases/getDetailsUseCase.dart';
import '../../domain/use_cases/getImagesUseCase.dart';
import '../bloc/details_bloc/details_bloc.dart';
import '../bloc/images_bloc/images_bloc.dart';
import '../util/movie_details_strings.dart';

class DetailsScreen extends StatelessWidget {
  final int id;
  const DetailsScreen({super.key,required this.id});

  @override
  Widget build(BuildContext context) {

    return  MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => DetailsBloc(getDetailsUseCase:getCoreIt<GetDetailsUseCase>())),
          BlocProvider(create: (_) => ImagesBloc(getImagesUseCase:getCoreIt<GetImagesUseCase>())),
        ],
        child:  Scaffold(
          appBar: screenAppBar(context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ImagesSection(movieID: id,),
                  const SizedBox(height: 16,),
                  InfoSection(movieID: id,)
                ],
              ),
            ),
          ),
        )
    );

  }

  screenAppBar(BuildContext context){
    return AppBar(
      title:  Text(MovieDetailsStrings.screenTitle,style: Theme.of(context).textTheme.titleLarge),
      centerTitle: true,
      leading: IconButton(
        icon: IconImage(imageLocation: "assets/images/ic_back.svg",),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
      actions: [
        IconButton(
          icon: IconImage(imageLocation: "assets/images/ic_bookmark.svg",),
          onPressed: () {


          },
        )
      ],

    );
  }
}
