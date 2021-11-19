import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/common/commonBottomPanel.dart';
import 'package:flutter_app_beauty_design/ui/common/commonList.dart';
import 'package:flutter_app_beauty_design/ui/db/commonFloor.dart';
import 'package:flutter_app_beauty_design/ui/historyGeneration/actionsHistory.dart';
import 'package:provider/provider.dart';

import '../common/commonWidget.dart';

Widget winHistory({
  required Pair<double, double> mainParams,
  required Pair<double, double> position,
  required Pair<double, double> recovery,
  required String text,
}) {
  final double height = mainParams.first > mainParams.second
      ? mainParams.first / 2
      : mainParams.second / 2;
  final double width = mainParams.first < mainParams.second
      ? mainParams.first
      : mainParams.second;
  final double bottom = mainParams.first > mainParams.second
      ? mainParams.first * BuildCoefficient.H_BOTTOM_BAR +
          mainParams.second * BuildCoefficient.H_BUK * 12
      : mainParams.second * BuildCoefficient.H_BOTTOM_BAR +
          mainParams.first * BuildCoefficient.H_BUK * 12;

  final double h = mainParams.first > mainParams.second
      ? mainParams.first * BuildCoefficient.H_BUK
      : mainParams.second * BuildCoefficient.H_BUK;
  return WidgetTranslate(
    id: NamesWidgets.HISTORY,
    child: WidgetListHist(h),
    bookmark: CommonBookmark(
      isCenter: false,
      text: text,
      size: Pair(width, mainParams.second),
    ),
    widgetParams: Pair(width, height),
    borderShift: Rect.fromLTRB(0, 0, 0, mainParams.second - bottom / 2),
    position: position,
    recovery: recovery,
    color: GlobalColors.COLOR_WIN_HIST,
  );
}

class WidgetListHist extends StatelessWidget {
  final double _heightBottom;

  WidgetListHist(this._heightBottom);

  @override
  Widget build(BuildContext context) {
    return Consumer<PresenterHistory>(
      builder:
          (BuildContext context, PresenterHistory presenter, Widget? child) {
        return Column(
          children: [
            Provider<ActionsList>(
              create: (_) {
                final ActionsList<HistEntity> _actions =
                ActionsList(CommonDatabase.inst().db.numberDao.allNumbersHist());
                presenter.setActionsHist(_actions);
                return _actions;
              },
              child:
              Expanded(
                child: CommonGridView(
                  columns: 6,
                  axis: Axis.vertical,
                  marginCol: 0.1,
                  marginRow: 0.1,
                  aspectRatio: 1 / 1,
                ),
              ),
            ),
            TwoBottomButtonsPanel(
                heightBottom: _heightBottom,
                color: GlobalColors.COLOR_WIN_HIST,
                one: presenter.clearListHistory,
                two: presenter.sortListHistory,
                icons: [
                  CustomIcons.clear,
                  CustomIcons.sort
                ])
          ],
        );
      },
    );
  }
}
