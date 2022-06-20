import 'package:flutter/material.dart';
import 'package:v2_tracking_page/tracking/tracking_page.dart';

List<Route<dynamic>> onGenerateInitialRoute(String initialRouteName) {
  switch (initialRouteName) {
    case TrackingScreen.routeName:
      return [
        MaterialPageRoute(
          builder: (_) =>  TrackingScreen(),
        )
      ];
    default:
      return [
        MaterialPageRoute(
          builder: (_) =>  TrackingScreen(),
        )
      ];
  }
}

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {

    /// index
    case TrackingScreen.routeName:
      return MaterialPageRoute(
        settings: RouteSettings(name: settings.name),
        builder: (context) => const TrackingScreen(),
      );

    /// default
    default:
      return MaterialPageRoute(
        settings: RouteSettings(name: settings.name),
        builder: (context) => const TrackingScreen(),
      );
  }
}
