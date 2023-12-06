import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _CurrentWord = prefs.getString('ff_CurrentWord') ?? _CurrentWord;
    });
    _safeInit(() {
      _GussedChars = prefs.getStringList('ff_GussedChars') ?? _GussedChars;
    });
    _safeInit(() {
      _Sucess = prefs.getInt('ff_Sucess') ?? _Sucess;
    });
    _safeInit(() {
      _Failers = prefs.getInt('ff_Failers') ?? _Failers;
    });
    _safeInit(() {
      _words = prefs.getStringList('ff_words') ?? _words;
    });
    _safeInit(() {
      _HebWords = prefs.getStringList('ff_HebWords') ?? _HebWords;
    });
    _safeInit(() {
      _idxWord = prefs.getInt('ff_idxWord') ?? _idxWord;
    });
    _safeInit(() {
      _upperLimit = prefs.getInt('ff_upperLimit') ?? _upperLimit;
    });
    _safeInit(() {
      _NumberOfTrying = prefs.getInt('ff_NumberOfTrying') ?? _NumberOfTrying;
    });
    _safeInit(() {
      _langauageApp = prefs.getString('ff_langauageApp') ?? _langauageApp;
    });
    _safeInit(() {
      _languages = prefs.getString('ff_languages') ?? _languages;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _CurrentWord = '';
  String get CurrentWord => _CurrentWord;
  set CurrentWord(String value) {
    _CurrentWord = value;
    prefs.setString('ff_CurrentWord', value);
  }

  List<String> _GussedChars = [];
  List<String> get GussedChars => _GussedChars;
  set GussedChars(List<String> value) {
    _GussedChars = value;
    prefs.setStringList('ff_GussedChars', value);
  }

  void addToGussedChars(String value) {
    _GussedChars.add(value);
    prefs.setStringList('ff_GussedChars', _GussedChars);
  }

  void removeFromGussedChars(String value) {
    _GussedChars.remove(value);
    prefs.setStringList('ff_GussedChars', _GussedChars);
  }

  void removeAtIndexFromGussedChars(int index) {
    _GussedChars.removeAt(index);
    prefs.setStringList('ff_GussedChars', _GussedChars);
  }

  void updateGussedCharsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _GussedChars[index] = updateFn(_GussedChars[index]);
    prefs.setStringList('ff_GussedChars', _GussedChars);
  }

  void insertAtIndexInGussedChars(int index, String value) {
    _GussedChars.insert(index, value);
    prefs.setStringList('ff_GussedChars', _GussedChars);
  }

  int _Sucess = 0;
  int get Sucess => _Sucess;
  set Sucess(int value) {
    _Sucess = value;
    prefs.setInt('ff_Sucess', value);
  }

  int _Failers = 0;
  int get Failers => _Failers;
  set Failers(int value) {
    _Failers = value;
    prefs.setInt('ff_Failers', value);
  }

  List<String> _words = [];
  List<String> get words => _words;
  set words(List<String> value) {
    _words = value;
    prefs.setStringList('ff_words', value);
  }

  void addToWords(String value) {
    _words.add(value);
    prefs.setStringList('ff_words', _words);
  }

  void removeFromWords(String value) {
    _words.remove(value);
    prefs.setStringList('ff_words', _words);
  }

  void removeAtIndexFromWords(int index) {
    _words.removeAt(index);
    prefs.setStringList('ff_words', _words);
  }

  void updateWordsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _words[index] = updateFn(_words[index]);
    prefs.setStringList('ff_words', _words);
  }

  void insertAtIndexInWords(int index, String value) {
    _words.insert(index, value);
    prefs.setStringList('ff_words', _words);
  }

  List<String> _letters = [
    'Q',
    'W',
    'E',
    'R',
    'T',
    'Y',
    'U',
    'I',
    'O',
    'P',
    'A',
    'S',
    'D',
    'F',
    'G',
    'H',
    'J',
    'K',
    'L',
    '',
    'Z',
    'X',
    'C',
    'V',
    'B',
    'N',
    'M',
    '',
    ''
  ];
  List<String> get letters => _letters;
  set letters(List<String> value) {
    _letters = value;
  }

  void addToLetters(String value) {
    _letters.add(value);
  }

  void removeFromLetters(String value) {
    _letters.remove(value);
  }

  void removeAtIndexFromLetters(int index) {
    _letters.removeAt(index);
  }

  void updateLettersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _letters[index] = updateFn(_letters[index]);
  }

  void insertAtIndexInLetters(int index, String value) {
    _letters.insert(index, value);
  }

  List<String> _HebWords = [];
  List<String> get HebWords => _HebWords;
  set HebWords(List<String> value) {
    _HebWords = value;
    prefs.setStringList('ff_HebWords', value);
  }

  void addToHebWords(String value) {
    _HebWords.add(value);
    prefs.setStringList('ff_HebWords', _HebWords);
  }

  void removeFromHebWords(String value) {
    _HebWords.remove(value);
    prefs.setStringList('ff_HebWords', _HebWords);
  }

  void removeAtIndexFromHebWords(int index) {
    _HebWords.removeAt(index);
    prefs.setStringList('ff_HebWords', _HebWords);
  }

  void updateHebWordsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _HebWords[index] = updateFn(_HebWords[index]);
    prefs.setStringList('ff_HebWords', _HebWords);
  }

  void insertAtIndexInHebWords(int index, String value) {
    _HebWords.insert(index, value);
    prefs.setStringList('ff_HebWords', _HebWords);
  }

  List<String> _hebLetters = [
    'פ',
    'ם',
    'ן',
    'ו',
    'ט',
    'א',
    'ר',
    'ק',
    '',
    '',
    'ף',
    'ך',
    'ל',
    'ח',
    'י',
    'ע',
    'כ',
    'ג',
    'ד',
    'ש',
    'ץ',
    'ת',
    'צ',
    'מ',
    'נ',
    'ה',
    'ב',
    'ס',
    'ז'
  ];
  List<String> get hebLetters => _hebLetters;
  set hebLetters(List<String> value) {
    _hebLetters = value;
  }

  void addToHebLetters(String value) {
    _hebLetters.add(value);
  }

  void removeFromHebLetters(String value) {
    _hebLetters.remove(value);
  }

  void removeAtIndexFromHebLetters(int index) {
    _hebLetters.removeAt(index);
  }

  void updateHebLettersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _hebLetters[index] = updateFn(_hebLetters[index]);
  }

  void insertAtIndexInHebLetters(int index, String value) {
    _hebLetters.insert(index, value);
  }

  int _idxWord = 0;
  int get idxWord => _idxWord;
  set idxWord(int value) {
    _idxWord = value;
    prefs.setInt('ff_idxWord', value);
  }

  int _upperLimit = 0;
  int get upperLimit => _upperLimit;
  set upperLimit(int value) {
    _upperLimit = value;
    prefs.setInt('ff_upperLimit', value);
  }

  int _NumberOfTrying = 2;
  int get NumberOfTrying => _NumberOfTrying;
  set NumberOfTrying(int value) {
    _NumberOfTrying = value;
    prefs.setInt('ff_NumberOfTrying', value);
  }

  List<String> _AppleTree = [
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eating-apple-y06a4m/assets/y2xhgx6iy164/Tree_0.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eating-apple-y06a4m/assets/025yr5esbxxv/Tree_1.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eating-apple-y06a4m/assets/g4ygndhncnly/Tree_2.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eating-apple-y06a4m/assets/knuz65yurw7s/Tree_3.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eating-apple-y06a4m/assets/9jxthxuu47pj/Tree_4.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eating-apple-y06a4m/assets/6q1dpi3mhf97/Tree_5.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eating-apple-y06a4m/assets/rroanoqpsjt4/Tree_6.png',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eating-apple-y06a4m/assets/uw8n6767181w/Tree_7.png'
  ];
  List<String> get AppleTree => _AppleTree;
  set AppleTree(List<String> value) {
    _AppleTree = value;
  }

  void addToAppleTree(String value) {
    _AppleTree.add(value);
  }

  void removeFromAppleTree(String value) {
    _AppleTree.remove(value);
  }

  void removeAtIndexFromAppleTree(int index) {
    _AppleTree.removeAt(index);
  }

  void updateAppleTreeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _AppleTree[index] = updateFn(_AppleTree[index]);
  }

  void insertAtIndexInAppleTree(int index, String value) {
    _AppleTree.insert(index, value);
  }

  String _langauageApp = 'en';
  String get langauageApp => _langauageApp;
  set langauageApp(String value) {
    _langauageApp = value;
    prefs.setString('ff_langauageApp', value);
  }

  String _languages = '';
  String get languages => _languages;
  set languages(String value) {
    _languages = value;
    prefs.setString('ff_languages', value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
