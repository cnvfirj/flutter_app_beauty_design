import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/CommonWidget.dart';

CommonParentWidget winGenerator({
  required Widget child,
  required Pair<double, double>mainParams,
  required Pair<double,double>position,
  required String text
})
{
  double side =  mainParams.first < mainParams.second
      ? mainParams.first / 2
      : mainParams.second / 2;
  return CommonParentWidget(
      child: child,
      bookmark: CommonBookmark(
        isCenter: true,
        text: text,
        size: Pair(side,mainParams.second),
      ),
      mainParams: mainParams,
      widgetParams: Pair(side,side),
      borderShift: mainParams,
      position: position,
      color: Colors.green);
}


