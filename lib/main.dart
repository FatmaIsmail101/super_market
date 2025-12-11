
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/constants/di.dart';
import 'core/l10n/translations/app_localizations.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureDependencies();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Route E-Commerce",
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale("en"),
      theme: AppTheme.getLightThemeData(),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.loginRoute,
    );
  }
}
