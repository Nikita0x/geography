import 'package:flutter/cupertino.dart';
import 'package:device_preview/device_preview.dart';

import 'package:geography/screens/initial_screen.dart';
import 'screens/home_screen.dart';
import 'screens/modes_screen.dart';
import 'screens/flags_europe_screen.dart';
import 'screens/flags_africa_screen.dart';
import 'screens/flags_asia_screen.dart';
import 'screens/playground_screen.dart';
import 'screens/test_screen.dart';
import 'screens/paywall_screen.dart';

class Routes {
  static const String initialRoute = "/initial";
  static const String modes = '/modes';
  static const String europeanFlags = '/flags/eu';
  static const String africanFlags = '/flags/afr';
  static const String asianFlags = '/flags/asia';
  static const String playground = '/playground';
  static const String test = '/test';
  static const String paywall = '/paywall';
}

void main() {
  runApp(
    DevicePreview(
      builder:
          (context) => CupertinoApp(
            useInheritedMediaQuery: true, //required by DevicePreview
            initialRoute: Routes.initialRoute,
            home: HomeScreen(),
            routes: {
              Routes.europeanFlags: (context) => FlagsEuropeScreen(),
              Routes.africanFlags: (context) => FlagsAfricaScreen(),
              Routes.asianFlags: (context) => FlagsAsiaScreen(),
              Routes.modes: (context) => ModesScreen(),
              Routes.playground: (context) => PlaygroundScreen(),
              Routes.test: (context) => TestScreen(),
              Routes.paywall: (context) => PaywallScreen(),
              Routes.initialRoute: (context) => InitialScreen(),
            },
          ),
    ),
  );
}
