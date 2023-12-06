import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'he'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? heText = '',
  }) =>
      [enText, heText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'lv0bz6lt': {
      'en': 'Wins: ',
      'he': 'נצחונות: ',
    },
    't6o91i7h': {
      'en': 'Losses: ',
      'he': 'הפסדים: ',
    },
    '7aaypbnk': {
      'en': '',
      'he': '',
    },
    'e1w1agk0': {
      'en': 'Space',
      'he': 'רווח',
    },
    '27srpdvy': {
      'en': 'Home',
      'he': 'בית',
    },
  },
  // settings
  {
    'ajz37lko': {
      'en': 'Setting',
      'he': 'הגדרות',
    },
    'ax28dmrt': {
      'en': 'English',
      'he': 'אנגלית',
    },
    'wwl99e8j': {
      'en': 'Hebrew',
      'he': 'עברית',
    },
    'w52ck8d2': {
      'en': 'Number of trying:  ',
      'he': 'מספר נסיונות',
    },
    'keq0qv9w': {
      'en': '2',
      'he': '2',
    },
    'fepudjje': {
      'en': '1',
      'he': '1',
    },
    'ai0n8wo2': {
      'en': '2',
      'he': '2',
    },
    'td36l9u5': {
      'en': '3',
      'he': '3',
    },
    'k28u63j1': {
      'en': '4',
      'he': '4',
    },
    'ju73dztr': {
      'en': '5',
      'he': '5',
    },
    '4zv3l46l': {
      'en': '6',
      'he': '6',
    },
    'hov2vs2i': {
      'en': '7',
      'he': '7',
    },
    'qqt2ppjt': {
      'en': 'Search for an item...',
      'he': 'מחפש אחר פריט...',
    },
    '5btc9a9n': {
      'en': 'Add Word',
      'he': 'להוסיף מילה',
    },
    'tg7edp8m': {
      'en': 'Word to Add...',
      'he': 'המילה שלהוסיף',
    },
    'tiskxogz': {
      'en': 'English',
      'he': 'אנגלית',
    },
    '6xgftx9o': {
      'en': 'Hebrew',
      'he': 'עברית',
    },
    'mjyliaka': {
      'en': 'Home',
      'he': 'בית',
    },
  },
  // Success
  {
    'nqmdbgxo': {
      'en': 'Congrats!',
      'he': 'כל הכבוד!',
    },
    'pjxq6z4d': {
      'en': 'Great!!! Moving to the next word',
      'he': 'מדהים!! קדימה למילה הבאה',
    },
    '4zha3dyf': {
      'en': 'Continue',
      'he': 'להמשיך',
    },
  },
  // Failer
  {
    '12dhkcuo': {
      'en': 'Next Time!',
      'he': 'פעם הבאה!',
    },
    'tgv7lnvq': {
      'en': 'Don\'t give up!!! Moving to the next word',
      'he': 'לא לוותר!!! להמשיך למילה הבאה',
    },
    '4bc7jacb': {
      'en': 'Continue',
      'he': 'להמשיך',
    },
  },
  // Miscellaneous
  {
    'vmmrude6': {
      'en': '',
      'he': '',
    },
    '4q4v254s': {
      'en': '',
      'he': '',
    },
    '3rv7wt8x': {
      'en': '',
      'he': '',
    },
    'kjmzvl6l': {
      'en': '',
      'he': '',
    },
    '71wihs2y': {
      'en': '',
      'he': '',
    },
    'glw8pdpl': {
      'en': '',
      'he': '',
    },
    '5e0dx4s8': {
      'en': '',
      'he': '',
    },
    'qkiq2kxf': {
      'en': '',
      'he': '',
    },
    'yx1kaj3l': {
      'en': '',
      'he': '',
    },
    'ivfgqlu0': {
      'en': '',
      'he': '',
    },
    '4sn4u29h': {
      'en': '',
      'he': '',
    },
    '5mv051cu': {
      'en': '',
      'he': '',
    },
    'oqq6brrf': {
      'en': '',
      'he': '',
    },
    'sewfnmi4': {
      'en': '',
      'he': '',
    },
    '82cs2nls': {
      'en': '',
      'he': '',
    },
    '5u0be02n': {
      'en': '',
      'he': '',
    },
    '4t1uh5qd': {
      'en': '',
      'he': '',
    },
    'rdraay0x': {
      'en': '',
      'he': '',
    },
    '4ypv2jd5': {
      'en': '',
      'he': '',
    },
    '0606e5lo': {
      'en': '',
      'he': '',
    },
    'sey2q4y5': {
      'en': '',
      'he': '',
    },
    'uljm6rn8': {
      'en': '',
      'he': '',
    },
    'xu2xxghb': {
      'en': '',
      'he': '',
    },
  },
].reduce((a, b) => a..addAll(b));
