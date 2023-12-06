import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/failer/failer_widget.dart';
import '/pages/success/success_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future pressLetterProcess(
  BuildContext context, {
  required int? letterIdx,
  required List<String>? tempLetters,
}) async {
  if (!functions.isPressed(
      FFAppState().GussedChars.toList(), tempLetters![letterIdx!])) {
    if (functions.isContained(
        FFAppState().CurrentWord, tempLetters[letterIdx])) {
      FFAppState().addToGussedChars(tempLetters[letterIdx]);
      if (functions.isMatch(
          FFAppState().CurrentWord, FFAppState().GussedChars.toList())) {
        await action_blocks.nextWord(
          context,
          tempWords: FFLocalizations.of(context).languageCode == 'en'
              ? FFAppState().words
              : FFAppState().HebWords,
        );
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.7,
                child: const SuccessWidget(),
              ),
            );
          },
        );

        FFAppState().Sucess = FFAppState().Sucess + 1;
      } else {
        FFAppState().addToGussedChars(tempLetters[letterIdx]);
      }
    } else {
      FFAppState().NumberOfTrying = FFAppState().NumberOfTrying + -1;
      if (FFAppState().NumberOfTrying <= 0) {
        await action_blocks.nextWord(
          context,
          tempWords: FFLocalizations.of(context).languageCode == 'en'
              ? FFAppState().words
              : FFAppState().HebWords,
        );
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.7,
                child: const FailerWidget(),
              ),
            );
          },
        );

        FFAppState().Failers = FFAppState().Failers + 1;
      } else {
        FFAppState().addToGussedChars(tempLetters[letterIdx]);
      }
    }

    FFAppState().update(() {});
  }
}

Future nextWord(
  BuildContext context, {
  required List<String>? tempWords,
}) async {
  if (tempWords!.length <= (FFAppState().idxWord + 1)) {
    FFAppState().idxWord = FFAppConstants.idxStart;
  } else {
    FFAppState().idxWord = FFAppState().idxWord + 1;
  }

  FFAppState().CurrentWord = tempWords[FFAppState().idxWord];
  FFAppState().NumberOfTrying = FFAppState().upperLimit;
  FFAppState().GussedChars = [];
  FFAppState().addToGussedChars('');
}

Future updateWord(
  BuildContext context, {
  required List<String>? wordsTemp,
}) async {
  FFAppState().idxWord = FFAppConstants.idxStart;
  FFAppState().GussedChars = [];
  if ((wordsTemp != null && wordsTemp.isNotEmpty) == true) {
    FFAppState().CurrentWord = wordsTemp![FFAppState().idxWord];
  } else {
    FFAppState().CurrentWord = '';
  }

  FFAppState().update(() {
    FFAppState().addToGussedChars('');
  });
}
