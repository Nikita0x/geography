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

// Asian countries

const afghanistan = Country(name: 'Afghanistan', code: 'af', emoji: '🇦🇫');
const armenia = Country(name: 'Armenia', code: 'am', emoji: '🇦🇲');
const azerbaijan = Country(name: 'Azerbaijan', code: 'az', emoji: '🇦🇿');
const bahrain = Country(name: 'Bahrain', code: 'bh', emoji: '🇧🇭');
const bangladesh = Country(name: 'Bangladesh', code: 'bd', emoji: '🇧🇩');
const bhutan = Country(name: 'Bhutan', code: 'bt', emoji: '🇧🇹');
const brunei = Country(name: 'Brunei', code: 'bn', emoji: '🇧🇳');
const cambodia = Country(name: 'Cambodia', code: 'kh', emoji: '🇰🇭');
const china = Country(name: 'China', code: 'cn', emoji: '🇨🇳');
const georgia = Country(name: 'Georgia', code: 'ge', emoji: '🇬🇪');
const india = Country(name: 'India', code: 'in', emoji: '🇮🇳');
const indonesia = Country(name: 'Indonesia', code: 'id', emoji: '🇮🇩');
const iran = Country(name: 'Iran', code: 'ir', emoji: '🇮🇷');
const iraq = Country(name: 'Iraq', code: 'iq', emoji: '🇮🇶');
const israel = Country(name: 'Israel', code: 'il', emoji: '🇮🇱');
const japan = Country(name: 'Japan', code: 'jp', emoji: '🇯🇵');
const jordan = Country(name: 'Jordan', code: 'jo', emoji: '🇯🇴');
const kazakhstan = Country(name: 'Kazakhstan', code: 'kz', emoji: '🇰🇿');
const kuwait = Country(name: 'Kuwait', code: 'kw', emoji: '🇰🇼');
const kyrgyzstan = Country(name: 'Kyrgyzstan', code: 'kg', emoji: '🇰🇬');
const laos = Country(name: 'Laos', code: 'la', emoji: '🇱🇦');
const lebanon = Country(name: 'Lebanon', code: 'lb', emoji: '🇱🇧');
const malaysia = Country(name: 'Malaysia', code: 'my', emoji: '🇲🇾');
const maldives = Country(name: 'Maldives', code: 'mv', emoji: '🇲🇻');
const mongolia = Country(name: 'Mongolia', code: 'mn', emoji: '🇲🇳');
const myanmar = Country(name: 'Myanmar', code: 'mm', emoji: '🇲🇲');
const nepal = Country(name: 'Nepal', code: 'np', emoji: '🇳🇵');
const northKorea = Country(name: 'North Korea', code: 'kp', emoji: '🇰🇵');
const oman = Country(name: 'Oman', code: 'om', emoji: '🇴🇲');
const pakistan = Country(name: 'Pakistan', code: 'pk', emoji: '🇵🇰');
const palestine = Country(name: 'Palestine', code: 'ps', emoji: '🇵🇸');
const philippines = Country(name: 'Philippines', code: 'ph', emoji: '🇵🇭');
const qatar = Country(name: 'Qatar', code: 'qa', emoji: '🇶🇦');
const saudiArabia = Country(name: 'Saudi Arabia', code: 'sa', emoji: '🇸🇦');
const singapore = Country(name: 'Singapore', code: 'sg', emoji: '🇸🇬');
const southKorea = Country(name: 'South Korea', code: 'kr', emoji: '🇰🇷');
const sriLanka = Country(name: 'Sri Lanka', code: 'lk', emoji: '🇱🇰');
const syria = Country(name: 'Syria', code: 'sy', emoji: '🇸🇾');
const taiwan = Country(name: 'Taiwan', code: 'tw', emoji: '🇹🇼');
const tajikistan = Country(name: 'Tajikistan', code: 'tj', emoji: '🇹🇯');
const thailand = Country(name: 'Thailand', code: 'th', emoji: '🇹🇭');
const timorLeste = Country(name: 'Timor-Leste', code: 'tl', emoji: '🇹🇱');
const turkey = Country(name: 'Turkey', code: 'tr', emoji: '🇹🇷');
const turkmenistan = Country(name: 'Turkmenistan', code: 'tm', emoji: '🇹🇲');
const unitedArabEmirates = Country(
  name: 'United Arab Emirates',
  code: 'ae',
  emoji: '🇦🇪',
);
const uzbekistan = Country(name: 'Uzbekistan', code: 'uz', emoji: '🇺🇿');
const vietnam = Country(name: 'Vietnam', code: 'vn', emoji: '🇻🇳');
const yemen = Country(name: 'Yemen', code: 'ye', emoji: '🇾🇪');

List<Country> asianCountries = [
  afghanistan,
  armenia,
  azerbaijan,
  bahrain,
  bangladesh,
  bhutan,
  brunei,
  cambodia,
  china,
  cyprus,
  georgia,
  india,
  indonesia,
  iran,
  iraq,
  israel,
  japan,
  jordan,
  kazakhstan,
  kuwait,
  kyrgyzstan,
  laos,
  lebanon,
  malaysia,
  maldives,
  mongolia,
  myanmar,
  nepal,
  northKorea,
  oman,
  pakistan,
  palestine,
  philippines,
  qatar,
  saudiArabia,
  singapore,
  southKorea,
  sriLanka,
  syria,
  taiwan,
  tajikistan,
  thailand,
  timorLeste,
  turkey,
  turkmenistan,
  unitedArabEmirates,
  uzbekistan,
  vietnam,
  yemen,
];
