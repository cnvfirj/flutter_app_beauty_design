import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/CommonWidget.dart';

CommonParentWidget winGenerator({
  required Widget child,
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
    child: child,
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

typedef SetMassage = Function(String massage);

class WidgetNumberGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: TextGenerator()),
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
}

class TextGenerator extends StatefulWidget {
  late String _massage;
  // final SetMassage _setMassage;
  //
  //
  // TextGenerator({required SetMassage setMassage}):
  // _setMassage = setMassage;

  @override
  State createState() => StateTextGenerator();
}

class StateTextGenerator extends State<TextGenerator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Center(
          child: _text(context)
      ),
    );
  }

  Widget _text(BuildContext context) {
    double size = 30;
    String text = S.maybeOf(context)!.massage_blank_field_generator;

    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: size,

      ),);
  }
}
