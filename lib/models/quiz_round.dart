import 'package:geography/data/countries.dart';

class QuizRound {
  final Country correctCountry;
  final List<Country> options;

  QuizRound({required this.correctCountry, required this.options});
}
