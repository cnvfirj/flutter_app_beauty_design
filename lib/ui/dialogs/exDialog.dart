import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/common/CommonWidget.dart';
import 'package:flutter_app_beauty_design/ui/common/InteractionFile.dart';
import 'package:provider/provider.dart';


Provider<CommonProvider> dialogAddEx(BuildContext context) {
  final Pair<double, double> params = Pair(
      MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
  double indent =
  params.first < params.second ? params.first / 4 : params.second / 4;
  final Pair<double, double> position =  Pair(indent / 2, indent);

  final double side = params.first < params.second
      ? params.first / 2
      : params.second / 2;
  final double h = params.first > params.second
      ? params.first * BuildCoefficient.H_BUK
      : params.second * BuildCoefficient.H_BUK;
  return Provider<CommonProvider>(
    create: (_) => CommonProvider.inst(),
    child:  WidgetTranslate(
        child: Container(
          width: 120,
          height: 120,
          color: Colors.white,
          child: AddExclude(heightBottom: h,),
        ),
        bookmark: CommonBookmark(
          isCenter: true,
          text: S.maybeOf(context)!.widget_add_exclude,
          size: Pair(side, params.second),
        ),
        widgetParams: Pair(side, side),
        borderShift: Rect.fromLTRB(
            0, 0, params.first - side, params.second - side),
        position: position,
        recovery: position.clone(),
        color: GlobalColors.COLOR_WIN_EX,
        id: NamesWidgets.DIALOG_ADD_EX),
  );

}

typedef ListenValue = Function(String value);

class AddExclude extends StatelessWidget {
  final double _heightBottom;
  String _enterValue = '';

  AddExclude({required double heightBottom}) : _heightBottom = heightBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    //      InputExclude(S.maybeOf(context)!.enter, (value){
    // _enterValue = value;
    // }),
        Container(
          color:Colors.teal
        ),
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
                            Navigator.of(context).pop();
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
                            Navigator.of(context).pop(_enterValue);
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
  }
}

class InputExclude extends StatefulWidget {
  final String _note;
  final ListenValue _listenValue;

  InputExclude(this._note,this._listenValue);

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
