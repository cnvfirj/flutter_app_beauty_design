
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
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
      home: StateMainWindow (),
    );
  }
}


class StateMainWindow extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Stack(
        children: [
          BackgroundMainText(),
           Column(
             mainAxisSize:MainAxisSize.max,
             children: [
               Flexible(child: BoundariesNumber(), fit: FlexFit.tight,flex: 2,),
               SizedBox(height: 5,),
               Flexible(child: ListEx(), fit: FlexFit.tight,flex: 3,),
               SizedBox(height: 5,),
               Flexible(child: GenerationNumber(), fit: FlexFit.tight, flex: 2),
               SizedBox(height: 5,),
               Flexible(child: HistoryNumber(), fit: FlexFit.tight,flex: 5,),
             ],
           )
        ],
      ),
    );
  }

}

