import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/CommonWidget.dart';

import '../InteractionFile.dart';
import 'actionsGenerator.dart';

CommonParentWidget winGenerator({
  required Pair<double, double> mainParams,
  required Pair<double, double> position,
  required Pair<double, double> recovery,
  required String text,
}) {
  double side = mainParams.first < mainParams.second
      ? mainParams.first / 2
      : mainParams.second / 2;
  double bottom = mainParams.first > mainParams.second
      ? mainParams.first * BuildCoefficient.H_BOTTOM_BAR
      : mainParams.second * BuildCoefficient.H_BOTTOM_BAR;
  Rect rect =
  Rect.fromLTRB(0, 0, mainParams.first - side, mainParams.second - bottom);
  return CommonParentWidget(
    child: Container(
      color: Colors.white,
      child: WidgetNumberGenerator(MainPresenter.get()),),
    bookmark: CommonBookmark(
      isCenter: true,
      text: text,
      size: Pair(side, mainParams.second),
    ),
    mainParams: mainParams,
    widgetParams: Pair(side, side),
    borderShift: rect,
    position: position,
    recovery: recovery,
    color: GlobalColors.COLOR_WIN_GENERATOR,
    // startAnimation: startAnimation,
  );
}

class WidgetNumberGenerator extends StatelessWidget {

  final PresenterGenerator _presenter;
  late TextGenerator _textGenerator;


  WidgetNumberGenerator(this._presenter){
    _presenter.setShowMassage(_showMassage);
  }

  @override
  Widget build(BuildContext context) {
    _textGenerator = TextGenerator(massage:initStartMassage(context));
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: _textGenerator
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.only(left: 3, bottom: 3),
            child: CircleAvatar(
              backgroundColor: GlobalColors.COLOR_WIN_GENERATOR,
              radius: BuildCoefficient.R_CIRCLE_ANGLES_WID,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.add),
                color: GlobalColors.COLOR_MAIN_FONT,
                onPressed: () {},
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 3, bottom: 3),
            child: CircleAvatar(
              backgroundColor: GlobalColors.COLOR_WIN_GENERATOR,
              radius: BuildCoefficient.R_CIRCLE_ANGLES_WID,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.add),
                color: GlobalColors.COLOR_MAIN_FONT,
                onPressed: () {},
              ),
            ),
          ),
        ])
      ],
    );
  }

  String initStartMassage(BuildContext context){
    return  S.maybeOf(context)!.massage_blank_field_generator;
  }

  void _showMassage(String massage){
    _textGenerator._setText(massage);
  }
}

class TextGenerator extends StatefulWidget {
  String _massage;
  late StateTextGenerator _text;


  TextGenerator({required String massage}):_massage = massage{
    _text = StateTextGenerator();
  }

  @override
  State createState() => _text;

  void _setText(String text){
    _text.setState(
        (){
          _massage = text;
        }
    );
  }
}

class StateTextGenerator extends State<TextGenerator> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Center(
          child: Text(
            widget._massage,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),)
      ),
    );
  }

}
