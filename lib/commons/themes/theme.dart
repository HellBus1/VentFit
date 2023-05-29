import 'package:flutter/material.dart';
import 'package:ventfit/commons/themes/color.dart';

var lightTheme = ThemeData(
  scaffoldBackgroundColor: whiteSolid,
  cardColor: white,
  appBarTheme: const AppBarTheme(
    backgroundColor: white,
    elevation: 1,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: blackRibbon),
    bodyMedium: TextStyle(color: blackRibbon),
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
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: silverMistral),
    bodyMedium: TextStyle(color: silverMistral),
    bodySmall: TextStyle(color: silverMistral),
    titleLarge: TextStyle(color: silverMistral),
    titleMedium: TextStyle(color: silverMistral),
    titleSmall: TextStyle(color: silverMistral),
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
