
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/ui/exclusionList/widgetExList.dart';
import 'package:flutter_app_beauty_design/ui/generation/widgetGeneration.dart' as generator;
import 'package:flutter_app_beauty_design/ui/generationBoundaries/widgetBoundaries.dart';
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
              _history(pair, context),
              ListEx(pair),
              BoundariesNumber(pair),
              _generation(pair, context)
            ],
          )
      ),
      ],
    );
  }

  Widget _generation(Pair<double, double> params, BuildContext context){
    Widget child = Container(color: Colors.black12,);
    Pair<double,double>position = Pair(20, 100);
    return generator.winGenerator(
        child: child,
        mainParams: params,
        position: position,
        text: S.maybeOf(context)!.widget_generator
    );
  }

  Widget _history(Pair<double, double> params, BuildContext context){
    Widget child = Container(color: Colors.black12,);
    Pair<double,double>position = Pair(400, 0);
    return history.winHistory(
        child: child,
        mainParams: params,
        position: position,
        text: S.maybeOf(context)!.widget_history);
  }


}



