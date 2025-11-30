import 'package:geography/data/countries.dart';
import 'package:geography/models/country.dart';

enum Region {
  europe('Europe', '🇪🇺'),
  asia('Asia', '🌏'),
  africa('Africa', '🌍');

  final String displayName;
  final String emoji;

  const Region(this.displayName, this.emoji);

  List<Country> get countries {
    switch (this) {
      case Region.europe:
        return europeanCountries;
      case Region.asia:
        return asianCountries;
      case Region.africa:
        return africanCountries;
    }
  }
}

enum QuizMode {
  flagToCountry('Flag → Country', 'Guess the country by its flag'),
  countryToFlag('Country → Flag', 'Guess the flag by country name'),
  countryToCapital('Country → Capital', 'Guess the capital by country name'),
  capitalToCountry('Capital → Country', 'Guess the country by its capital');

  final String title;
  final String description;

  const QuizMode(this.title, this.description);
}
