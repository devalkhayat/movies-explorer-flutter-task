import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_explorer/feature/explore/ui/screens/widgets/recommended_movies_section.dart';
import 'package:movies_explorer/feature/explore/ui/screens/widgets/top_movies_section.dart';

import '../../../../core/network/di.dart';
import '../../domain/use_cases/getRecommendedMoviesUseCase.dart';
import '../../domain/use_cases/getTopMoviesUseCase.dart';
import '../bloc/recommended_movies_bloc/recommended_movies_bloc.dart';
import '../bloc/top_movies_bloc/top_movies_bloc.dart';

class NowShowingTabScreen extends StatelessWidget {
  const NowShowingTabScreen({super.key});

  @override
  Widget build(BuildContext context) {

     return const SingleChildScrollView(
       child:  Padding(
         padding: EdgeInsets.only(top: 16.0),
         child: Column(
           children: [

             TopMoviesSection(),
             SizedBox(height: 20,),
             RecommendedMoviesSection(),

           ],
         ),
       ),
     );
  }
}
