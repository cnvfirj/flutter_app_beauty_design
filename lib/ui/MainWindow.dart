
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/ui/exclusionList/widgetExList.dart';
import 'package:flutter_app_beauty_design/ui/generation/widgetGeneration.dart';
import 'package:flutter_app_beauty_design/ui/generationBoundaries/widgetBoundaries.dart';
import 'package:flutter_app_beauty_design/ui/historyGeneration/widgetHistory.dart';
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

  @override
  Widget build(BuildContext context) {
    final Pair<double,double> pair = Pair(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    // final Pair<double,double> pair = Pair(context.size!.width, context.size!.height);
    return Stack(
      children :[
      Scaffold(
          appBar: MainAppBar(pair),
          body: Stack(
            fit:StackFit.loose,
            // mainAxisSize:MainAxisSize.max,
            children: [
              BackgroundMainText(),
              HistoryNumber(pair),
              ListEx(pair),
              BoundariesNumber(pair),
            ],
          )
      ),
        GenerationNumber(pair),
      ],
    );
  }

  /*проверка на сохраненное положение,
  * если его нет то отдаем это*/
  Pair<double, double>_createPositionGenerationWindow(Pair p){
    double side =
    p.first < p.second ? p.first / 2 : p.second / 2;
    return Pair(side / 3, side / 2);
  }

  Pair<double, double>_createPositionHistoryGrneration(Pair p){
    double left = p.first < p.second ?0:p.first/2;
    return Pair(0, 0);
  }

}



