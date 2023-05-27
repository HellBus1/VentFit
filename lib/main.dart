import 'package:flutter/material.dart';
import 'package:ventfit/presentation/route/routes.dart';
import 'package:ventfit/ui/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'VentFit',
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: Routes.getRoutes(context),
    );
  }
}
