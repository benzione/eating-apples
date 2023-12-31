import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().idxWord = FFAppConstants.idxStart;
      FFAppState().GussedChars = [];
      FFAppState().NumberOfTrying = FFAppState().upperLimit;
      FFAppState().addToGussedChars('');
      if (FFAppState().langauageApp == 'en') {
        setAppLanguage(context, 'en');
        await action_blocks.updateWord(
          context,
          wordsTemp: FFAppState().words,
        );
      } else {
        setAppLanguage(context, 'he');
        await action_blocks.updateWord(
          context,
          wordsTemp: FFAppState().HebWords,
        );
      }

      FFAppState().update(() {});
      await actions.textToSpeech(
        FFLocalizations.of(context).getVariableText(
          enText: 'Welcome',
          heText: 'ברוכים הבאים',
        ),
        FFAppState().langauageApp,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Title(
        title: 'Home',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: functions.sizeOfWidget(
                              MediaQuery.sizeOf(context).width,
                              MediaQuery.sizeOf(context).height,
                              MediaQuery.sizeOf(context).width,
                              MediaQuery.sizeOf(context).height,
                              FFAppConstants.propWidth * 3),
                          height: functions.sizeOfWidget(
                              MediaQuery.sizeOf(context).width,
                              MediaQuery.sizeOf(context).height,
                              MediaQuery.sizeOf(context).width,
                              MediaQuery.sizeOf(context).height,
                              FFAppConstants.propWidth * 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              FFAppState()
                                  .AppleTree[FFAppState().NumberOfTrying],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          functions.printWord(
                              FFAppState().CurrentWord,
                              FFAppState().GussedChars.toList(),
                              FFLocalizations.of(context).getVariableText(
                                enText: 'Please add words',
                                heText: 'נא להוסיף מילים',
                              )),
                          style: FlutterFlowTheme.of(context)
                              .displayLarge
                              .override(
                                fontFamily: 'Outfit',
                                fontSize: functions.sizeOfWidget(
                                    MediaQuery.sizeOf(context).width,
                                    MediaQuery.sizeOf(context).height,
                                    MediaQuery.sizeOf(context).width,
                                    MediaQuery.sizeOf(context).height,
                                    FFAppConstants.propWidth * 1.3),
                              ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'lv0bz6lt' /* Wins:  */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                  ),
                        ),
                        Text(
                          '${FFAppState().Sucess.toString()}  (--)  ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                  ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            't6o91i7h' /* Losses:  */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                  ),
                        ),
                        Text(
                          FFAppState().Failers.toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 0,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              0),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 1,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              1),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 2,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              2),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 3,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              3),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 4,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              4),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 5,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              5),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 6,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              6),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 7,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              7),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        if (FFAppState().langauageApp == 'en')
                          FFButtonWidget(
                            onPressed: () async {
                              await action_blocks.pressLetterProcess(
                                context,
                                letterIdx: 8,
                                tempLetters:
                                    FFLocalizations.of(context).languageCode ==
                                            'en'
                                        ? FFAppState().letters
                                        : FFAppState().hebLetters,
                              );
                            },
                            text: functions.presentCharOnButton(
                                FFAppState().langauageApp,
                                FFAppState().letters.toList(),
                                FFAppState().hebLetters.toList(),
                                8),
                            options: FFButtonOptions(
                              width: functions.sizeOfWidget(
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  FFAppConstants.propWidth),
                              height: functions.sizeOfWidget(
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  FFAppConstants.propWidth),
                              padding: const EdgeInsets.all(0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        if (FFAppState().langauageApp == 'en')
                          FFButtonWidget(
                            onPressed: () async {
                              await action_blocks.pressLetterProcess(
                                context,
                                letterIdx: 9,
                                tempLetters:
                                    FFLocalizations.of(context).languageCode ==
                                            'en'
                                        ? FFAppState().letters
                                        : FFAppState().hebLetters,
                              );
                            },
                            text: functions.presentCharOnButton(
                                FFAppState().langauageApp,
                                FFAppState().letters.toList(),
                                FFAppState().hebLetters.toList(),
                                9),
                            options: FFButtonOptions(
                              width: functions.sizeOfWidget(
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  FFAppConstants.propWidth),
                              height: functions.sizeOfWidget(
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  FFAppConstants.propWidth),
                              padding: const EdgeInsets.all(0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 10,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              10),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 11,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              11),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 12,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              12),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 13,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              13),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 14,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              14),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 15,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              15),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 16,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              16),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 17,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              17),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 18,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              18),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        if (FFAppState().langauageApp == 'he')
                          FFButtonWidget(
                            onPressed: () async {
                              await action_blocks.pressLetterProcess(
                                context,
                                letterIdx: 19,
                                tempLetters:
                                    FFLocalizations.of(context).languageCode ==
                                            'en'
                                        ? FFAppState().letters
                                        : FFAppState().hebLetters,
                              );
                            },
                            text: functions.presentCharOnButton(
                                FFAppState().langauageApp,
                                FFAppState().letters.toList(),
                                FFAppState().hebLetters.toList(),
                                19),
                            options: FFButtonOptions(
                              width: functions.sizeOfWidget(
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  FFAppConstants.propWidth),
                              height: functions.sizeOfWidget(
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  FFAppConstants.propWidth),
                              padding: const EdgeInsets.all(0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 20,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              20),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 21,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              21),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 22,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              22),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 23,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              23),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 24,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              24),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 25,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              25),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 26,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: functions.presentCharOnButton(
                              FFAppState().langauageApp,
                              FFAppState().letters.toList(),
                              FFAppState().hebLetters.toList(),
                              26),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        if (FFAppState().langauageApp == 'he')
                          FFButtonWidget(
                            onPressed: () async {
                              await action_blocks.pressLetterProcess(
                                context,
                                letterIdx: 27,
                                tempLetters:
                                    FFLocalizations.of(context).languageCode ==
                                            'en'
                                        ? FFAppState().letters
                                        : FFAppState().hebLetters,
                              );
                            },
                            text: functions.presentCharOnButton(
                                FFAppState().langauageApp,
                                FFAppState().letters.toList(),
                                FFAppState().hebLetters.toList(),
                                27),
                            options: FFButtonOptions(
                              width: functions.sizeOfWidget(
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  FFAppConstants.propWidth),
                              height: functions.sizeOfWidget(
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  FFAppConstants.propWidth),
                              padding: const EdgeInsets.all(0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        if (FFAppState().langauageApp == 'he')
                          FFButtonWidget(
                            onPressed: () async {
                              await action_blocks.pressLetterProcess(
                                context,
                                letterIdx: 28,
                                tempLetters:
                                    FFLocalizations.of(context).languageCode ==
                                            'en'
                                        ? FFAppState().letters
                                        : FFAppState().hebLetters,
                              );
                            },
                            text: functions.presentCharOnButton(
                                FFAppState().langauageApp,
                                FFAppState().letters.toList(),
                                FFAppState().hebLetters.toList(),
                                28),
                            options: FFButtonOptions(
                              width: functions.sizeOfWidget(
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  FFAppConstants.propWidth),
                              height: functions.sizeOfWidget(
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  FFAppConstants.propWidth),
                              padding: const EdgeInsets.all(0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'settings',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              '7aaypbnk' /*  */,
                            ),
                            icon: const Icon(
                              Icons.settings_sharp,
                              color: Colors.white,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: functions.sizeOfWidget(
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  FFAppConstants.propWidth),
                              height: functions.sizeOfWidget(
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  MediaQuery.sizeOf(context).width,
                                  MediaQuery.sizeOf(context).height,
                                  FFAppConstants.propWidth),
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle:
                                  FlutterFlowTheme.of(context).displaySmall,
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await action_blocks.pressLetterProcess(
                              context,
                              letterIdx: 29,
                              tempLetters:
                                  FFLocalizations.of(context).languageCode ==
                                          'en'
                                      ? FFAppState().letters
                                      : FFAppState().hebLetters,
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            'e1w1agk0' /* Space */,
                          ),
                          icon: const Icon(
                            Icons.space_bar,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth * 6),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsets.all(0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await actions.textToSpeech(
                              FFAppState().CurrentWord,
                              FFAppState().langauageApp,
                            );
                          },
                          text: '',
                          icon: const Icon(
                            Icons.transcribe_outlined,
                            color: Colors.white,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            width: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            height: functions.sizeOfWidget(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height,
                                FFAppConstants.propWidth),
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle:
                                FlutterFlowTheme.of(context).displaySmall,
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
