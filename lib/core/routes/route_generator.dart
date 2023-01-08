import 'package:flutter/material.dart';
import 'package:wothoq/core/routes/app_pages.dart';
import 'package:wothoq/core/routes/platform_page_route.dart';
import 'package:wothoq/core/routes/routes.dart';
import 'package:wothoq/core/routes/undefined_route_screen.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {

    print("RouteGenerator.generateRoute: ${settings.name}");
    Widget page = Routes.routes
        .firstWhere(
          (route) => route.path == settings.name,
          orElse: () => AppPage(path: "/404", page: UndefinedRouteScreen()),
        )
        .page;

    return platformPageRoute(page);
  }
}
