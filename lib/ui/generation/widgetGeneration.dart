import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/common/CommonWidget.dart';
import 'package:provider/provider.dart';

import 'actionsGenerator.dart';

WidgetTranslate winGenerator({
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
  return WidgetTranslate(
      child: Container(
        color: Colors.white,
        child: WidgetNumberGenerator(),
      ),
      bookmark: CommonBookmark(
        isCenter: true,
        text: text,
        size: Pair(side, mainParams.second),
      ),
      widgetParams: Pair(side, side),
      borderShift: Rect.fromLTRB(
          0, 0, mainParams.first - side, mainParams.second - bottom / 2),
      position: position,
      recovery: recovery,
      color: GlobalColors.COLOR_WIN_GENERATOR,
      id: NamesWidgets.GENERATE);
}

class WidgetNumberGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pair<double, double> pair = Pair(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    double h = pair.first > pair.second
        ? pair.first * BuildCoefficient.H_BUK
        : pair.second * BuildCoefficient.H_BUK;

    return Consumer<PresenterGenerator>(builder:
        (BuildContext context, PresenterGenerator presenter, Widget? child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: GestureDetector(
            child: TextGenerator(),
            onTap: _tapText,
          )),
          Container(
              color: GlobalColors.COLOR_WIN_GENERATOR,
              height: h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Material(
                          color: GlobalColors.COLOR_WIN_GENERATOR,
                          child: InkWell(
                            splashColor: Colors.black38,
                            onTap: () {
                              presenter.actionGenerate();
                            },
                            child: Icon(
                              Icons.all_inclusive,
                              color: GlobalColors.COLOR_TEXT,
                            ),
                          ))),
                  Container(
                    width: GlobalSizes.DELIMITER,
                    color: GlobalColors.COLOR_TEXT,
                  ),
                  Expanded(
                      child: Material(
                          color: GlobalColors.COLOR_WIN_GENERATOR,
                          child: InkWell(
                            splashColor: Colors.black38,
                            onTap: () {
                              presenter.actionAddEx();
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

  void _tapText() {
    /*при нажатиии на текстовое поле*/
    /*точнее на контейнер в котором оно находится*/
    /*и не имеет значение что там*/
  }
}

class TextGenerator extends StatefulWidget {
  @override
  State createState() => StateTextGenerator();
}

class StateTextGenerator extends State<TextGenerator> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PresenterGenerator>(builder:
        (BuildContext context, PresenterGenerator presenter, Widget? child) {
      presenter.setSelectorState(_selectPresent);
      return Container(
        padding: EdgeInsets.all(GlobalSizes.HORIZONTAL_PADDING),
        child: Center(
            child: _present(presenter.presentIdentificator)
                ? Text(presenter.getMassage(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: GlobalSizes.FONT_SIZE,
                        color: GlobalColors.CONOR_FIELDS_TEXT))
                : CircularProgressIndicator(
                    color: GlobalColors.COLOR_WIN_GENERATOR,
                  )),
      );
    });
  }

  void _selectPresent(PresentIdentificator presentGenerator) {
    setState(() {});
  }

  bool _present(PresentIdentificator identificator) {
    if (identificator == PresentIdentificator.Progress)
      return false;
    else
      return true;
  }
}
