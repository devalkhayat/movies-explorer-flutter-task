import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_explorer/feature/explore/ui/util/di.dart';
import 'package:movies_explorer/feature/home/ui/screens/widgets/search_box_section.dart';
import 'package:movies_explorer/navigation_holder.dart';

import 'core/network/di.dart';
import 'core/theme/theme_data/app_theme_data.dart';
import 'feature/home/ui/util/di.dart';
import 'feature/home/ui/screens/home_screen.dart';
import 'feature/home/ui/screens/widgets/cinema_section.dart';
import 'feature/home/ui/screens/widgets/movies_section.dart';
import 'feature/home/ui/screens/widgets/welcome_box_section.dart';

import 'package:movies_explorer/core/theme/util/colors.dart' as colors;

import 'feature/movie_details/ui/util/di.dart';
import 'feature/search_result/ui/util/di.dart';
import 'navigation_map.dart';

void main() async{

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
   // statusBarColor: Colors.amber,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark
  ));


   await coreSetupLocator();
   await homeSetupLocator();
   await exploreSetupLocator();
   await movieDetailsSetupLocator();
   await searchResultSetupLocator();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return

      SafeArea(child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: colors.gray100,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child: MaterialApp.router(
          theme:getAppTheme(),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',

        ),
      ) );

  }
}




