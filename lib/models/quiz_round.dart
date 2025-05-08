class FlagOption {
  final String code; // e.g. 'de'
  final String assetPath; // e.g. 'assets/flags/de.svg'

  FlagOption(this.code) : assetPath = 'assets/flags/$code.svg';
}

class QuizRound {
  final String correctCountryCode;
  final List<FlagOption> options;

  QuizRound({required this.correctCountryCode, required this.options});
}
