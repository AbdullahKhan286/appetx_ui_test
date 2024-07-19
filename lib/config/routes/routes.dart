import 'package:apptex_ui_task/config/routes/routes_name.dart';
import 'package:apptex_ui_task/view/home_screen/home_screen.dart';
import 'package:apptex_ui_task/view/product_detail_screen/product_detail_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.product:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProductDetailScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
