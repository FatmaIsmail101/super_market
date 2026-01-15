import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/presentation/screens/forget_password.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/presentation/screens/reset_code_screen.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/presentation/screens/verify_email.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/navigation_view.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/data/model/product_model.dart';

import '../../features/auth/login/presentation/view/login.dart';
import '../../features/product_details/presentation/screens/product_details.dart';
import '../../features/products/presentation/screens/product_screen.dart';

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
      case Routes.productDetails:
        return MaterialPageRoute(
          builder:
              (_) =>
              ProductDetails(
                productModel: ProductModel(id: "6428ebc6dc1175abc65ca0b9"),
              ),
        );
      case Routes.productsScreenRoute:
        return MaterialPageRoute(builder: (_) => const ProductsScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>  Login(),
        );
      case Routes.verifyEmailRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => VerifyEmail(),
        );
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ForgetPassword(),
        );
      case Routes.resetCodeRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ResetCodeScreen(),
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
