import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v2_tracking_page/shared/routes.dart';
import 'package:v2_tracking_page/tracking/tracking_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1190),
      builder: (context, child) {
        return MaterialApp(
          title: 'Tracking Page',
          debugShowCheckedModeBanner: false,
          initialRoute: TrackingScreen.routeName,
          onGenerateRoute: onGenerateRoutes,
          onGenerateInitialRoutes: onGenerateInitialRoute,
        );
      },
    );
  }
}
