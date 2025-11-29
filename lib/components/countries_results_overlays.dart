import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geography/data/countries.dart';

class CountriesGameOverOverlay extends StatelessWidget {
  const CountriesGameOverOverlay({
    super.key,
    required this.pool,
    required this.guessedCodes,
    required this.totalCountries,
    required this.onPlayAgain,
  });

  final List<Country> pool;
  final Set<String> guessedCodes;
  final int totalCountries;
  final VoidCallback onPlayAgain;

  @override
  Widget build(BuildContext context) {
    final List<Country> guessed =
        pool
            .where((Country country) => guessedCodes.contains(country.code))
            .toList();
    final List<Country> notGuessed =
        pool
            .where((Country country) => !guessedCodes.contains(country.code))
            .toList();

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
                children: <Widget>[
                  const Text(
                    'Game Over',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Guessed: ${guessed.length} / $totalCountries'),
                      Text('Not guessed: ${notGuessed.length}'),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 220,
                        child: Scrollbar(
                          thumbVisibility: true,
                          child: ListView(
                            children: <Widget>[
                              if (guessed.isNotEmpty) ...<Widget>[
                                const Text(
                                  'Guessed countries',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                ...guessed.map(
                                  (Country country) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2,
                                    ),
                                    child: Text(
                                      '${country.name} – ${country.capital}',
                                      style: const TextStyle(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                              if (notGuessed.isNotEmpty) ...<Widget>[
                                const Text(
                                  'Not guessed countries',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                ...notGuessed.map(
                                  (Country country) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2,
                                    ),
                                    child: Text(
                                      '${country.name} – ${country.capital}',
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CupertinoButton.filled(
                    onPressed: onPlayAgain,
                    child: const Text('Play again'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CountriesWellDoneOverlay extends StatelessWidget {
  const CountriesWellDoneOverlay({
    super.key,
    required this.pool,
    required this.guessedCodes,
    required this.totalCountries,
    required this.onPlayAgain,
  });

  final List<Country> pool;
  final Set<String> guessedCodes;
  final int totalCountries;
  final VoidCallback onPlayAgain;

  @override
  Widget build(BuildContext context) {
    final List<Country> guessed =
        pool
            .where((Country country) => guessedCodes.contains(country.code))
            .toList();
    final List<Country> notGuessed =
        pool
            .where((Country country) => !guessedCodes.contains(country.code))
            .toList();

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
                children: <Widget>[
                  const Text(
                    'Well done!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('You completed all European capitals.'),
                      const SizedBox(height: 8),
                      Text('Guessed: ${guessed.length} / $totalCountries'),
                      Text('Not guessed: ${notGuessed.length}'),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 220,
                        child: Scrollbar(
                          thumbVisibility: true,
                          child: ListView(
                            children: <Widget>[
                              if (guessed.isNotEmpty) ...<Widget>[
                                const Text(
                                  'Guessed countries',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                ...guessed.map(
                                  (Country country) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2,
                                    ),
                                    child: Text(
                                      '${country.name} – ${country.capital}',
                                      style: const TextStyle(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                              if (notGuessed.isNotEmpty) ...<Widget>[
                                const Text(
                                  'Not guessed countries',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                ...notGuessed.map(
                                  (Country country) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2,
                                    ),
                                    child: Text(
                                      '${country.name} – ${country.capital}',
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CupertinoButton.filled(
                    onPressed: onPlayAgain,
                    child: const Text('Play again'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
