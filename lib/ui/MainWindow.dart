
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/CommonWidget.dart';
import 'package:flutter_app_beauty_design/ui/exclusionList/widgetExList.dart' as excludes;
import 'package:flutter_app_beauty_design/ui/generation/widgetGeneration.dart' as generator;
import 'package:flutter_app_beauty_design/ui/generationBoundaries/widgetBoundaries.dart' as boundaries;
import 'package:flutter_app_beauty_design/ui/historyGeneration/widgetHistory.dart' as history;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'mainWidget/window.dart';


class MainApp extends StatelessWidget{

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
      home: StateMainWindow (),
    );
  }
}

class StateMainWindow extends StatelessWidget{

  late List<CommonParentWidget> _children;

  @override
  Widget build(BuildContext context) {

    final Pair<double,double> pair = Pair(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    // final Pair<double,double> pair = Pair(context.size!.width, context.size!.height);
    _readyChildren(pair,context);

     return Scaffold(
          appBar: MainAppBar(pair:pair,actionButton: _actionAppBarButton,),
          body: Container(
          child: Stack(
          children:[
            BackgroundMainText(),
          Stack(
          fit:StackFit.loose,
            children: _children,
          )
          ])));
  }

  void _readyChildren(Pair<double, double> params, BuildContext context){
    _children = [
      _history(params, context),
      _excludes(params,context),
      _boundaries(params, context),
      _generation(params, context)
    ];
  }

  void _actionAppBarButton(int index){
    for(CommonParentWidget w in _children){
      w.recovery();
    }
  }

  CommonParentWidget _generation(Pair<double, double> params, BuildContext context){
    Widget child = Container(color: Colors.black12,);
    Pair<double,double>position = _startPositionGenerate(params);
    Pair<double,double>recovery = position.clone();
    return generator.winGenerator(
        child: child,
        mainParams: params,
        position: position,
        recovery: recovery,
        text: S.maybeOf(context)!.widget_generator
    );
  }

  CommonParentWidget _history(Pair<double, double> params, BuildContext context){
    Widget child = Container(color: Colors.black12,);
    Pair<double,double>position = _startPositionHistory(params);
    Pair<double,double>recovery = position.clone();
    return history.winHistory(
        child: child,
        mainParams: params,
        position: position,
        recovery: recovery,
        text: S.maybeOf(context)!.widget_history);
  }
  CommonParentWidget _excludes(Pair<double, double> params, BuildContext context){
    Widget child = Container(color: Colors.black12,);
    Pair<double,double>position = _startPositionEx(params);
    Pair<double,double>recovery = position.clone();
    return excludes.winExcludes(
        child: child,
        mainParams: params,
        position: position,
        recovery: recovery,
        text: S.maybeOf(context)!.widget_excluded);
  }

  CommonParentWidget _boundaries(Pair<double, double> params, BuildContext context){
    Widget child = Container(color: Colors.black12,);
    Pair<double,double>position = _startPositionBord(params);
    Pair<double,double>recovery = position.clone();
    return boundaries.winBoundaries(
        child: child,
        mainParams: params,
        position: position,
        recovery: recovery,
        text: S.maybeOf(context)!.widget_boundaries);
  }



  Pair<double,double> _startPositionGenerate(Pair<double,double>params){
    double indent = params.first<params.second?params.first/4:params.second/4;
    return Pair(indent/2,indent);
  }

  Pair<double,double> _startPositionHistory(Pair<double,double>params){
    double appBar = params.first<params.second?params.first*BuildCoefficient.H_APP_BAR:params.second*BuildCoefficient.H_APP_BAR;
    double indent = params.first<params.second?params.second/2-appBar:params.first/2-appBar;
    return  Pair(indent,0);
  }

Pair<double,double>_startPositionEx(Pair<double,double>params){
  double appBar = params.first<params.second?params.first*BuildCoefficient.H_APP_BAR:params.second*BuildCoefficient.H_APP_BAR;
  double height =  params.first>params.second?params.first/4 : params.second/4;
  double indent = params.first<params.second?params.second/2-(appBar+height):params.first/2-(appBar+height);
  return  Pair(indent,0);
  }

  Pair<double,double>_startPositionBord(Pair<double,double>params){
    return  Pair(0,0);
  }



}



