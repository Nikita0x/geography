import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String correctCountry = 'de';
  List<String> flagOptions = ['de', 'ua', 'es', 'fr'];
  int score = 0;

  void handleAnswer(String countryCode) {
    if (countryCode == correctCountry) {
      setState(() {
        score++;
      });
    } else {
      print('wrong country');
      setState(() {
        score--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Settings')),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                // Wrap GridView with Expanded
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  padding: EdgeInsets.all(5),
                  children: [
                    CupertinoButton(
                      child: SvgPicture.asset('assets/flags/de.svg'),
                      onPressed: () {
                        handleAnswer('de');
                      },
                    ),
                    CupertinoButton(
                      child: SvgPicture.asset('assets/flags/ua.svg'),
                      onPressed: () {
                        handleAnswer('ua');
                      },
                    ),
                    CupertinoButton(
                      child: SvgPicture.asset('assets/flags/es.svg'),
                      onPressed: () {
                        handleAnswer('es');
                      },
                    ),
                    CupertinoButton(
                      child: SvgPicture.asset('assets/flags/fr.svg'),
                      onPressed: () {
                        handleAnswer('fr');
                      },
                    ),
                    // Add more flags here as needed
                  ],
                ),
              ),
              Text("Select: $correctCountry"),
              Text("Score: $score"),
              // You can add more widgets here if necessary
            ],
          ),
        ),
      ),
    );
  }
}
