// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_tts/flutter_tts.dart';

Future<String> textToSpeech(
  String currenWord,
  String language,
) async {
  // Add your function code here!

  // Add your function code here!
  FlutterTts flutterTts = FlutterTts();

  // "en-US"

  await flutterTts.setLanguage(language);
  await flutterTts.speak(currenWord);

  return flutterTts.getLanguages as String;
}
