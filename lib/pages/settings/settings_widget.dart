import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

    _model.newWordController ??= TextEditingController();
    _model.newWordFocusNode ??= FocusNode();

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
        title: 'Settings',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: true,
              title: Text(
                FFLocalizations.of(context).getText(
                  'ajz37lko' /* Settings */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(),
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'w52ck8d2' /* Number of tries:   */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Flexible(
                                    child: Container(
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
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: FlutterFlowDropDown<String>(
                                        controller:
                                            _model.dropDownValueController ??=
                                                FormFieldController<String>(
                                          _model.dropDownValue ??= FFAppState()
                                              .upperLimit
                                              .toString(),
                                        ),
                                        options: [
                                          FFLocalizations.of(context).getText(
                                            'fepudjje' /* 1 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'ai0n8wo2' /* 2 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'td36l9u5' /* 3 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'k28u63j1' /* 4 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'ju73dztr' /* 5 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            '4zv3l46l' /* 6 */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'hov2vs2i' /* 7 */,
                                          )
                                        ],
                                        onChanged: (val) async {
                                          setState(
                                              () => _model.dropDownValue = val);
                                          FFAppState().update(() {
                                            FFAppState().upperLimit =
                                                functions.stringToInt(
                                                    _model.dropDownValue!);
                                            FFAppState().NumberOfTrying =
                                                FFAppState().upperLimit;
                                          });
                                        },
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 4.0, 4.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                  ),
                                ].addToStart(SizedBox(
                                    width: valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width *
                                      FFAppConstants.startSpacing,
                                  0.3,
                                ))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().update(() {
                                        FFAppState().Sucess = 0;
                                        FFAppState().Failers = 0;
                                        FFAppState().CurrentWord = '';
                                        FFAppState().idxWord = 0;
                                        FFAppState().NumberOfTrying =
                                            FFAppState().upperLimit;
                                      });
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'qbf4drdv' /* Reset */,
                                    ),
                                    options: FFButtonOptions(
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
                                          FFAppConstants.propWidth),
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  Container(
                                    width: functions.sizeOfWidget(
                                        MediaQuery.sizeOf(context).width,
                                        MediaQuery.sizeOf(context).height,
                                        MediaQuery.sizeOf(context).width,
                                        MediaQuery.sizeOf(context).height,
                                        FFAppConstants.propWidth * 1.2),
                                    height: functions.sizeOfWidget(
                                        MediaQuery.sizeOf(context).width,
                                        MediaQuery.sizeOf(context).height,
                                        MediaQuery.sizeOf(context).width,
                                        MediaQuery.sizeOf(context).height,
                                        FFAppConstants.propWidth),
                                    decoration: const BoxDecoration(),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'ax28dmrt' /* English */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                      Switch.adaptive(
                                        value: _model.switchValue ??=
                                            FFAppState().langauageApp != 'en',
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.switchValue = newValue);
                                          if (newValue) {
                                            setAppLanguage(context, 'he');
                                            FFAppState().NumberOfTrying =
                                                FFAppState().upperLimit;
                                            FFAppState().langauageApp = 'he';
                                            FFAppState().enHebFlag = 0;
                                            await action_blocks.updateWord(
                                              context,
                                              wordsTemp: FFAppState().HebWords,
                                            );
                                          } else {
                                            setAppLanguage(context, 'en');
                                            FFAppState().NumberOfTrying =
                                                FFAppState().upperLimit;
                                            FFAppState().langauageApp = 'en';
                                            FFAppState().enHebFlag = 1;
                                            await action_blocks.updateWord(
                                              context,
                                              wordsTemp: FFAppState().words,
                                            );
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'wwl99e8j' /* Hebrew */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ].addToStart(SizedBox(
                                    width: MediaQuery.sizeOf(context).width *
                                        FFAppConstants.startSpacing)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      if (functions.checkAddedWord(
                                          _model.newWordController.text,
                                          FFAppState().langauageApp)) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText:
                                                    'Please enter a correct word',
                                                heText:
                                                    'נא להקליד מילה בעברית תקנית',
                                              )),
                                              content: Text(
                                                  FFLocalizations.of(context)
                                                      .getVariableText(
                                                enText:
                                                    'The words should includ only A-Z a-z charchters',
                                                heText:
                                                    'המילים אמורות להכיל רק אותיות בעברית א-ת',
                                              )),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getVariableText(
                                                    enText: 'Ok',
                                                    heText: 'תודה',
                                                  )),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        if (FFLocalizations.of(context)
                                                .languageCode ==
                                            'en') {
                                          FFAppState().addToWords(
                                              functions.addCorrectWord(_model
                                                  .newWordController.text));
                                        } else {
                                          FFAppState().addToHebWords(
                                              functions.addCorrectWord(_model
                                                  .newWordController.text));
                                        }

                                        await action_blocks.updateWord(
                                          context,
                                          wordsTemp: FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'en'
                                              ? FFAppState().words
                                              : FFAppState().HebWords,
                                        );
                                      }

                                      setState(() {
                                        _model.newWordController?.text = '';
                                      });
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '5btc9a9n' /* Add */,
                                    ),
                                    options: FFButtonOptions(
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
                                          FFAppConstants.propWidth),
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.2,
                                        child: TextFormField(
                                          controller: _model.newWordController,
                                          focusNode: _model.newWordFocusNode,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'tg7edp8m' /* Word to Add... */,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          validator: _model
                                              .newWordControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].addToStart(SizedBox(
                                    width: MediaQuery.sizeOf(context).width *
                                        FFAppConstants.startSpacing)),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Stack(
                                  children: [
                                    Opacity(
                                      opacity:
                                          FFAppState().enHebFlag.toDouble(),
                                      child: Align(
                                        alignment: AlignmentDirectional(
                                            valueOrDefault<double>(
                                              (FFAppState().enHebFlag - 1) * 20,
                                              0.0,
                                            ),
                                            0.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'tiskxogz' /* English */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await action_blocks
                                                          .clearDictionary(
                                                              context);
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.restore_from_trash,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.2,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.4,
                                                  decoration: const BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final words = FFAppState()
                                                          .words
                                                          .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: words.length,
                                                        itemBuilder: (context,
                                                            wordsIndex) {
                                                          final wordsItem =
                                                              words[wordsIndex];
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                FFAppState()
                                                                        .words[
                                                                    wordsIndex],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  FFAppState()
                                                                      .removeAtIndexFromWords(
                                                                          wordsIndex);
                                                                  await action_blocks
                                                                      .updateWord(
                                                                    context,
                                                                    wordsTemp:
                                                                        FFAppState()
                                                                            .words,
                                                                  );
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .restore_from_trash_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: (1 - FFAppState().enHebFlag)
                                          .toDouble(),
                                      child: Align(
                                        alignment: AlignmentDirectional(
                                            valueOrDefault<double>(
                                              FFAppState().enHebFlag * 20,
                                              0.0,
                                            ),
                                            0.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '6xgftx9o' /* Hebrew */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await action_blocks
                                                          .clearDictionary(
                                                              context);
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.restore_from_trash,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.2,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.4,
                                                  decoration: const BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final hebWords =
                                                          FFAppState()
                                                              .HebWords
                                                              .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            hebWords.length,
                                                        itemBuilder: (context,
                                                            hebWordsIndex) {
                                                          final hebWordsItem =
                                                              hebWords[
                                                                  hebWordsIndex];
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                FFAppState()
                                                                        .HebWords[
                                                                    hebWordsIndex],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  FFAppState()
                                                                      .removeAtIndexFromHebWords(
                                                                          hebWordsIndex);
                                                                  await action_blocks
                                                                      .updateWord(
                                                                    context,
                                                                    wordsTemp:
                                                                        FFAppState()
                                                                            .HebWords,
                                                                  );
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .restore_from_trash_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
