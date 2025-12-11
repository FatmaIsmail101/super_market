import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/navigation_view.dart';

import '../../features/auth/login/presentation/view/login.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Navigating to: ${settings.name}');
    }

    //final uri = Uri.parse(settings.name ?? '/');

    switch (settings.name) {
      case Routes.signUpRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>   SignUpScreen(),
        );
      case Routes.navigationRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NavigationView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>  Login(),
        );


      default:
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('404 - Page Not Found')),
              ),
        );
    }
  }
}
