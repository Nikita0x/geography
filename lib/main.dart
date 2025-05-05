import 'package:flutter/cupertino.dart';
import 'package:device_preview/device_preview.dart';

import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';

class Routes {
  static const String settings = '/settings';
}

void main() {
  runApp(
    DevicePreview(
      builder:
          (context) => CupertinoApp(
            useInheritedMediaQuery: true, //required by DevicePreview
            home: HomeScreen(),
            routes: {Routes.settings: (context) => SettingsScreen()},
          ),
    ),
  );
}
