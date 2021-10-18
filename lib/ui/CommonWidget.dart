import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';

class CommonParentWidget extends StatefulWidget {
  final Widget _child;
  final CommonBookmark _bookmark;
  final Pair<double, double> _mainParams;
  final Pair<double, double> _widgetParams;
  final Pair<double, double> _borderShift;
  final Pair<double, double> _recovery;
  final Color _color;
  final double _segment;
  Pair<double, double> _position;

  CommonParentWidget({
    required Widget child,
    required CommonBookmark bookmark,
    required Pair<double, double> mainParams,
    required Pair<double, double> widgetParams,
    required Pair<double, double> borderShift,
    required Pair<double, double> position,
    required Pair<double, double> recovery,
    required Color color,
    // required StartAnimation startAnimation
  }) : _child = child,
        _bookmark = bookmark,
        _mainParams = mainParams,
        _widgetParams = widgetParams,
        _borderShift = borderShift,
        _position = position,
        _recovery = recovery,
        _color = color,
  // _startAnimation = startAnimation,
        _segment = mainParams.first > mainParams.second
            ? mainParams.first
            : mainParams.second;

  @override
  State createState() => StateCommonParentWidget();

  void recovery() {
    print('recovery shift ${_position.second}');
    print('recovery rec ${_recovery.second}');
  }
}

class StateCommonParentWidget extends State<CommonParentWidget>
    with DragWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: widget._position.first,
        left: widget._position.second,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                color: widget._color,
                width: widget._widgetParams.first,
                height: widget._widgetParams.second,
                child: Column(children: [
                  GestureDetector(
                    onPanUpdate: (d) {
                      shift(d);
                    },
                    child: widget._bookmark,
                  ),
                  Flexible(child: widget._child),
                ]))));
  }

  @override
  void shift(DragUpdateDetails d) {
    setState(() {
      widget._position.first = widget._position.first + d.delta.dy;
      widget._position.second = widget._position.second + d.delta.dx;
    });
  }
}

class CommonBookmark extends StatelessWidget {
  final bool _isCenter;
  final String _text;
  final Pair<double, double> _size;

  CommonBookmark({required bool isCenter,
    required String text,
    required Pair<double, double> size})
      : _isCenter = isCenter,
        _text = text,
        _size = size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size.first,
      padding: _padding(),
      child: _center(_txt()),
    );
  }

  Widget _txt() {
    return Text(_text,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            color: GlobalColors.COLOR_FONT,
            decoration: TextDecoration.none,
            fontSize: _size.second * BuildCoefficient.WIN_FONT_SIZE));
  }

  Widget _center(Widget widget) {
    if (_isCenter)
      return Center(
        child: widget,
      );
    else
      return widget;
  }

  EdgeInsetsGeometry _padding() {
    double padding = _size.second * BuildCoefficient.H_BUKMARK;
    if (_isCenter)
      return EdgeInsets.only(top: padding, bottom: padding);
    else
      return EdgeInsets.only(top: padding, bottom: padding, left: padding);
  }
}

class CommonAnimation extends StatefulWidget {
  final Widget _child;
  Pair<double, double>_start;
  Pair<double, double>_end;

  CommonAnimation({
    required Widget child,
    required Pair<double, double>start,
    required Pair<double, double>end
  })
      :
        _child = child,
        _start = start,
        _end = end;

  @override
  State createState() => StateCommonAnimation();
}

class StateCommonAnimation extends State<CommonAnimation> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: widget._child,
      tween: Tween<Pair<double,double>>(begin:widget._start,end:widget._end),
      duration: const Duration(milliseconds: 500),
      builder: (_, Pair<double,double> pair, Widget? child) {
        return Positioned(
          child: child!,
          top: pair.first,
          left: pair.second,
        );
      },
    );
  }
}
