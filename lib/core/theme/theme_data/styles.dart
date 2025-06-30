import 'package:flutter/material.dart';
import 'package:movies_explorer/core/constants.dart' as consts;
import 'package:movies_explorer/core/theme/util/colors.dart' as colors;

class Styles {
  Styles._();

  static const titleLarge = TextStyle(
      color: colors.white100,
      fontSize: 20,
      decoration: TextDecoration.none,
      fontFamily: consts.fontFamilyName,
      fontWeight: FontWeight.bold,
      height: 1.5);
  static const titleMedium = TextStyle(
      color: colors.white100,
      fontSize: 18,
      decoration: TextDecoration.none,
      fontFamily: consts.fontFamilyName,
      fontWeight: FontWeight.normal,
      height: 1.5);
  static const labelLarge = TextStyle(
      color: colors.white100,
      fontSize: 16,
      decoration: TextDecoration.none,
      fontFamily: consts.fontFamilyName,
      fontWeight: FontWeight.bold,
      height: 1.5);
  static const labelMedium = TextStyle(
      color: colors.gray200,
      fontSize: 14,
      decoration: TextDecoration.none,
      fontFamily: consts.fontFamilyName,
      fontWeight: FontWeight.normal,
      height: 1.5);
  static const labelSmall = TextStyle(
      color: colors.gray500,
      fontSize: 12,
      decoration: TextDecoration.none,
      fontFamily: consts.fontFamilyName,
      fontWeight: FontWeight.normal,
      height: 1.5);




  static var inputSearchDeco = InputDecorationTheme(
      filled: true,
      fillColor: colors.gray600,
      hintStyle: const TextStyle(color: colors.gray400),
      enabledBorder: OutlineInputBorder(borderSide: const BorderSide(style:BorderStyle.solid,color: colors.gray100, width: 1), borderRadius: BorderRadius.circular(12.0)),
      focusedBorder: OutlineInputBorder(borderSide: const BorderSide(style: BorderStyle.solid, color: colors.gray100),borderRadius: BorderRadius.circular(12.0)));



  static var bottomNavigation = const BottomNavigationBarThemeData(
    backgroundColor: colors.gray100,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 1,
  );

}