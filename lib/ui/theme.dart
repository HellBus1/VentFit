import 'package:flutter/material.dart';
import 'package:ventfit/ui/color.dart';

var lightTheme = ThemeData(
  scaffoldBackgroundColor: whiteSolid,
  cardColor: white,
  appBarTheme: const AppBarTheme(
    backgroundColor: white,
    elevation: 1,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: blackRibbon),
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
  ),
);
