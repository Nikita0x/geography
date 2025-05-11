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

// African Countries
const algeria = Country(name: 'Algeria', code: 'dz', emoji: '🇩🇿');
const angola = Country(name: 'Angola', code: 'ao', emoji: '🇦🇴');
const benin = Country(name: 'Benin', code: 'bj', emoji: '🇧🇯');
const botswana = Country(name: 'Botswana', code: 'bw', emoji: '🇧🇼');
const burkinaFaso = Country(name: 'Burkina Faso', code: 'bf', emoji: '🇧🇫');
const burundi = Country(name: 'Burundi', code: 'bi', emoji: '🇧🇮');
const cameroon = Country(name: 'Cameroon', code: 'cm', emoji: '🇨🇲');
const capeVerde = Country(name: 'Cape Verde', code: 'cv', emoji: '🇨🇻');
const centralAfricanRepublic = Country(
  name: 'Central African Republic',
  code: 'cf',
  emoji: '🇨🇫',
);
const chad = Country(name: 'Chad', code: 'td', emoji: '🇹🇩');
const comoros = Country(name: 'Comoros', code: 'km', emoji: '🇰🇲');
const congo = Country(name: 'Congo', code: 'cg', emoji: '🇨🇬');
const democraticRepublicOfCongo = Country(
  name: 'Democratic Republic of the Congo',
  code: 'cd',
  emoji: '🇨🇩',
);
const coteDIvoire = Country(name: 'Côte d\'Ivoire', code: 'ci', emoji: '🇨🇮');
const djibouti = Country(name: 'Djibouti', code: 'dj', emoji: '🇩🇯');
const egypt = Country(name: 'Egypt', code: 'eg', emoji: '🇪🇬');
const equatorialGuinea = Country(
  name: 'Equatorial Guinea',
  code: 'gq',
  emoji: '🇬🇶',
);
const eritrea = Country(name: 'Eritrea', code: 'er', emoji: '🇪🇷');
const eswatini = Country(name: 'Eswatini', code: 'sz', emoji: '🇸🇿');
const ethiopia = Country(name: 'Ethiopia', code: 'et', emoji: '🇪🇹');
const gabon = Country(name: 'Gabon', code: 'ga', emoji: '🇬🇦');
const gambia = Country(name: 'Gambia', code: 'gm', emoji: '🇬🇲');
const ghana = Country(name: 'Ghana', code: 'gh', emoji: '🇬🇭');
const guinea = Country(name: 'Guinea', code: 'gn', emoji: '🇬🇳');
const guineaBissau = Country(name: 'Guinea-Bissau', code: 'gw', emoji: '🇬🇼');
const kenya = Country(name: 'Kenya', code: 'ke', emoji: '🇰🇪');
const lesotho = Country(name: 'Lesotho', code: 'ls', emoji: '🇱🇸');
const liberia = Country(name: 'Liberia', code: 'lr', emoji: '🇱🇷');
const libya = Country(name: 'Libya', code: 'ly', emoji: '🇱🇾');
const madagascar = Country(name: 'Madagascar', code: 'mg', emoji: '🇲🇬');
const malawi = Country(name: 'Malawi', code: 'mw', emoji: '🇲🇼');
const mali = Country(name: 'Mali', code: 'ml', emoji: '🇲🇱');
const mauritania = Country(name: 'Mauritania', code: 'mr', emoji: '🇲🇷');
const mauritius = Country(name: 'Mauritius', code: 'mu', emoji: '🇲🇺');
const morocco = Country(name: 'Morocco', code: 'ma', emoji: '🇲🇦');
const mozambique = Country(name: 'Mozambique', code: 'mz', emoji: '🇲🇿');
const namibia = Country(name: 'Namibia', code: 'na', emoji: '🇳🇦');
const niger = Country(name: 'Niger', code: 'ne', emoji: '🇳🇪');
const nigeria = Country(name: 'Nigeria', code: 'ng', emoji: '🇳🇬');
const rwanda = Country(name: 'Rwanda', code: 'rw', emoji: '🇷🇼');
const saoTomeAndPrincipe = Country(
  name: 'Sao Tome and Principe',
  code: 'st',
  emoji: '🇸🇹',
);
const senegal = Country(name: 'Senegal', code: 'sn', emoji: '🇸🇳');
const seychelles = Country(name: 'Seychelles', code: 'sc', emoji: '🇸🇨');
const sierraLeone = Country(name: 'Sierra Leone', code: 'sl', emoji: '🇸🇱');
const somalia = Country(name: 'Somalia', code: 'so', emoji: '🇸🇴');
const southAfrica = Country(name: 'South Africa', code: 'za', emoji: '🇿🇦');
const southSudan = Country(name: 'South Sudan', code: 'ss', emoji: '🇸🇸');
const sudan = Country(name: 'Sudan', code: 'sd', emoji: '🇸🇩');
const tanzania = Country(name: 'Tanzania', code: 'tz', emoji: '🇹🇿');
const togo = Country(name: 'Togo', code: 'tg', emoji: '🇹🇬');
const tunisia = Country(name: 'Tunisia', code: 'tn', emoji: '🇹🇳');
const uganda = Country(name: 'Uganda', code: 'ug', emoji: '🇺🇬');
const zambia = Country(name: 'Zambia', code: 'zm', emoji: '🇿🇲');
const zimbabwe = Country(name: 'Zimbabwe', code: 'zw', emoji: '🇿🇼');

// List of all African countries
final List<Country> africanCountries = [
  algeria,
  angola,
  benin,
  botswana,
  burkinaFaso,
  burundi,
  cameroon,
  capeVerde,
  centralAfricanRepublic,
  chad,
  comoros,
  congo,
  democraticRepublicOfCongo,
  coteDIvoire,
  djibouti,
  egypt,
  equatorialGuinea,
  eritrea,
  eswatini,
  ethiopia,
  gabon,
  gambia,
  ghana,
  guinea,
  guineaBissau,
  kenya,
  lesotho,
  liberia,
  libya,
  madagascar,
  malawi,
  mali,
  mauritania,
  mauritius,
  morocco,
  mozambique,
  namibia,
  niger,
  nigeria,
  rwanda,
  saoTomeAndPrincipe,
  senegal,
  seychelles,
  sierraLeone,
  somalia,
  southAfrica,
  southSudan,
  sudan,
  tanzania,
  togo,
  tunisia,
  uganda,
  zambia,
  zimbabwe,
];
