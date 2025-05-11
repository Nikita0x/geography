import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geography/models/quiz_round.dart';
import 'dart:math';
import 'dart:async';
import 'package:geography/data/countries.dart';

class FlagsEuropeScreen extends StatefulWidget {
  const FlagsEuropeScreen({super.key});

  @override
  State<FlagsEuropeScreen> createState() => _FlagsEuropeScreenState();
}

class _FlagsEuropeScreenState extends State<FlagsEuropeScreen> {
  int duration = 60;

  Timer? countDownTimer;
  bool _timerPaused = false;

  String userAnswer = '';
  bool disableButtons = false;

  late QuizRound currentRound;

  int correctGuesses = 0;

  void handleAnswer(String countryCode) async {
    userAnswer = countryCode;
    disableButtons = true;
    pauseTimer();

    if (userAnswer == currentRound.correctCountry.code) {
      setState(() {
        correctGuesses++;
      });
    } else {
      setState(() {
        duration = max(0, duration - 6);
      });
    }

    await Future.delayed(Duration(milliseconds: 1800), () {
      generateNewRound();
      userAnswer = '';
      disableButtons = false;
      resumeTimer();
    });
  }

  void generateNewRound() {
    final random = Random();

    final correctCountry =
        europeanCountries[random.nextInt(europeanCountries.length)];

    final incorrectCountries =
        (List<Country>.from(europeanCountries)
              ..remove(correctCountry)
              ..shuffle(random))
            .take(3)
            .toList();

    final allOptions = [correctCountry, ...incorrectCountries]..shuffle(random);

    setState(() {
      currentRound = QuizRound(
        correctCountry: correctCountry, // Passing the code instead of object
        options: allOptions,
      );
    });
  }

  void startTimer() {
    countDownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted || _timerPaused) {
        return; // Skip tick when paused
      }

      if (duration <= 0) {
        timer.cancel();
      } else {
        setState(() => duration--);
      }
    });
  }

  void pauseTimer() {
    if (!_timerPaused) {
      _timerPaused = true;
      countDownTimer?.cancel();
    }
  }

  void resumeTimer() {
    if (_timerPaused) {
      _timerPaused = false;
      startTimer(); // Restart with remaining duration
    }
  }

  Color? getColorButton(String countryCode) {
    if (disableButtons) {
      // If user selected this country and it's correct
      if (userAnswer == countryCode &&
          countryCode == currentRound.correctCountry.code) {
        return Colors.green;
      }
      // If this is the correct country (highlight for reference)
      else if (countryCode == currentRound.correctCountry.code) {
        return Colors.green;
      }
      // If user selected this country and it's wrong
      else if (userAnswer == countryCode) {
        return Colors.red;
      }
    }
    return null; // Default color when not disabled or not relevant
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
      navigationBar: const CupertinoNavigationBar(middle: Text('Europe')),
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
                              currentRound.options.map((item) {
                                return Card(
                                  elevation: 5,
                                  child: CupertinoButton(
                                    color: getColorButton(item.code),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: SvgPicture.asset(
                                        item.svgPath,
                                        height: 110,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (!disableButtons) {
                                        handleAnswer(item.code);
                                      }
                                    },
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                      Text(
                        currentRound.correctCountry.name,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text("Correct Guesses: $correctGuesses"),
                      Text("Duration: $duration"),
                      Text("Answered?: $userAnswer"),
                    ],
                  ),
                ),
      ),
    );
  }
}
