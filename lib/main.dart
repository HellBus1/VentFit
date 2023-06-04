import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'package:ventfit/presentation/route/routes.dart';
import 'package:ventfit/commons/themes/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dependency_injection.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: UpgradeAlert(
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          title: 'VentFit',
          theme: lightTheme,
          darkTheme: darkTheme,
          routes: Routes.getRoutes(context),
        ),
      ),
    );
  }
}
