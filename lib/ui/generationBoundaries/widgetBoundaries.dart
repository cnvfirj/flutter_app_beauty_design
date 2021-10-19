

import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';

import '../CommonWidget.dart';

CommonParentWidget winBoundaries({
  required Widget child,
  required Pair<double, double>mainParams,
  required Pair<double,double>position,
  required Pair<double,double> recovery,
  required String text,
})
{
  double height =  mainParams.first > mainParams.second
      ? mainParams.first / 7
      : mainParams.second / 7;
  double width = mainParams.first < mainParams.second?mainParams.first:mainParams.second;
  return CommonParentWidget(
    child: child,
    bookmark: CommonBookmark(
      isCenter: false,
      text: text,
      size: Pair(width,mainParams.second),
    ),
    mainParams: mainParams,
    widgetParams: Pair(width,height),
    borderShift: Rect.fromLTRB(0,0,0,0),
    position: position,
    recovery: recovery,
    color: Colors.teal,
  );
}