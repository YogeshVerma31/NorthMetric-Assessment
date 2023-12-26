import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_assessment/provider/product_provider.dart';
import 'package:testing_assessment/routes/routes_name.dart';

import '../ui/products/product_screen.dart';

class RouterSetting {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.productScreen:
        return createRoute(ChangeNotifierProvider(
          create: (BuildContext context) => ProductsProvider(),
          builder: (context, child) {
            return ProductScreen();
          },
        ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  static Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
