import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geography/data/countries.dart';
import 'package:signals/signals_flutter.dart';

class FlagsGuessNameFromFlagsScreen extends StatefulWidget {
  const FlagsGuessNameFromFlagsScreen({super.key});

  @override
  State<FlagsGuessNameFromFlagsScreen> createState() =>
      _FlagsGuessNameFromFlagsScreenState();
}

class _FlagsGuessNameFromFlagsScreenState
    extends State<FlagsGuessNameFromFlagsScreen>
    with SignalsMixin {
  static const int initialHearts = 3;

  late final hearts = createSignal(initialHearts);
  late final options = createSignal<List<Country>>([]);
  late final correctCountry = createSignal<Country>(europeanCountries.first);

  @override
  void initState() {
    super.initState();
    _generateRound();
  }

  void _generateRound() {
    final random = Random();
    final shuffled = List<Country>.from(europeanCountries)..shuffle(random);

    final newOptions = shuffled.take(4).toList();
    options.value = newOptions;
    correctCountry.value = newOptions[random.nextInt(newOptions.length)];
  }

  void _handleAnswer(Country selected) {
    if (hearts.value <= 0) {
      return;
    }

    if (selected == correctCountry.value) {
      _generateRound();
    } else {
      if (hearts.value > 0) {
        hearts.value--;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Guess Name from Flags'),
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

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(initialHearts, (index) {
                        final isFilled = index < currentHearts;

                        return Icon(
                          isFilled ? Icons.favorite : Icons.favorite_outline,
                          color: Colors.red,
                        );
                      }),
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
                                return GestureDetector(
                                  onTap: () => _handleAnswer(country),
                                  child: Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF42A5F5),
                                            Color(0xFF1976D2),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Text(
                                        country.name,
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

              return Positioned.fill(
                child: Container(
                  color: Colors.black54,
                  child: Center(
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 32),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Game Over',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text('Try again?'),
                            const SizedBox(height: 16),
                            CupertinoButton.filled(
                              child: const Text('Play again'),
                              onPressed: () {
                                hearts.value = initialHearts;
                                _generateRound();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
