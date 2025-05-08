import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geography/models/quiz_round.dart';
import 'dart:math';
import 'dart:async';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int duration = 30;
  Timer? countDownTimer;

  late QuizRound currentRound;
  final List<String> availableCountryCodes = [
    'de',
    'ua',
    'es',
    'fr',
    'it',
    'pl',
  ]; // Add more country codes as necessary
  int correctGuesses = 0;

  void handleAnswer(String countryCode) {
    if (countryCode == currentRound.correctCountryCode) {
      setState(() {
        correctGuesses++;
      });
    } else {
      setState(() {
        duration = max(0, duration - 6);
      });
    }

    // After answering, load next round (you’ll add logic later)
    generateNewRound();
  }

  void generateNewRound() {
    // Randomly pick a correct country
    final random = Random();
    final correctCountryCode =
        availableCountryCodes[random.nextInt(availableCountryCodes.length)];

    // Pick 3 incorrect flags
    List<String> incorrectFlags = List.from(availableCountryCodes)
      ..remove(correctCountryCode); // Remove the correct one from the list

    incorrectFlags.shuffle(random); // Shuffle the list of incorrect options
    incorrectFlags = incorrectFlags.take(3).toList(); // Take the first 3

    // Now combine the correct flag with the 3 incorrect ones
    List<String> allFlags = [correctCountryCode, ...incorrectFlags];

    // Shuffle the combined list of 4 flags
    allFlags.shuffle(random);

    // Create the new QuizRound with shuffled options
    setState(() {
      currentRound = QuizRound(
        correctCountryCode: correctCountryCode,
        options:
            allFlags
                .map((code) => FlagOption(code))
                .toList(), // Convert country codes to FlagOption objects
      );
    });
  }

  void startTimer() {
    countDownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (duration == 0) {
        timer.cancel();
      } else {
        setState(() {
          duration--;
        });
        print('tick timer');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    generateNewRound();
    startTimer();
  }

  @override
  void dispose() {
    countDownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Select a flag'),
      ),
      child: SafeArea(
        child:
            duration == 0
                ? Center(
                  child: Column(
                    children: [
                      Text('Game Over', style: TextStyle(fontSize: 24)),
                      if (correctGuesses > 0)
                        Text('You correctly guessed: $correctGuesses flags!'),
                      CupertinoButton(
                        child: Text('Try Again'),
                        onPressed: () {
                          generateNewRound();
                          duration = 30;
                          correctGuesses = 0;
                          startTimer();
                        },
                      ),
                    ],
                  ),
                )
                : Center(
                  child: Column(
                    children: [
                      Expanded(
                        // Wrap GridView with Expanded
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          padding: EdgeInsets.all(5),
                          children:
                              currentRound.options.map((flagOption) {
                                return Container(
                                  color: Colors.black,
                                  child: CupertinoButton(
                                    child: SvgPicture.asset(
                                      flagOption.assetPath,
                                    ),
                                    onPressed:
                                        () => handleAnswer(flagOption.code),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                      Text("Select: ${currentRound.correctCountryCode}"),
                      Text("Correct Guesses: $correctGuesses"),
                      Text("Duration: $duration"),
                    ],
                  ),
                ),
      ),
    );
  }
}
