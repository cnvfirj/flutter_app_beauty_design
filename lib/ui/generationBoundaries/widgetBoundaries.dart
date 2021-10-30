import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';

import '../common/CommonWidget.dart';

CommonParentWidget winBoundaries({
  // required Widget child,
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

  return CommonParentWidget(
    id: NamesWidgets.BOUNDARIES,
    child: WidgetNumberBoundaries(),
    bookmark: CommonBookmark(
      isCenter: false,
      text: text,
      size: Pair(width, mainParams.second),
    ),
    mainParams: mainParams,
    widgetParams: Pair(width, height),
    borderShift: Rect.fromLTRB(0, 0, 0, mainParams.second - bottom / 2),
    position: position,
    recovery: recovery,
    color: GlobalColors.COLOR_WIN_BOUND,
  );
}

class WidgetNumberBoundaries extends StatelessWidget {
  final TextEditingController _controllerFrom = TextEditingController();
  final TextEditingController _controllerTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GlobalColors.COLOR_TEXT,
      child: Row(
        children: [
          Expanded(
              child:
                  _InputBoundFields(_controllerFrom, S.maybeOf(context)!.from)),
          Container(
            width: GlobalSizes.DELIMITER,
            color: GlobalColors.COLOR_WIN_BOUND,
          ),
          Expanded(
              child: _InputBoundFields(_controllerTo, S.maybeOf(context)!.to))
        ],
      ),
    );
  }
}

class _InputBoundFields extends StatefulWidget{

  final TextEditingController _controller;
  final String _note;

  _InputBoundFields(this._controller, this._note);

  @override
  State createState() =>_InputBoundFieldsState();
}

class _InputBoundFieldsState extends State<_InputBoundFields> {


  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.symmetric(horizontal: GlobalSizes.HORIZONTAL_PADDING),
        child: TextFormField(
            style: TextStyle(
                fontSize: GlobalSizes.FONT_SIZE,
                color: GlobalColors.CONOR_FIELDS_TEXT),
            decoration: InputDecoration(
              // border: OutlineInputBorder(),
              // hintText: _note,
              labelText: widget._note,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
            ],
            controller: widget._controller,
            enableInteractiveSelection: false));
  }
}
