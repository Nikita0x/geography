class Country {
  final String name;
  final String code; // ISO 3166-1
  final String emoji; // Unicode flag emoji
  final String capital;

  const Country({
    required this.name,
    required this.code,
    required this.emoji,
    required this.capital,
  });

  String get svgPath => 'assets/flags/$code.svg';
}
