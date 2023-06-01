import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ventfit/commons/themes/color.dart';

var lightTheme = ThemeData(
  scaffoldBackgroundColor: whiteSolid,
  cardColor: white,
  appBarTheme: const AppBarTheme(
    backgroundColor: white,
    elevation: 1,
    iconTheme: IconThemeData(color: blackRibbon, size: 24),
    actionsIconTheme: IconThemeData(color: blackRibbon, size: 24),
    titleTextStyle: TextStyle(
      color: blackRibbon,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: blackRibbon),
    bodyMedium: TextStyle(color: blackRibbon),
    bodySmall: TextStyle(color: blackRibbon),
    titleLarge: TextStyle(color: blackRibbon),
    titleMedium: TextStyle(color: blackRibbon),
    titleSmall: TextStyle(color: blackRibbon),
  ),
  iconTheme: const IconThemeData(color: blackRibbon),
  drawerTheme: const DrawerThemeData(
    backgroundColor: white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: blackRibbon.withOpacity(0.8), fontSize: 14),
    labelStyle: const TextStyle(color: blackRibbon),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: blackRibbon),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: blackRibbon.withOpacity(0.8)),
    ),
    prefixIconColor: blackRibbon,
  ),
);

var darkTheme = ThemeData(
  scaffoldBackgroundColor: sooty,
  cardColor: nobleBlack,
  appBarTheme: const AppBarTheme(
    backgroundColor: nobleBlack,
    elevation: 1,
    iconTheme: IconThemeData(color: silverMistral, size: 24),
    titleTextStyle: TextStyle(
      color: silverMistral,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: nobleBlack,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: silverMistral),
    bodyMedium: TextStyle(color: silverMistral),
    bodySmall: TextStyle(color: silverMistral),
    titleLarge: TextStyle(color: silverMistral),
    titleMedium: TextStyle(color: silverMistral),
    titleSmall: TextStyle(color: silverMistral),
  ),
  iconTheme: const IconThemeData(color: silverMistral),
  drawerTheme: const DrawerThemeData(
    backgroundColor: nobleBlack,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: silverMistral.withOpacity(0.8), fontSize: 14),
    labelStyle: const TextStyle(color: silverMistral),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: silverMistral),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: silverMistral.withOpacity(0.8)),
    ),
    prefixIconColor: silverMistral,
  ),
);
