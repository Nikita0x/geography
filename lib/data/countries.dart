class Country {
  final String name;
  final String code; // ISO 3166-1
  final String emoji; // Unicode flag emoji
  final String svgPath;

  const Country({required this.name, required this.code, required this.emoji})
    : svgPath = 'assets/flags/$code.svg';
}

// TODO: add more countries
var albania = Country(name: 'Albania', code: 'al', emoji: '🇦🇱');
const andorra = Country(name: 'Andorra', code: 'ad', emoji: '🇦🇩');
const austria = Country(name: 'Austria', code: 'at', emoji: '🇦🇹');
const belarus = Country(name: 'Belarus', code: 'by', emoji: '🇧🇾');
const belgium = Country(name: 'Belgium', code: 'be', emoji: '🇧🇪');
const bosnia = Country(
  name: 'Bosnia and Herzegovina',
  code: 'ba',
  emoji: '🇧🇦',
);
const bulgaria = Country(name: 'Bulgaria', code: 'bg', emoji: '🇧🇬');
const croatia = Country(name: 'Croatia', code: 'hr', emoji: '🇭🇷');
const cyprus = Country(name: 'Cyprus', code: 'cy', emoji: '🇨🇾');
const czechia = Country(name: 'Czech Republic', code: 'cz', emoji: '🇨🇿');
const denmark = Country(name: 'Denmark', code: 'dk', emoji: '🇩🇰');
const estonia = Country(name: 'Estonia', code: 'ee', emoji: '🇪🇪');
const finland = Country(name: 'Finland', code: 'fi', emoji: '🇫🇮');
const france = Country(name: 'France', code: 'fr', emoji: '🇫🇷');
const germany = Country(name: 'Germany', code: 'de', emoji: '🇩🇪');
const greece = Country(name: 'Greece', code: 'gr', emoji: '🇬🇷');
const hungary = Country(name: 'Hungary', code: 'hu', emoji: '🇭🇺');
const iceland = Country(name: 'Iceland', code: 'is', emoji: '🇮🇸');
const ireland = Country(name: 'Ireland', code: 'ie', emoji: '🇮🇪');
const italy = Country(name: 'Italy', code: 'it', emoji: '🇮🇹');
const latvia = Country(name: 'Latvia', code: 'lv', emoji: '🇱🇻');
const liechtenstein = Country(name: 'Liechtenstein', code: 'li', emoji: '🇱🇮');
const lithuania = Country(name: 'Lithuania', code: 'lt', emoji: '🇱🇹');
const luxembourg = Country(name: 'Luxembourg', code: 'lu', emoji: '🇱🇺');
const malta = Country(name: 'Malta', code: 'mt', emoji: '🇲🇹');
const moldova = Country(name: 'Moldova', code: 'md', emoji: '🇲🇩');
const monaco = Country(name: 'Monaco', code: 'mc', emoji: '🇲🇨');
const montenegro = Country(name: 'Montenegro', code: 'me', emoji: '🇲🇪');
const netherlands = Country(name: 'Netherlands', code: 'nl', emoji: '🇳🇱');
const northMacedonia = Country(
  name: 'North Macedonia',
  code: 'mk',
  emoji: '🇲🇰',
);
const norway = Country(name: 'Norway', code: 'no', emoji: '🇳🇴');
const poland = Country(name: 'Poland', code: 'pl', emoji: '🇵🇱');
const portugal = Country(name: 'Portugal', code: 'pt', emoji: '🇵🇹');
const romania = Country(name: 'Romania', code: 'ro', emoji: '🇷🇴');
const russia = Country(name: 'Russia', code: 'ru', emoji: '🇷🇺');
const sanMarino = Country(name: 'San Marino', code: 'sm', emoji: '🇸🇲');
const serbia = Country(name: 'Serbia', code: 'rs', emoji: '🇷🇸');
const slovakia = Country(name: 'Slovakia', code: 'sk', emoji: '🇸🇰');
const slovenia = Country(name: 'Slovenia', code: 'si', emoji: '🇸🇮');
const spain = Country(name: 'Spain', code: 'es', emoji: '🇪🇸');
const sweden = Country(name: 'Sweden', code: 'se', emoji: '🇸🇪');
const switzerland = Country(name: 'Switzerland', code: 'ch', emoji: '🇨🇭');
const ukraine = Country(name: 'Ukraine', code: 'ua', emoji: '🇺🇦');
const unitedKingdom = Country(
  name: 'United Kingdom',
  code: 'gb',
  emoji: '🇬🇧',
);
const vatican = Country(name: 'Vatican City', code: 'va', emoji: '🇻🇦');

// TODO: check and refactor EU countries
List<Country> europeanCountries = [
  albania,
  andorra,
  austria,
  belarus,
  belgium,
  bosnia,
  bulgaria,
  croatia,
  cyprus,
  czechia,
  denmark,
  estonia,
  finland,
  france,
  germany,
  greece,
  hungary,
  iceland,
  ireland,
  italy,
  latvia,
  liechtenstein,
  lithuania,
  luxembourg,
  malta,
  moldova,
  monaco,
  montenegro,
  netherlands,
  northMacedonia,
  norway,
  poland,
  portugal,
  romania,
  russia,
  sanMarino,
  serbia,
  slovakia,
  slovenia,
  spain,
  sweden,
  switzerland,
  ukraine,
  unitedKingdom,
  vatican,
];
