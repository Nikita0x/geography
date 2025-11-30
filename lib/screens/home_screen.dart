import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geography/components/background.dart';
import 'package:geography/main.dart' show Routes;

class Mode {
  final String name;
  final String route;

  Mode(this.name, this.route);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Mode> modes = [
    Mode('Guess Name from Flags', Routes.flagsGuessNameFromFlags),
    Mode('Guess Country from Capital', Routes.capitalsGuessCountryFromCapital),
    Mode('Guess Capital from Country', Routes.countriesGuessCapitalFromCountry),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      child: Stack(
        children: [
          const Positioned.fill(child: HomeBackground()),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...modes.map((item) {
                    return Card(
                      elevation: 0,
                      color: Colors.white.withOpacity(0.05),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: const EdgeInsets.only(bottom: 12),
                      child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 12,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        onPressed:
                            () => Navigator.of(
                              context,
                              rootNavigator: true,
                            ).pushNamed(item.route),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
