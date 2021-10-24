import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';

import '../common/CommonWidget.dart';

CommonParentWidget winHistory({
  required Widget child,
  required Pair<double, double>mainParams,
  required Pair<double,double>position,
  required Pair<double,double> recovery,
  required String text,
  // required StartAnimation startAnimation,
})
{
  double height =  mainParams.first > mainParams.second
      ? mainParams.first / 2
      : mainParams.second / 2;
  double width = mainParams.first < mainParams.second?mainParams.first:mainParams.second;
  double step = mainParams.first > mainParams.second
      ? mainParams.first*BuildCoefficient.H_BOTTOM_BAR+mainParams.first*BuildCoefficient.H_BUK*6
      : mainParams.second*BuildCoefficient.H_BOTTOM_BAR+mainParams.first*BuildCoefficient.H_BUK*6;
  return CommonParentWidget(
    id: NamesWidgets.HISTORY,
      child: child,
      bookmark: CommonBookmark(
        isCenter: false,
        text: text,
        size: Pair(width,mainParams.second),
      ),
      mainParams: mainParams,
      widgetParams: Pair(width,height),
      borderShift: Rect.fromLTRB(0,0,0,mainParams.second-step),
      position: position,
    recovery: recovery,
      color: GlobalColors.COLOR_WIN_HIST,
      // startAnimation: startAnimation,
  );
}

