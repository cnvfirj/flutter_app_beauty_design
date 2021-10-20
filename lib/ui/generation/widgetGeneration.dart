import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      child: WidgetNumberGenerator(MainPresenter.get()),
    ),
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

/*надо при вызове поля ввода показывалась клавиатура,
* а при ее прятаньи, показывался текст с введенным числом*/
class WidgetNumberGenerator extends StatelessWidget {
  final PresenterGenerator _presenter;
  late TextGenerator _textGenerator;

  WidgetNumberGenerator(this._presenter) {
    _presenter.setShowMassage(_setMassage);
  }

  @override
  Widget build(BuildContext context) {
    _textGenerator = TextGenerator(massage: initStartMassage(context),presentGenerator: _presenter.presentIdentificator,);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: GestureDetector(
          child: _textGenerator,
          onTap: _tapText,
        )
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.only(left: 3, bottom: 3),
            child: CircleButton(_actionGenerate, Icon(Icons.add_box_outlined)),
          ),
          Container(
              padding: EdgeInsets.only(right: 3, bottom: 3),
              child: CircleButton(_actionEx, Icon(Icons.add_box_outlined))),
        ])
      ],
    );
  }

  String initStartMassage(BuildContext context) {
    return S.maybeOf(context)!.massage_blank_field_generator;
  }

  /**/
  void _setMassage(String massage) {
    _presenter.savePresentIdentificator(PresentIdentificator.Text);
    _textGenerator._setPresent(PresentIdentificator.Text);
    _textGenerator._setMassage(massage);
  }

  void _actionGenerate() {
    _presenter.savePresentIdentificator(PresentIdentificator.Progress);
    _presenter.actionGenerate();
    _textGenerator._setPresent(PresentIdentificator.Progress);
  }

  void _actionEx() {
    _presenter.actionAddEx(_textGenerator._getMassage());
  }

  void _tapText(){
    _presenter.savePresentIdentificator(_textGenerator.selectorText());
  }

}

typedef Click = Function();

class CircleButton extends StatelessWidget {
  final Click _click;
  final Icon _icon;

  CircleButton(this._click, this._icon);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: GlobalColors.COLOR_WIN_GENERATOR,
      radius: BuildCoefficient.R_CIRCLE_ANGLES_WID,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: _icon,
        color: GlobalColors.COLOR_MAIN_FONT,
        onPressed: _click,
      ),
    );
  }
}

enum PresentIdentificator { Text, Field, Progress }

class TextGenerator extends StatefulWidget {
  String _massage;
  StateTextGenerator _text = StateTextGenerator();
  final TextEditingController _controller = new TextEditingController();
  PresentIdentificator _presentGenerator;

  TextGenerator(
      {required String massage, required PresentIdentificator presentGenerator})
      : _massage = massage,
        _presentGenerator = presentGenerator {
    // print('constructor $_presentGenerator');
    // _controller.text = _massage;
  }

  @override
  State createState() => _text;

  PresentIdentificator selectorText(){
    if(_presentGenerator==PresentIdentificator.Text){
      _text.selectPresent(PresentIdentificator.Field);
    }
    // else if(_presentGenerator==PresentIdentificator.Field){
    //   _text.selectPresent(PresentIdentificator.Text);
    // }
    return _presentGenerator;
  }

  void _setPresent(PresentIdentificator presentGenerator){
    _text.selectPresent(presentGenerator);
  }

  void _setMassage(String text) {
    _controller.text = text;
    _massage = text;
  }

  String _getMassage() {
    return _massage;
  }
}

class StateTextGenerator extends State<TextGenerator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Center(child: _present()),
    );
  }

  void selectPresent(PresentIdentificator presentGenerator){
    setState(() {
      widget._presentGenerator = presentGenerator;
    });
  }

  Widget _present(){
    if(widget._presentGenerator == PresentIdentificator.Field)return _field();
    else if(widget._presentGenerator == PresentIdentificator.Progress)return _progress();
    else return _text();

  }

  Widget _text() {
    return Text(widget._massage,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
        ));
  }

  Widget _field() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
      ],
      controller: widget._controller,
      enableInteractiveSelection: false,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
      ),
    );
  }

  Widget _progress() {
    return CircularProgressIndicator(
      color: GlobalColors.COLOR_WIN_GENERATOR,

    );
  }
}
