import 'package:flutter/cupertino.dart';
import 'package:device_preview/device_preview.dart';

import 'services/revenue_cat_service.dart';
import 'package:geography/screens/initial_screen.dart';
import 'screens/home_screen.dart';
import 'screens/modes_screen.dart';
import 'screens/flags_europe_screen.dart';
import 'screens/flags_africa_screen.dart';
import 'screens/flags_asia_screen.dart';
import 'screens/playground_screen.dart';
import 'screens/test_screen.dart';
import 'screens/paywall_screen.dart';
import 'screens/hearts_screen.dart';
import 'screens/modes/flags_guess_name_from_flags_screen.dart';
import 'screens/modes/capitals_guess_country_from_capital_screen.dart';
import 'screens/modes/countries_guess_capital_from_country_screen.dart';

class Routes {
  static const String initialRoute = "/initial";
  static const String home = "/";
  static const String modes = '/modes';
  static const String europeanFlags = '/flags/eu';
  static const String africanFlags = '/flags/afr';
  static const String asianFlags = '/flags/asia';
  static const String playground = '/playground';
  static const String test = '/test';
  static const String paywall = '/paywall';
  static const String hearts = '/hearts';
  static const String flagsGuessNameFromFlags = '/flags/guess-name-from-flags';
  static const String capitalsGuessCountryFromCapital =
      '/capitals/guess-country-from-capital';
  static const String countriesGuessCapitalFromCountry =
      '/countries/guess-capital-from-country';
}

bool isDev = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeRevenueCat();

  runApp(
    DevicePreview(
      builder:
          (context) => CupertinoApp(
            useInheritedMediaQuery: true, //required by DevicePreview
            initialRoute: isDev ? Routes.home : Routes.initialRoute,
            routes: {
              Routes.home: (context) => HomeScreen(),
              Routes.europeanFlags: (context) => FlagsEuropeScreen(),
              Routes.africanFlags: (context) => FlagsAfricaScreen(),
              Routes.asianFlags: (context) => FlagsAsiaScreen(),
              Routes.modes: (context) => ModesScreen(),
              Routes.playground: (context) => PlaygroundScreen(),
              Routes.test: (context) => TestScreen(),
              Routes.paywall: (context) => PaywallScreen(),
              Routes.hearts: (context) => HeartsScreen(),
              Routes.flagsGuessNameFromFlags:
                  (context) => FlagsGuessNameFromFlagsScreen(),
              Routes.capitalsGuessCountryFromCapital:
                  (context) => CapitalsGuessCountryFromCapitalScreen(),
              Routes.countriesGuessCapitalFromCountry:
                  (context) => CountriesGuessCapitalFromCountryScreen(),
              Routes.initialRoute: (context) => InitialScreen(),
            },
          ),
    ),
  );
}
