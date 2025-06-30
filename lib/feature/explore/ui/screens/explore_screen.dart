import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_explorer/feature/explore/ui/screens/now_showing_tab_screen.dart';
import 'package:movies_explorer/feature/explore/ui/screens/upcoming_tab_screen.dart';
import 'package:movies_explorer/feature/explore/ui/screens/widgets/top_movies_section.dart';
import 'package:movies_explorer/feature/explore/ui/screens/widgets/upcoming_movies_section.dart';

import '../../../../core/network/di.dart';
import '../../../../core/widgets/IconImage.dart';
import '../../domain/use_cases/getRecommendedMoviesUseCase.dart';
import '../../domain/use_cases/getTopMoviesUseCase.dart';
import '../../domain/use_cases/getUpComingMoviesUseCase.dart';
import '../bloc/recommended_movies_bloc/recommended_movies_bloc.dart';
import '../bloc/top_movies_bloc/top_movies_bloc.dart';
import '../bloc/upcoming_movies_bloc/upcoming_movies_bloc.dart';
import '../util/explore_strings.dart';

import '../../../../core/theme/util/colors.dart' as colors;

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => TopMoviesBloc(getTopMoviesUseCase:getCoreIt<GetTopMoviesUseCase>())),
          BlocProvider(create: (_) => RecommendedMoviesBloc(getRecommendedMoviesUseCase: getCoreIt<GetRecommendedMoviesUseCase>())),
          BlocProvider(create: (_) => UpcomingMoviesBloc(getUpcomingMoviesUseCase: getCoreIt<GetUpcomingMoviesUseCase>()))
        ],
      child: Scaffold(
        appBar: screenAppBar(context),
        body: Padding(
          padding: const EdgeInsets.only(left: 4,right: 4),
          child: DefaultTabController(
            length: 2, // number of tabs
            child: Scaffold(
              appBar: tabBar(context),
              body:  tabsContent(),
            ),
          ),
        ),
      ),
    );
  }


  tabBar(BuildContext context){
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight+6),
      child: Container(

        padding: const EdgeInsets.only(bottom:8),
        decoration: const BoxDecoration(
          color: colors.gray800,
          borderRadius: BorderRadius.all( Radius.circular(12)),
          boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black26)],
        ),
        child: AppBar(

          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          bottom: TabBar(

           dividerColor: Colors.transparent,
            labelColor: colors.white100,
            unselectedLabelColor: colors.white200,
            labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
            unselectedLabelStyle:  Theme.of(context).textTheme.labelMedium,
            indicator: BoxDecoration(
              color: colors.blue100,
              borderRadius: BorderRadius.circular(6),
            ),
            tabs:  const [
              Tab(child: Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),child: Text( ExploreStrings.nowShowingTabTitle,))),
              Tab(child: Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),child: Text( ExploreStrings.upcomingTabTitle))),

            ],
          ),
        ),
      ),
    );
  }
  tabsContent(){
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: TabBarView(
        children: [
          NowShowingTabScreen(),
          UpcomingTabScreen(),
        ],
      ),
    );
  }
  screenAppBar(BuildContext context){
    return AppBar(
      title:  Text(ExploreStrings.screenTitle,style: Theme.of(context).textTheme.titleLarge),
      centerTitle: true,
      leading: IconButton(
        icon: IconImage(imageLocation: "assets/images/ic_back.svg",),
        onPressed: () {
          print("Search tapped");
        },
      ),
      actions: [
        IconButton(
          icon: IconImage(imageLocation: "assets/images/ic_search_appbar.svg",),
          onPressed: () {
            print("Search tapped");
          },
        )
      ],
    );
  }
}
