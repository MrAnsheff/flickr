import 'package:flutter/material.dart';
import 'package:flicr/screens/home_screen.dart';
import 'package:flicr/screens/item_screen.dart';

class RouteGenerator {
  static const ROUTE_HOME = "/";
  static const ROUTE_ITEM = "/item";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_HOME:
        final page = HomeScreen();
        return MaterialPageRoute(
            builder: (context) => page,
            settings: RouteSettings(name: ROUTE_HOME));

      case ROUTE_ITEM:
        final page = ItemScreen(settings.arguments as List<dynamic>);
        return MaterialPageRoute(
            builder: (context) => page,
            settings: RouteSettings(name: ROUTE_ITEM));

      default:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }
}
