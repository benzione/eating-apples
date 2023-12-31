import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String printWord(
  String? currentWord,
  List<String>? guessedChars,
  String emptyWord,
) {
  if (currentWord?.isEmpty == true) {
    return emptyWord;
  } else if (guessedChars?.isEmpty == true) {
    return currentWord!.replaceAll(RegExp(r'\w'), '_');
  } else {
    return currentWord!
        .toUpperCase()
        .replaceAll(RegExp(r'[^' + guessedChars!.join() + ']'), '_');
  }
}

bool isMatch(
  String currentWord,
  List<String>? guessedChars,
) {
  if (guessedChars?.isEmpty == true) {
    return false;
  } else {
    return currentWord.trim().isNotEmpty &&
        currentWord
            .toUpperCase()
            .split('')
            .every((char) => guessedChars!.join().contains(char));
  }
}

bool isContained(
  String currentWord,
  String guessedChar,
) {
  return currentWord.trim().isNotEmpty &&
      currentWord.toUpperCase().contains(guessedChar);
}

bool isPressed(
  List<String>? pressedChars,
  String currentChar,
) {
  if (pressedChars?.isEmpty == true) {
    return false;
  } else {
    return pressedChars!.contains(currentChar);
  }
}

int stringToInt(String str) {
  return int.parse(str);
}

String presentCharOnButton(
  String languageApp,
  List<String> engLetters,
  List<String> hebLetters,
  int idxLetter,
) {
  if (languageApp == 'en') {
    return engLetters[idxLetter];
  } else {
    return hebLetters[idxLetter];
  }
}

double sizeOfWidget(
  double screenWidth,
  double screenHeight,
  double propWidth,
  double propHeight,
  double prop,
) {
  if (screenWidth < screenHeight) {
    return propWidth * prop;
  } else {
    return propHeight * prop;
  }
}

bool checkAddedWord(
  String? currentWord,
  String languageApp,
) {
  if (currentWord?.isEmpty == true) {
    return true;
  }
  if (currentWord!.trim().isEmpty == true) {
    return true;
  }
  if (languageApp == 'en') {
    var temp = currentWord!.replaceAll(RegExp(r'[^a-zA-Z ]'), '!>#<@{&');
    return temp.contains('!>#<@{&');
  } else {
    var temp = currentWord!.replaceAll(RegExp(r'[^\u0590-\u05fe ]'), '!>#<@{&');
    return temp.contains('!>#<@{&');
  }
}

String addCorrectWord(String currentWord) {
  return currentWord.trim().replaceAll(RegExp(r' +'), ' ');
}
