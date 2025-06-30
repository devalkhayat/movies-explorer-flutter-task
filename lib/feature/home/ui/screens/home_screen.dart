import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies_explorer/feature/home/data/datasources/home_local_datasource.dart';
import 'package:movies_explorer/feature/home/data/datasources/home_remote_datasource.dart';
import 'package:movies_explorer/feature/home/data/repository/home_repo_impl.dart';
import 'package:movies_explorer/feature/home/domain/use_cases/getComingSoonUsesCase.dart';
import 'package:movies_explorer/feature/home/ui/bloc/coming_soon_bloc/coming_soon_bloc.dart';
import 'package:movies_explorer/feature/home/ui/screens/widgets/cinema_section.dart';
import 'package:movies_explorer/feature/home/ui/screens/widgets/movies_section.dart';
import 'package:movies_explorer/feature/home/ui/screens/widgets/search_box_section.dart';
import 'package:movies_explorer/feature/home/ui/screens/widgets/welcome_box_section.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/di.dart';
import '../../domain/repo/home_repository.dart';
import '../../domain/use_cases/saveNearByCinemasUseCase.dart';
import '../../domain/use_cases/getNearByCinemasUseCase.dart';
import '../bloc/cinemas_bloc/cinemas_bloc.dart';
import '../util/di.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ComingSoonBloc(getComingSoonUseCase:getCoreIt<GetComingSoonUseCase>())),
        BlocProvider(create: (_) => CinemasBloc(getNearByCinemasUseCase: getCoreIt<GetNearByCinemasUseCase>(),cachNearByCinemasUseCase: getCoreIt<SaveNearByCinemasUseCase>()))
      ],
      child: const SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8,),
            WelcomeBoxSection(),
            SizedBox(height: 24,),
            SearchBoxSection(),
            SizedBox(height: 16,),
            MoviesSection(),
            SizedBox(height: 16,),
            CinemasSection()
          ],
        ),
      )
    );
  }


}
