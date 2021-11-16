import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/generationBoundaries/actionsBoundaries.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/commonWidget.dart';

WidgetTranslate winBoundaries({
  required Pair<double, double> mainParams,
  required Pair<double, double> position,
  required Pair<double, double> recovery,
  required String text,
}) {
  double height = mainParams.first > mainParams.second
      ? mainParams.first / 7
      : mainParams.second / 7;
  double width = mainParams.first < mainParams.second
      ? mainParams.first
      : mainParams.second;
  double bottom = mainParams.first > mainParams.second
      ? mainParams.first * BuildCoefficient.H_BOTTOM_BAR +
          mainParams.second * BuildCoefficient.H_BUK * 4
      : mainParams.second * BuildCoefficient.H_BOTTOM_BAR +
          mainParams.first * BuildCoefficient.H_BUK * 4;

  return WidgetTranslate(
    id: NamesWidgets.BOUNDARIES,
    child: WidgetNumberBoundaries(),
    bookmark: CommonBookmark(
      isCenter: false,
      text: text,
      size: Pair(width, mainParams.second),
    ),
    // mainParams: mainParams,
    widgetParams: Pair(width, height),
    borderShift: Rect.fromLTRB(0, 0, 0, mainParams.second - bottom / 2),
    position: position,
    recovery: recovery,
    color: GlobalColors.COLOR_WIN_BOUND,
  );
}

class WidgetNumberBoundaries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalColors.COLOR_BACKGROUND_WIDGET,
      child: Row(
        children: [
          Expanded(child: InputBoundFields(S.maybeOf(context)!.from)),
          Container(
            width: GlobalSizes.DELIMITER,
            color: GlobalColors.COLOR_WIN_BOUND,
          ),
          Expanded(child: InputBoundFields(S.maybeOf(context)!.to))
        ],
      ),
    );
  }
}

class InputBoundFields extends StatefulWidget {
  final String _note;

  InputBoundFields(this._note);

  @override
  State createState() => _InputBoundFieldsState();
}

class _InputBoundFieldsState extends State<InputBoundFields> {
  late TextEditingController _controller;
  late FocusNode _focus;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder:
        (BuildContext context, PresenterBoundaries presenter, Widget? child) {
      return Container(
          padding:
              EdgeInsets.symmetric(horizontal: GlobalSizes.HORIZONTAL_PADDING),
          child: TextField(
              // initialValue: widget._value,
              style: TextStyle(
                  fontSize: GlobalSizes.FONT_SIZE,
                  color: GlobalColors.COLOR_WIDGET_TEXT),
              decoration: InputDecoration(
                labelText: widget._note,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
              ],
              controller: _controller
                ..addListener(() {
                  _listenController();
                  presenter.setBound(widget._note, _controller.text);
                }),
              focusNode: _focus,
              enableInteractiveSelection: false));
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focus = FocusNode()
      ..addListener(() {
        if (!_focus.hasFocus) _writePref();
      });
    _readPref();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _readPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? text = pref.getString(_getKey());
    if (text != null) _controller.text = text;
  }

  void _writePref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(_getKey(), _controller.text);
  }

  String _getKey() {
    return '_InputBoundFieldsState${widget._note}';
  }

  void _listenController() {
    if (_field().length > 1) {
      if (_field().endsWith('-')) _cutEndText();
      if (_field().length > 11 && _field().startsWith(RegExp(r'[-]')))
        _cutEndText();
      if (_field().length > 10 && !_field().startsWith(RegExp(r'[-]')))
        _cutEndText();
    }
  }

  /*отсекаем последнее введенное значение (
  * это может быть минус и/или большее по длине значение
  * после чего убираем фокусировку с текстового поля.
  * Это убирает клавиатуру.*/
  void _cutEndText() {
    _controller.text = _field().substring(0, _field().length - 1);
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  String _field() {
    return _controller.text;
  }
}
