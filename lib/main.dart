import 'package:flutter/cupertino.dart';
import 'package:device_preview/device_preview.dart';

import 'screens/home_screen.dart';
import 'screens/modes_screen.dart';
import 'screens/flags_screen.dart';

class Routes {
  static const String settings = '/flags';
  static const String modes = '/modes';
}

void main() {
  runApp(
    DevicePreview(
      builder:
          (context) => CupertinoApp(
            useInheritedMediaQuery: true, //required by DevicePreview
            home: HomeScreen(),
            routes: {
              Routes.settings: (context) => SettingsScreen(),
              Routes.modes: (context) => ModesScreen(),
            },
          ),
    ),
  );
}
