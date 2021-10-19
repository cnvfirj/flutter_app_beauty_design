import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/CommonWidget.dart';

CommonParentWidget winGenerator({
  required Widget child,
  required Pair<double, double> mainParams,
  required Pair<double, double> position,
  required Pair<double,double> recovery,
  required String text,
  // required StartAnimation startAnimation,
}) {
  double side = mainParams.first < mainParams.second
      ? mainParams.first / 2
      : mainParams.second / 2;
  double bottom = mainParams.first > mainParams.second
      ? mainParams.first*BuildCoefficient.H_BOTTOM_BAR
      : mainParams.second*BuildCoefficient.H_BOTTOM_BAR;
  Rect rect = Rect.fromLTRB(
      0,
      0,
      mainParams.first-side,
      mainParams.second-bottom);
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
    color: Colors.green,
    // startAnimation: startAnimation,
  );
}

