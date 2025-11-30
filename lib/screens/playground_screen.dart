import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:geography/components/background.dart';
import 'package:geography/models/country.dart';
import 'package:signals/signals_flutter.dart';
import 'package:geography/data/countries.dart';

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({super.key});

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> with SignalsMixin {
  late final lives = createSignal(3);
  final correctAnswers = <String>{};
  final wrongAnswers = <String>{};
  final initialCountries =
      ([...europeanCountries]..shuffle()).take(20).toList();
  int currentRound = 0;
  late Country targetCountry;
  late List<Country> options;
  final Set<int> disabledOptionIndexes = <int>{};
  bool isRoundLocked = false;
  int? correctOptionIndex;

  int get rounds => initialCountries.length;

  void _startNewRound() {
    if (currentRound >= initialCountries.length) {
      // No more rounds – just clear disabled state; overlays
      // will be shown based on currentRound and lives.
      disabledOptionIndexes.clear();
      isRoundLocked = false;
      correctOptionIndex = null;
      return;
    }

    // Use a deterministic target for this round so it never repeats.
    final Country target = initialCountries[currentRound];

    // Build options: one correct + three random incorrect.
    final List<Country> pool = [...initialCountries];
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
    lives.value = 3;
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

  @override
  void initState() {
    super.initState();

    _startNewRound();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PlaygroundBackground(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              children: [
                // Header (count, progress bar, hearts)
                Row(
                  children: [
                    Text(
                      '${correctAnswers.length} / $rounds',
                      style: TextStyle(fontSize: 15, color: Colors.yellow),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value:
                              rounds == 0 ? 0 : correctAnswers.length / rounds,
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
                        3,
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
                const SizedBox(height: 16),

                // Target
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white24, width: 2),
                  ),
                  child: Center(
                    // Here we can later swap to an image flag or different label
                    child: Text(
                      targetCountry.emoji,
                      style: const TextStyle(fontSize: 64),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                Expanded(child: Spacer()),
                // Game (grid of flags)
                GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  physics: const NeverScrollableScrollPhysics(), // без скролла
                  shrinkWrap: true, // занять ровно нужную высоту
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

                          Future.delayed(const Duration(milliseconds: 500), () {
                            if (!mounted) return;
                            setState(() {
                              currentRound++;
                              _startNewRound();
                            });
                          });
                        } else {
                          wrongAnswers.add(selected.name);
                          lives.value--;
                          setState(() {
                            disabledOptionIndexes.add(index);
                          });
                        }
                      },
                      child: Container(
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
                          child: Center(
                            // This can be a flag image, emoji, name or capital
                            child: Text(
                              options[index].emoji,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (lives.value == 0)
          GameOverOverlay(
            correctAnswers: correctAnswers,
            wrongAnswers: wrongAnswers,
            onRestart: _resetGame,
          ),
        if (lives.value > 0 && currentRound >= rounds)
          GameFinishedOverlay(
            correctAnswers: correctAnswers,
            wrongAnswers: wrongAnswers,
            onRestart: _resetGame,
          ),
      ],
    );
  }
}

class GameOverOverlay extends StatelessWidget {
  final Set<String> correctAnswers;
  final Set<String> wrongAnswers;
  final VoidCallback onRestart;

  const GameOverOverlay({
    super.key,
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
            ],
          ),
        ),
      ),
    );
  }
}

class GameFinishedOverlay extends StatelessWidget {
  final Set<String> correctAnswers;
  final Set<String> wrongAnswers;
  final VoidCallback onRestart;

  const GameFinishedOverlay({
    super.key,
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
            ],
          ),
        ),
      ),
    );
  }
}
