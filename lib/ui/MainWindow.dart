import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/common/InteractionFile.dart';
import 'package:flutter_app_beauty_design/ui/exclusionList/actionsExList.dart';

import 'package:flutter_app_beauty_design/ui/exclusionList/widgetExList.dart'
    as excludes;

import 'package:flutter_app_beauty_design/ui/exclusionList/addingDialog.dart'
    as excludeAdd;

import 'package:flutter_app_beauty_design/ui/generation/actionsGenerator.dart';
import 'package:flutter_app_beauty_design/ui/generation/widgetGeneration.dart'
    as generator;
import 'package:flutter_app_beauty_design/ui/generationBoundaries/widgetBoundaries.dart'
    as boundaries;
import 'package:flutter_app_beauty_design/ui/historyGeneration/widgetHistory.dart'
    as history;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'generationBoundaries/actionsBoundaries.dart';
import 'mainWidget/window.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'beauty design',
      // theme: ThemeData(fontFamily: "Monserat"),
      home: MainWindow(),
    );
  }
}

class MainWindow extends StatefulWidget {
  bool _visibleDialogAdd = false;

  @override
  State createState() => StateMainWindow();
}

class StateMainWindow extends State<MainWindow> {
  void _selectorDialogAddEx(bool visible) {
    setState(() {
      widget._visibleDialogAdd = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Pair<double, double> pair = Pair(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return MultiProvider(
        providers: [
          Provider<PresenterGenerator>(
              create: (BuildContext context) =>
                  MainPresenter.inst().context(context).generator()),
          Provider<PresenterBoundaries>(
            create: (_) => MainPresenter.inst().boundaries(),
          ),
          Provider<PresenterExList>(
            create: (_) => MainPresenter.inst()
                .selectorDialogAddEx(_selectorDialogAddEx)
                .ex(),
          ),
          Provider<CommonProvider>(
            create: (_) => CommonProvider.inst(),
          ),
        ],
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: GlobalColors.COLOR_MAIN_FONT,
            extendBody: true,
            appBar: MainAppBar(pair: pair),
            body: Container(
                child: Stack(children: [
              BackgroundMainText(),
              Consumer(builder: (BuildContext context, CommonProvider provider,
                  Widget? child) {
                return Stack(
                  fit: StackFit.loose,
                  children: _checkDialogEx(pair, provider),
                );
              }),
            ]))));
  }

  List<Widget> _checkDialogEx(
      Pair<double, double> params, CommonProvider provider) {
    if (widget._visibleDialogAdd)
      return _widgets(params, provider)
        ..add(_dialogAddEx(
            params,
            context,
            provider.readPosition(NamesWidgets.DIALOG_ADD_EX,
                _startPositionDialogAddEx(params))));
    else
      return _widgets(params, provider);
  }

  List<Widget> _widgets(Pair<double, double> pair, CommonProvider provider) {
    return [
      _history(
          pair,
          context,
          provider.readPosition(
              NamesWidgets.HISTORY, _startPositionHistory(pair))),
      _excludes(pair, context,
          provider.readPosition(NamesWidgets.EXCLUDES, _startPositionEx(pair))),
      _boundaries(
          pair,
          context,
          provider.readPosition(
              NamesWidgets.BOUNDARIES, _startPositionBord(pair))),
      _generation(
          pair,
          context,
          provider.readPosition(
              NamesWidgets.GENERATE, _startPositionGenerate(pair))),
    ];
  }

  Widget _dialogAddEx(Pair<double, double> params, BuildContext context,
      Pair<double, double> position) {
    Pair<double, double> recovery = _startPositionDialogAddEx(params);
    return excludeAdd.winDialogAddEx(
        mainParams: params,
        position: position,
        recovery: recovery,
        text: S.maybeOf(context)!.widget_generator);
  }

  Widget _generation(Pair<double, double> params, BuildContext context,
      Pair<double, double> position) {
    Pair<double, double> recovery = _startPositionGenerate(params);
    return generator.winGenerator(
        mainParams: params,
        position: position,
        recovery: recovery,
        text: S.maybeOf(context)!.widget_generator);
  }

  Widget _history(Pair<double, double> params, BuildContext context,
      Pair<double, double> position) {
    Widget child = Container(
      color: Colors.black12,
    );
    Pair<double, double> recovery = _startPositionHistory(params);
    return history.winHistory(
        child: child,
        mainParams: params,
        position: position,
        recovery: recovery,
        text: S.maybeOf(context)!.widget_history);
  }

  Widget _excludes(Pair<double, double> params, BuildContext context,
      Pair<double, double> position) {
    Pair<double, double> recovery = _startPositionEx(params);
    return excludes.winExcludes(
        mainParams: params,
        position: position,
        recovery: recovery,
        text: S.maybeOf(context)!.widget_excluded);
  }

  Widget _boundaries(Pair<double, double> params, BuildContext context,
      Pair<double, double> position) {
    Pair<double, double> recovery = _startPositionBord(params);
    return boundaries.winBoundaries(
        mainParams: params,
        position: position,
        recovery: recovery,
        text: S.maybeOf(context)!.widget_boundaries);
  }

  Pair<double, double> _startPositionDialogAddEx(Pair<double, double> params) {
    double indent =
        params.first < params.second ? params.first / 4 : params.second / 4;
    double bottom = params.first < params.second
        ? params.second - params.first / 4
        : params.first - params.second / 4;
    return Pair(bottom, indent);
  }

  Pair<double, double> _startPositionGenerate(Pair<double, double> params) {
    double indent =
        params.first < params.second ? params.first / 4 : params.second / 4;
    return Pair(indent / 2, indent);
  }

  Pair<double, double> _startPositionHistory(Pair<double, double> params) {
    double appBar = params.first < params.second
        ? params.first * BuildCoefficient.H_APP_BAR
        : params.second * BuildCoefficient.H_APP_BAR;
    double indent = params.first < params.second
        ? params.second / 2 - appBar
        : params.first / 2 - appBar;
    return Pair(indent, 0);
  }

  Pair<double, double> _startPositionEx(Pair<double, double> params) {
    double appBar = params.first < params.second
        ? params.first * BuildCoefficient.H_APP_BAR
        : params.second * BuildCoefficient.H_APP_BAR;
    double height =
        params.first > params.second ? params.first / 4 : params.second / 4;
    double indent = params.first < params.second
        ? params.second / 2 - (appBar + height)
        : params.first / 2 - (appBar + height);
    return Pair(indent, 0);
  }

  Pair<double, double> _startPositionBord(Pair<double, double> params) {
    return Pair(0, 0);
  }
}
