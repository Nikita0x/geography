import 'package:flutter/cupertino.dart';
import 'package:device_preview/device_preview.dart';

import 'services/revenue_cat_service.dart';
import 'package:geography/screens/initial_screen.dart';
import 'screens/home_screen.dart';
// import 'screens/modes_screen.dart';
import 'screens/playground_screen.dart';
import 'screens/test_screen.dart';
import 'screens/paywall_screen.dart';
import 'screens/modes/flags_guess_name_from_flags_screen.dart';
import 'screens/modes/capitals_guess_country_from_capital_screen.dart';
import 'screens/modes/countries_guess_capital_from_country_screen.dart';

class Routes {
  static const String initialRoute = "/initial";
  static const String home = "/";
  static const String modes = '/modes';
  static const String playground = '/playground';
  static const String test = '/test';
  static const String paywall = '/paywall';
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
              Routes.home: (context) => const _RootTabScaffold(),
              // Routes.modes: (context) => ModesScreen(),
              Routes.playground: (context) => PlaygroundScreen(),
              Routes.test: (context) => TestScreen(),
              Routes.paywall: (context) => PaywallScreen(),
              Routes.flagsGuessNameFromFlags:
                  (context) => FlagsGuessNameFromFlagsScreen(),
              Routes.capitalsGuessCountryFromCapital:
                  (context) => CapitalsGuessCountryFromCapitalScreen(),
              Routes.countriesGuessCapitalFromCountry:
                  (context) => CountriesGuessCapitalFromCountryScreen(),
              Routes.initialRoute: (context) => const InitialScreen(),
            },
          ),
    ),
  );
}

class _RootTabScaffold extends StatefulWidget {
  const _RootTabScaffold();

  @override
  State<_RootTabScaffold> createState() => _RootTabScaffoldState();
}

class _RootTabScaffoldState extends State<_RootTabScaffold> {
  late final CupertinoTabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = CupertinoTabController(initialIndex: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _controller,
      tabBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          if (index == 3) {
            Navigator.of(context).push(PaywallRoute());
            // Не переключаем таб, остаёмся на предыдущем
            _controller.index = _currentIndex;
            return;
          }

          if (index != _currentIndex) {
            setState(() {
              _currentIndex = index;
              _controller.index = index;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.play_arrow_solid),
            label: 'Playground',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.lab_flask),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.lock),
            label: 'Premium',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return CupertinoTabView(builder: (context) => const HomeScreen());
        }

        if (index == 1) {
          return CupertinoTabView(builder: (context) => PlaygroundScreen());
        }

        // index == 2 или любой другой рабочий индекс табов
        return CupertinoTabView(builder: (context) => TestScreen());
      },
    );
  }
}
