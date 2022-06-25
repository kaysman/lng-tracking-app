import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v2_tracking_page/main.dart';
import 'package:v2_tracking_page/tracking/track.bloc.dart';


class AppService {

  AppService._setEnvironment();

  static final instance = AppService._setEnvironment();

  startApp() async {
    // register all blocs here...
    TrackOrderBloc trackOrderBloc = TrackOrderBloc();

    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<TrackOrderBloc>(create:(_) => trackOrderBloc),
        ],
        child: TrackOrderApp(),
      ),
    );
  }
}
