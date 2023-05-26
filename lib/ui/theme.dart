import 'package:flutter/material.dart';
import 'package:ventfit/ui/color.dart';

var lightTheme = ThemeData(
  scaffoldBackgroundColor: whiteSolid,
  cardColor: white,
  appBarTheme: const AppBarTheme(
    backgroundColor: white,
    foregroundColor: Color(0xff000000),
  ),
);

var darkTheme = ThemeData(
  scaffoldBackgroundColor: sooty,
  cardColor: nobleBlack,
  appBarTheme: const AppBarTheme(
    backgroundColor: nobleBlack,
    foregroundColor: Color(0xffffffff),
  ),
);
