import 'package:flutter/material.dart';
import 'package:movies_explorer/core/constants.dart' as consts;
import 'package:movies_explorer/core/theme/util/colors.dart' as colors;
import 'styles.dart';

ThemeData getAppTheme() => ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  scaffoldBackgroundColor: colors.gray100,
  useMaterial3: true,
  fontFamily: consts.fontFamilyName,
  appBarTheme: const AppBarTheme(backgroundColor: colors.gray100),
  bottomNavigationBarTheme: Styles.bottomNavigation,
  dividerTheme: const DividerThemeData(color: colors.gray200),
  highlightColor: Colors.transparent,
  splashFactory: InkRipple.splashFactory
/*  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: NoTransitionsBuilder(),
      TargetPlatform.iOS: NoTransitionsBuilder(),
    },
  )*/,
  textTheme: const TextTheme(
      titleLarge: Styles.titleLarge,
     titleMedium: Styles.titleMedium,
     labelLarge: Styles.labelLarge,
    labelMedium: Styles.labelMedium,
    labelSmall: Styles.labelSmall,

      ),
);


class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return child; // No animation
  }
}
