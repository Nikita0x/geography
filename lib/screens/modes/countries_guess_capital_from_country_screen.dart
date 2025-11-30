import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geography/components/countries_results_overlays.dart';
import 'package:geography/data/countries.dart';
import 'package:geography/models/country.dart';
import 'package:signals/signals_flutter.dart';

class CountriesGuessCapitalFromCountryScreen extends StatefulWidget {
  const CountriesGuessCapitalFromCountryScreen({super.key});

  @override
  State<CountriesGuessCapitalFromCountryScreen> createState() =>
      _CountriesGuessCapitalFromCountryScreenState();
}

class _CountriesGuessCapitalFromCountryScreenState
    extends State<CountriesGuessCapitalFromCountryScreen>
    with SignalsMixin {
  static const int initialHearts = 3;
  static final int halfEuropeanCountries =
      (europeanCountries.length / 2).round();
  static final int totalEuropeanCountries = halfEuropeanCountries;

  late final hearts = createSignal(initialHearts);
  late final options = createSignal<List<Country>>([]);
  late final correctCountry = createSignal<Country>(europeanCountries.first);
  late final activePool = createSignal<List<Country>>([]);
  late final useFirstHalf = createSignal<bool>(true);
  late final wrongAnswers = createSignal<Set<String>>(<String>{});
  late final roundLocked = createSignal<bool>(false);
  late final answeredCorrect = createSignal<int>(0);
  late final gameCompleted = createSignal<bool>(false);
  late final correctlyGuessedCountries = createSignal<Set<String>>(<String>{});

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    final bool useFirst = useFirstHalf.value;

    final int startIndex =
        useFirst ? 0 : europeanCountries.length - halfEuropeanCountries;
    final List<Country> pool = europeanCountries.sublist(
      startIndex,
      startIndex + halfEuropeanCountries,
    );

    activePool.value = pool;
    useFirstHalf.value = !useFirst;
    answeredCorrect.value = 0;
    gameCompleted.value = false;
    hearts.value = initialHearts;
    correctlyGuessedCountries.value = <String>{};
    _generateRound();
  }

  void _generateRound() {
    final random = Random();
    final shuffled = List<Country>.from(activePool.value)..shuffle(random);

    final List<Country> newOptions = shuffled.take(4).toList();
    options.value = newOptions;
    correctCountry.value = newOptions[random.nextInt(newOptions.length)];
    wrongAnswers.value = <String>{};
    roundLocked.value = false;
  }

  void _handleAnswer(Country selected) {
    if (hearts.value <= 0 || roundLocked.value || gameCompleted.value) {
      return;
    }

    if (wrongAnswers.value.contains(selected.code)) {
      return;
    }

    if (selected == correctCountry.value) {
      final currentCorrect = correctlyGuessedCountries.value;
      final bool isNewCorrect =
          !currentCorrect.contains(correctCountry.value.code);

      if (isNewCorrect) {
        // Удаляем угаданную страну из пула, чтобы её флаг больше не выпадал
        final List<Country> currentPool = activePool.value;
        activePool.value =
            currentPool
                .where(
                  (Country country) =>
                      country.code != correctCountry.value.code,
                )
                .toList();

        correctlyGuessedCountries.value = {
          ...currentCorrect,
          correctCountry.value.code,
        };
        answeredCorrect.value = correctlyGuessedCountries.value.length;
      }

      final nextCount = answeredCorrect.value;

      if (nextCount >= totalEuropeanCountries) {
        answeredCorrect.value = totalEuropeanCountries;
        roundLocked.value = true;
        gameCompleted.value = true;
      } else {
        answeredCorrect.value = nextCount;
        roundLocked.value = true;

        Future.delayed(const Duration(milliseconds: 1000), () {
          if (!mounted || gameCompleted.value) return;
          _generateRound();
        });
      }
    } else {
      if (hearts.value > 0) {
        final current = wrongAnswers.value;
        wrongAnswers.value = {...current, selected.code};
        hearts.value = (hearts.value - 1).clamp(0, initialHearts);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Guess Capital from Country'),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.blue[100],
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Watch((context) {
                    final currentHearts = hearts.value;
                    final progress =
                        answeredCorrect.value / totalEuropeanCountries;

                    return Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: progress.clamp(0, 1),
                                  minHeight: 8,
                                  backgroundColor: Colors.white24,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        Colors.green,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${answeredCorrect.value} / $totalEuropeanCountries',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: List.generate(initialHearts, (index) {
                            final isFilled = index < currentHearts;

                            return Icon(
                              isFilled
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: Colors.red,
                            );
                          }),
                        ),
                      ],
                    );
                  }),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Watch((context) {
                            final currentOptions = options.value;

                            return GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              children: List.generate(currentOptions.length, (
                                index,
                              ) {
                                final country = currentOptions[index];
                                final code = country.code;

                                final isWrong = wrongAnswers.value.contains(
                                  code,
                                );
                                final isCorrect =
                                    roundLocked.value &&
                                    code == correctCountry.value.code;

                                Color? backgroundColor;
                                if (isCorrect) {
                                  backgroundColor = Colors.green;
                                } else if (isWrong) {
                                  backgroundColor = Colors.red;
                                }

                                final bool isDisabled = isWrong || isCorrect;

                                return GestureDetector(
                                  onTap:
                                      isDisabled
                                          ? null
                                          : () => _handleAnswer(country),
                                  child: Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        gradient:
                                            backgroundColor == null
                                                ? const LinearGradient(
                                                  colors: [
                                                    Color(0xFF42A5F5),
                                                    Color(0xFF1976D2),
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                )
                                                : null,
                                        color: backgroundColor,
                                      ),
                                      child: Text(
                                        country.capital,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Watch((context) {
                          final country = correctCountry.value;

                          return Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                country.svgPath,
                                height: 80,
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Watch((context) {
              if (hearts.value > 0) {
                return const SizedBox.shrink();
              }

              final pool = activePool.value;
              final guessedCodes = correctlyGuessedCountries.value;

              return CountriesGameOverOverlay(
                pool: pool,
                guessedCodes: guessedCodes,
                totalCountries: totalEuropeanCountries,
                onPlayAgain: _startNewGame,
              );
            }),
            Watch((context) {
              if (!gameCompleted.value) {
                return const SizedBox.shrink();
              }

              final pool = activePool.value;
              final guessedCodes = correctlyGuessedCountries.value;

              return CountriesWellDoneOverlay(
                pool: pool,
                guessedCodes: guessedCodes,
                totalCountries: totalEuropeanCountries,
                onPlayAgain: _startNewGame,
              );
            }),
          ],
        ),
      ),
    );
  }
}
