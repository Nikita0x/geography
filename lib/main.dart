import 'package:flutter/cupertino.dart';
import 'package:device_preview/device_preview.dart';

import 'screens/home_screen.dart';
import 'screens/modes_screen.dart';
import 'screens/flags_europe_screen.dart';
import 'screens/flags_africa_screen.dart';
import 'screens/flags_asia_screen.dart';
import 'screens/playground_screen.dart';

class Routes {
  static const String europeanFlags = '/flags/eu';
  static const String africanFlags = '/flags/afr';
  static const String asianFlags = '/flags/asia';
  static const String modes = '/modes';
  static const String playground = '/playground';
}

void main() {
  runApp(
    DevicePreview(
      builder:
          (context) => CupertinoApp(
            useInheritedMediaQuery: true, //required by DevicePreview
            home: HomeScreen(),
            routes: {
              Routes.europeanFlags: (context) => FlagsEuropeScreen(),
              Routes.africanFlags: (context) => FlagsAfricaScreen(),
              Routes.asianFlags: (context) => FlagsAsiaScreen(),
              Routes.modes: (context) => ModesScreen(),
              Routes.playground: (context) => PlaygroundScreen(),
            },
          ),
    ),
  );
}
