import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:provider/provider.dart';

import 'InteractionFile.dart';

class CommonBookmark extends StatelessWidget {
  final bool _isCenter;
  final String _text;
  final Pair<double, double> _size;

  CommonBookmark({
    required bool isCenter,
    required String text,
    required Pair<double, double> size,
  })  : _isCenter = isCenter,
        _text = text,
        _size = size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: _size.first,
        height: _size.second * BuildCoefficient.H_BUK,
        padding: _padding(),
        child: _txt());
  }

  Widget _txt() {
    return Text(_text,
        textAlign: _isCenter ? TextAlign.center : TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            color: GlobalColors.COLOR_TEXT,
            decoration: TextDecoration.none,
            fontSize: _size.second * BuildCoefficient.WIN_FONT_SIZE));
  }

  EdgeInsetsGeometry _padding() {
    double padding = _size.second * BuildCoefficient.H_BUKMARK;
    if (_isCenter)
      return EdgeInsets.only(top: padding);
    else
      return EdgeInsets.only(top: padding, left: padding * 2);
  }
}

class WidgetTranslate extends StatefulWidget {
  static final int DURATION_1 = 0;
  static final int DURATION_2 = 500;
  final Widget _child;
  final CommonBookmark _bookmark;
  final Pair<double, double> _widgetParams;
  final Rect _borderShift;
  final Pair<double, double> _recovery;
  final Color _color;
  final NamesWidgets _id;

  Pair<double, double> _position;
  late int _duration = 0;

  WidgetTranslate({
    required Widget child,
    required CommonBookmark bookmark,
    required Pair<double, double> widgetParams,
    required Rect borderShift,
    required Pair<double, double> position,
    required Pair<double, double> recovery,
    required Color color,
    required NamesWidgets id,
  })  : _child = child,
        _bookmark = bookmark,
        _widgetParams = widgetParams,
        _borderShift = borderShift,
        _position = position,
        _recovery = recovery,
        _color = color,
        _id = id;

  @override
  State createState() => StateWidgetTranslate();
}

class StateWidgetTranslate extends State<WidgetTranslate> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder:
        (BuildContext context, CommonProvider provider, Widget? child) {

      provider.observer(() => _animRecovery(), widget._id);
      return AnimatedPositioned(
        top: widget._position.first,
        left: widget._position.second,
        curve: Curves.linear,
        onEnd: () {
          if (widget._duration == WidgetTranslate.DURATION_2) {
            provider.writePosition(widget._id, widget._position);
          }
        },
        duration: Duration(milliseconds: widget._duration),
        child: ClipRRect(
            borderRadius:
                BorderRadius.circular(BuildCoefficient.R_CIRCLE_ANGLES_WID),
            child: Container(
                color: widget._color,
                width: widget._widgetParams.first,
                height: widget._widgetParams.second,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                        onPanUpdate: (d) {
                          _animShift(d);
                        },
                        onPanEnd: (d) {
                          provider.writePosition(widget._id, widget._position);
                        },
                        child: widget._bookmark,
                      ),
                      Flexible(child: widget._child),
                    ]))),
      );
    });
  }

  void _animRecovery() {
    setState(() {
      widget._duration = WidgetTranslate.DURATION_2;
      widget._position = widget._recovery.clone();
    });
  }

  void _animShift(d) {
    double first = widget._position.first + d.delta.dy;
    double second = widget._position.second + d.delta.dx;
    bool state = false;
    if (first > widget._borderShift.top && first < widget._borderShift.bottom) {
      state = true;
    } else
      first = widget._position.first;
    if (second > widget._borderShift.left &&
        second < widget._borderShift.right) {
      state = true;
    } else
      second = widget._position.second;
    if (state) {
      setState(() {
        widget._duration = WidgetTranslate.DURATION_1;
        widget._position.first = first;
        widget._position.second = second;
      });
    }
  }

}
