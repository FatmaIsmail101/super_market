import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/routing/app_router.dart';
import 'package:route_e_commerce_v2/core/theme/app_theme.dart';
import 'package:route_e_commerce_v2/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';

import 'core/cache_helper/cache_helper.dart';
import 'core/constants/bloc_observer.dart';
import 'core/constants/di.dart';
import 'core/routing/routes.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureDependencies();
  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(430, 932), // حسب تصميمك
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<SignUpBloc>()),
          BlocProvider(create: (context) => getIt<LoginBloc>()),
        ],
        child: const MyApp(),
      ),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final res = CacheHelper.getString("token");

    return MaterialApp(
      title: "Route E-Commerce",
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale("en"),
      theme: AppTheme.getLightThemeData(),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: res == null ? Routes.loginRoute : Routes.navigationRoute,
    );
  }
}
