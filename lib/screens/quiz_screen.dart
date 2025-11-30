import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geography/components/background.dart';
import 'package:geography/models/country.dart';
import 'package:geography/models/quiz_types.dart';
import 'package:signals/signals_flutter.dart';

class QuizScreen extends StatefulWidget {
  final Region region;
  final QuizMode mode;

  const QuizScreen({super.key, required this.region, required this.mode});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with SignalsMixin {
  static const int maxLives = 3;
  static const int roundsCount = 20;

  late final lives = createSignal(maxLives);
  final Set<String> correctAnswers = <String>{};
  final Set<String> wrongAnswers = <String>{};
  late final List<Country> initialCountries;
  int currentRound = 0;
  late Country targetCountry;
  late List<Country> options;
  final Set<int> disabledOptionIndexes = <int>{};
  bool isRoundLocked = false;
  int? correctOptionIndex;

  int get rounds => initialCountries.length;

  @override
  void initState() {
    super.initState();
    initialCountries =
        ([...widget.region.countries]..shuffle()).take(roundsCount).toList();
    _startNewRound();
  }

  void _startNewRound() {
    if (currentRound >= initialCountries.length) {
      disabledOptionIndexes.clear();
      isRoundLocked = false;
      correctOptionIndex = null;
      return;
    }

    final Country target = initialCountries[currentRound];

    // Wrong options from full region pool (not just the 20 selected)
    final List<Country> pool = [...widget.region.countries];
    pool.remove(target);
    pool.shuffle();
    final List<Country> wrongOptions = pool.take(3).toList();
    final List<Country> result = [...wrongOptions, target];
    result.shuffle();

    targetCountry = target;
    options = result;
    disabledOptionIndexes.clear();
    isRoundLocked = false;
    correctOptionIndex = null;
  }

  void _resetGame() {
    lives.value = maxLives;
    setState(() {
      currentRound = 0;
      correctAnswers.clear();
      wrongAnswers.clear();
      disabledOptionIndexes.clear();
      isRoundLocked = false;
      correctOptionIndex = null;
    });
    _startNewRound();
  }

  /// Builds the target widget based on quiz mode.
  Widget _buildTarget() {
    String content;
    double fontSize = 24;

    switch (widget.mode) {
      case QuizMode.flagToCountry:
        content = targetCountry.emoji;
        fontSize = 64;
        break;
      case QuizMode.countryToFlag:
      case QuizMode.countryToCapital:
        content = targetCountry.name;
        break;
      case QuizMode.capitalToCountry:
        content = targetCountry.capital;
        break;
    }

    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24, width: 2),
      ),
      child: Center(
        child: Text(
          content,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  /// Builds the option widget based on quiz mode.
  Widget _buildOption(Country country) {
    switch (widget.mode) {
      case QuizMode.flagToCountry:
      case QuizMode.capitalToCountry:
        return Text(
          country.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        );
      case QuizMode.countryToFlag:
        return Text(
          country.emoji,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 48),
        );
      case QuizMode.countryToCapital:
        return Text(
          country.capital,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('${widget.region.displayName} - ${widget.mode.title}'),
      ),
      child: Stack(
        children: [
          PlaygroundBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                children: [
                  // Header (count, progress bar, hearts)
                  Row(
                    children: [
                      Text(
                        '${correctAnswers.length} / $rounds',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.yellow,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value:
                                rounds == 0
                                    ? 0
                                    : correctAnswers.length / rounds,
                            minHeight: 8,
                            backgroundColor: Colors.white24,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.green,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: List.generate(
                          maxLives,
                          (index) => Icon(
                            index < lives.value
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Target
                  _buildTarget(),

                  const Spacer(),

                  // Options grid
                  GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1.5,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      4,
                      (index) => GestureDetector(
                        onTap: () {
                          if (isRoundLocked) {
                            return;
                          }

                          if (disabledOptionIndexes.contains(index)) {
                            return;
                          }

                          final Country selected = options[index];

                          if (selected == targetCountry) {
                            setState(() {
                              correctAnswers.add(targetCountry.name);
                              isRoundLocked = true;
                              correctOptionIndex = index;
                            });

                            Future.delayed(
                              const Duration(milliseconds: 500),
                              () {
                                if (!mounted) return;
                                setState(() {
                                  currentRound++;
                                  _startNewRound();
                                });
                              },
                            );
                          } else {
                            wrongAnswers.add(selected.name);
                            lives.value--;
                            setState(() {
                              disabledOptionIndexes.add(index);
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                correctOptionIndex != null &&
                                        index == correctOptionIndex
                                    ? Colors.green
                                    : disabledOptionIndexes.contains(index)
                                    ? Colors.red
                                    : Colors.yellow,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black26, width: 1),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Center(child: _buildOption(options[index])),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          if (lives.value == 0)
            _GameOverOverlay(
              correctAnswers: correctAnswers,
              wrongAnswers: wrongAnswers,
              onRestart: _resetGame,
            ),
          if (lives.value > 0 && currentRound >= rounds)
            _GameFinishedOverlay(
              correctAnswers: correctAnswers,
              wrongAnswers: wrongAnswers,
              onRestart: _resetGame,
            ),
        ],
      ),
    );
  }
}

class _GameOverOverlay extends StatelessWidget {
  final Set<String> correctAnswers;
  final Set<String> wrongAnswers;
  final VoidCallback onRestart;

  const _GameOverOverlay({
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Game Over',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Correct: ${correctAnswers.length}',
                style: const TextStyle(color: Colors.greenAccent, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    correctAnswers
                        .map(
                          (name) => Text(
                            name,
                            style: const TextStyle(color: Colors.greenAccent),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 16),
              Text(
                'Wrong: ${wrongAnswers.length}',
                style: const TextStyle(color: Colors.redAccent, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    wrongAnswers
                        .map(
                          (name) => Text(
                            name,
                            style: const TextStyle(color: Colors.redAccent),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onRestart,
                child: const Text('Try again'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Back to modes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GameFinishedOverlay extends StatelessWidget {
  final Set<String> correctAnswers;
  final Set<String> wrongAnswers;
  final VoidCallback onRestart;

  const _GameFinishedOverlay({
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Well done!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'You\'ve finished all rounds.',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Correct: ${correctAnswers.length}',
                style: const TextStyle(color: Colors.greenAccent, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    correctAnswers
                        .map(
                          (name) => Text(
                            name,
                            style: const TextStyle(color: Colors.greenAccent),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 16),
              Text(
                'Wrong: ${wrongAnswers.length}',
                style: const TextStyle(color: Colors.redAccent, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    wrongAnswers
                        .map(
                          (name) => Text(
                            name,
                            style: const TextStyle(color: Colors.redAccent),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onRestart,
                child: const Text('Play again'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Back to modes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
