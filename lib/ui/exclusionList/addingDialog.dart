import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/common/CommonWidget.dart';
import 'package:provider/provider.dart';

import 'actionsExList.dart';

WidgetTranslate winDialogAddEx({
  required Pair<double, double> mainParams,
  required Pair<double, double> position,
  required Pair<double, double> recovery,
  required String text,
}) {
  final double side = mainParams.first < mainParams.second
      ? mainParams.first / 2
      : mainParams.second / 2;

  final double h = mainParams.first > mainParams.second
      ? mainParams.first * BuildCoefficient.H_BUK
      : mainParams.second * BuildCoefficient.H_BUK;
  return WidgetTranslate(
      child: Container(
        color: Colors.white,
        child: AddExclude(h),
      ),
      bookmark: CommonBookmark(
        isCenter: true,
        text: text,
        size: Pair(side, mainParams.second),
      ),
      widgetParams: Pair(side, side),
      borderShift: Rect.fromLTRB(
          0, 0, mainParams.first - side, mainParams.second - side),
      position: position,
      recovery: recovery,
      color: GlobalColors.COLOR_WIN_EX,
      id: NamesWidgets.DIALOG_ADD_EX);
}

typedef ListenValue = Function(String value);

class AddExclude extends StatelessWidget {
  final double _heightBottom;
  String _enterValue = '';

  AddExclude(this._heightBottom);

  @override
  Widget build(BuildContext context) {
    return Consumer<PresenterExList>(builder:
        (BuildContext context, PresenterExList presenter, Widget? child) {
      return Column(
        children: [
          InputExclude(S.maybeOf(context)!.enter, (value) {
            _enterValue = value;
          }),
          Container(
              height: _heightBottom,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Material(
                          color: GlobalColors.COLOR_WIN_EX,
                          child: InkWell(
                            splashColor: Colors.black38,
                            onTap: () {
                              presenter.exit();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: GlobalColors.COLOR_TEXT,
                            ),
                          ))),
                  Container(
                    width: GlobalSizes.DELIMITER,
                    color: GlobalColors.COLOR_BACKGROUND_WIDGET,
                  ),
                  Expanded(
                      child: Material(
                          color: GlobalColors.COLOR_WIN_EX,
                          child: InkWell(
                            splashColor: Colors.black38,
                            onTap: () {
                              presenter.addValueToDB(_enterValue);
                            },
                            child: Icon(
                              Icons.add,
                              color: GlobalColors.COLOR_TEXT,
                            ),
                          ))),
                ],
              ))
        ],
      );
    });
  }
}

class InputExclude extends StatefulWidget {
  final String _note;
  final ListenValue _listenValue;

  InputExclude(this._note, this._listenValue);

  @override
  State createState() => _InputExcludeState();
}

class _InputExcludeState extends State<InputExclude> {
  late TextEditingController _controller;
  late FocusNode _focus;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.symmetric(horizontal: GlobalSizes.HORIZONTAL_PADDING),
        child: TextField(
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
                widget._listenValue(_controller.text);
              }),
            focusNode: _focus,
            enableInteractiveSelection: false));
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focus = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
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

  void _cutEndText() {
    _controller.text = _field().substring(0, _field().length - 1);
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  String _field() {
    return _controller.text;
  }
}
