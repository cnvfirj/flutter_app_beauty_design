import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';

class HistoryNumber extends StatefulWidget {
  final Pair<double, double> _pair;
  late Pair<double, double> _position;

  HistoryNumber(this._pair) {
    _position = Pair(0, 0);
  }

  @override
  State createState() => StateHistoryNumber();
}

class StateHistoryNumber extends State<HistoryNumber> {
  @override
  Widget build(BuildContext context) {
    double width = widget._pair.first < widget._pair.second
        ? widget._pair.first
        : widget._pair.second;
    double height = widget._pair.first < widget._pair.second
        ? widget._pair.second * BuildCoefficient.H_HISTORY
        : widget._pair.first * BuildCoefficient.H_HISTORY;
    return Positioned(
        // top: widget._position.first,
        bottom: widget._position.first,
        left: widget._position.second,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.purple,
              width: width,
              height: height,
              child: Column(children: [
                GestureDetector(
                  child: Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      width: width,
                      child: Text("List history",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: GlobalColors.COLOR_FONT,
                              decoration: TextDecoration.none,
                              fontSize: widget._pair.second *
                                  BuildCoefficient.WIN_FONT_SIZE))),
                  onPanUpdate: (d) {
                    setState(() {
                      double bottom = widget._position.first - d.delta.dy;
                      double left = widget._position.second + d.delta.dx;
                      widget._position.first = bottom >
                                  -(height * BuildCoefficient.SIDE_SHIFT_WIN) &&
                              bottom < 0
                          ? bottom
                          : widget._position.first;
                      widget._position.second =
                          left > -(width * BuildCoefficient.SIDE_SHIFT_WIN) &&
                                  left < width * BuildCoefficient.SIDE_SHIFT_WIN
                              ? left
                              : widget._position.second;
                    });
                  },
                ),
                Flexible(
                    child: Container(
                  color: Colors.black12,
                ))
              ]),
            )));
  }
}
