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
  );
}

class WidgetNumberGenerator extends StatelessWidget {
  final PresenterGenerator _presenter;
  late TextGenerator _textGenerator;

  WidgetNumberGenerator(this._presenter) {
    _presenter.setShowMassage(_setMassage);
  }

  @override
  Widget build(BuildContext context) {
    _textGenerator = TextGenerator(
      massage: initStartMassage(context),
      presentGenerator: _presenter.presentIdentificator,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
          child: _textGenerator,
          onTap: _tapText,
        )),
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
    _textGenerator._setMassage(massage);
  }

  void _actionGenerate() {
    _textGenerator._setPresent(PresentIdentificator.Progress);
    _presenter.savePresentIdentificator(PresentIdentificator.Progress);
    _presenter.actionGenerate();
  }

  void _actionEx() {
    _textGenerator._setPresent(PresentIdentificator.Text);
    _presenter.savePresentIdentificator(PresentIdentificator.Text);
    _presenter.actionAddEx(_textGenerator._getMassage());
  }

  void _tapText() {
    /*при нажатиии на текстовое поле*/
    /*точнее на контейнер в котором оно находится*/
    /*и не имеет значение что там*/
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
  StateTextGenerator _text;
  PresentIdentificator _presentGenerator;

  TextGenerator(
      {required String massage, required PresentIdentificator presentGenerator})
      : _massage = massage,
        _presentGenerator = presentGenerator,
        _text = StateTextGenerator();

  @override
  State createState() => _text;

  PresentIdentificator selectorText() {
    if (_presentGenerator == PresentIdentificator.Text) {
      _text._selectPresent(PresentIdentificator.Field);
    }
    return _presentGenerator;
  }

  void _setPresent(PresentIdentificator presentGenerator) {
    _text._selectPresent(presentGenerator);
  }

  void _setMassage(String text) {
    _massage = text;
    _setPresent(PresentIdentificator.Text);
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
      child: Center(
          child: _present()
              ? Text(widget._massage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  ))
              : CircularProgressIndicator(
                  color: GlobalColors.COLOR_WIN_GENERATOR,
                )),
    );
  }

  void _selectPresent(PresentIdentificator presentGenerator) {
    setState(() {
      widget._presentGenerator = presentGenerator;
    });
  }

  bool _present() {
    if (widget._presentGenerator == PresentIdentificator.Progress)
      return false;
    else
      return true;
  }
}

// class EditText extends StatefulWidget{
//   final Hide _hide;
//
//
//   EditText({required Hide hide}):
//         _hide = hide;
//
//   @override
//   State createState() =>StateEditText();
// }
// typedef Hide = Function(String text);
//
//
// class StateEditText extends State<EditText>
//     // with WidgetsBindingObserver
// {
//
//   final TextEditingController _controller = TextEditingController();
//   final FocusNode _focus = FocusNode();
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       keyboardType: TextInputType.number,
//       inputFormatters: <TextInputFormatter>[
//         FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
//       ],
//       controller: _controller,
//       enableInteractiveSelection: false,
//       textAlign: TextAlign.center,
//       focusNode: _focus,
//       style: TextStyle(
//         fontSize: 30,
//       ),
//
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     // WidgetsBinding.instance!.addObserver(this);
//     WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
//       FocusScope.of(context).requestFocus(_focus);
//     });
//     _controller.addListener(() {
//          widget._hide(_controller.text);
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _focus.unfocus();
//     super.dispose();
//   }
//
//
// }
