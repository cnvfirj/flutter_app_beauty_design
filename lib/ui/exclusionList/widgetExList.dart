import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/common/CommonList.dart';
import 'package:flutter_app_beauty_design/ui/exclusionList/actionsExList.dart';
import 'package:provider/provider.dart';

import '../common/CommonWidget.dart';

Widget winExcludes({
  // required Widget child,
  required Pair<double, double> mainParams,
  required Pair<double, double> position,
  required Pair<double, double> recovery,
  required String text,
}) {
  final double height = mainParams.first > mainParams.second
      ? mainParams.first / 4
      : mainParams.second / 4;
  final double width = mainParams.first < mainParams.second
      ? mainParams.first
      : mainParams.second;

  final double bottom = mainParams.first > mainParams.second
      ? mainParams.first * BuildCoefficient.H_BOTTOM_BAR +
      mainParams.second * BuildCoefficient.H_BUK * 8
      : mainParams.second * BuildCoefficient.H_BOTTOM_BAR +
      mainParams.first * BuildCoefficient.H_BUK * 8;

  final double h = mainParams.first > mainParams.second
      ? mainParams.first * BuildCoefficient.H_BUK
      : mainParams.second * BuildCoefficient.H_BUK;

  return WidgetTranslate(
    id: NamesWidgets.EXCLUDES,
    child: WidgetListEx(h),
    bookmark: CommonBookmark(
      isCenter: false,
      text: text,
      size: Pair(width, mainParams.second),
    ),
    // mainParams: mainParams,
    widgetParams: Pair(width, height),
    borderShift: Rect.fromLTRB(0, 0, 0, mainParams.second - bottom / 2),
    position: position,
    recovery: recovery,
    color: GlobalColors.COLOR_WIN_EX,
  );
}

class WidgetListEx extends StatelessWidget {
  final double _heightBottom;

  WidgetListEx(this._heightBottom);

  @override
  Widget build(BuildContext context) {
    return Consumer < PresenterExList > (builder:
        (BuildContext context, PresenterExList presenter, Widget? child){
           return Column(children: [
             Provider<ActionsList>(
               create: (_)=>presenter.actionsList,
               child:  Expanded(
                   child: CommonGridView(
                     columns: 2,
                     axis: Axis.horizontal,
                     marginCol: 0.1,
                     marginRow: 0.1,
                     aspectRatio: 1 / 1,
                   )),),
              Container(
                 // color: GlobalColors.COLOR_WIN_GENERATOR,
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
                                     presenter.manualExcludeEntry();
                                   },
                                   child: Icon(
                                     Icons.add,
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
                                     presenter.clearTable();
                                   },
                                   child: Icon(
                                     Icons.clear,
                                     color: GlobalColors.COLOR_TEXT,
                                   ),
                                 ))),
                       ]))
           ]);
    });
  }
}
