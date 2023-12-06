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
            .split('')
            .every((char) => guessedChars!.join().contains(char));
  }
}

bool isContained(
  String currentWord,
  String guessedChar,
) {
  return currentWord.trim().isNotEmpty && currentWord.contains(guessedChar);
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
