import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_explorer/feature/explore/ui/screens/explore_screen.dart';
import 'package:movies_explorer/feature/home/ui/screens/home_screen.dart';
import 'package:movies_explorer/feature/movie_details/ui/screens/details_screen.dart';
import 'package:movies_explorer/feature/profile/ui/screens/profile_screen.dart';
import 'package:movies_explorer/feature/search_result/ui/screens/search_result.dart';

import 'navigation_holder.dart';

/*
final GoRouter router=GoRouter(
    initialLocation: "/home",,routes: [

  GoRoute(path: "/home",builder: (context,state)=> const HomeScreen()),
  GoRoute(path: "/explore",builder: (context,state)=> const ExploreScreen()),
  GoRoute(path: "/profile",builder: (context,state)=> const ProfileScreen()),
  GoRoute(path: "/movie_details",builder: (context,state)=> const DetailsScreen()),


]);*/

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return NavigationHolder(child: child); // BottomNavigationBar UI
      },
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              NoTransitionPage(key: state.pageKey, child: const HomeScreen()),
        ),

        GoRoute(
          path: '/explore',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const ExploreScreen(),
          ),
        ),

        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const ProfileScreen(),
          ),
        ),
      ],
    ),

    GoRoute(
      path: '/movie_details/:id',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: DetailsScreen(id: int.parse(state.pathParameters["id"]!),),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {

          final offsetAnimation = Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation);


          return  SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),

    GoRoute(
      path: '/search_result/:keyword',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: SearchResult(keyword: state.pathParameters["keyword"]!,),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {

          final offsetAnimation = Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation);


          return  SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    ),



    /*GoRoute(
      path: '/movie_details/:id',
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: DetailsScreen(id: int.parse(state.pathParameters["id"]!),),
      ),
    )*/
  ],
);
