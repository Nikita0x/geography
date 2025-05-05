import 'package:flutter/cupertino.dart';

import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';

class Routes {
  static const String settings = '/settings';
}

void main() {
  runApp(
    CupertinoApp(
      home: HomeScreen(),
      routes: {Routes.settings: (context) => SettingsScreen()},
    ),
  );
}
