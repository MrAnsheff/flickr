import 'package:flicr/services/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_state/native_state.dart';

import 'package:flicr/screens/home_screen.dart';
import 'package:flicr/blocs/main_bloc_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(SavedState(child: FlicrApp()));
  });
}

class FlicrApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var savedState = SavedState.of(context);
    return MainBlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flickr Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        navigatorKey: GlobalKey(),
        navigatorObservers: [SavedStateRouteObserver(savedState: savedState)],
        initialRoute: SavedStateRouteObserver.restoreRoute(savedState) ?? "/",
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
