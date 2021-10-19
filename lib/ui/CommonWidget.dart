import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';

typedef EndAnimation = void Function();

class CommonParentWidget extends StatefulWidget {
  final Widget _child;
  final CommonBookmark _bookmark;
  final Pair<double, double> _mainParams;
  final Pair<double, double> _widgetParams;
  final Rect _borderShift;
  final Pair<double, double> _recovery;
  final Color _color;
  final double _segment;

  Pair<double, double> _position;
  bool _animShift = false;

  late StateCommonParentWidget _state = StateCommonParentWidget();

  CommonParentWidget({
    required Widget child,
    required CommonBookmark bookmark,
    required Pair<double, double> mainParams,
    required Pair<double, double> widgetParams,
    required Rect borderShift,
    required Pair<double, double> position,
    required Pair<double, double> recovery,
    required Color color,
  })  : _child = child,
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
  State createState() => _state;

  void recovery() {
    _state.anim();
  }

}

class StateCommonParentWidget extends State<CommonParentWidget>
    with DragWidget {
  @override
  Widget build(BuildContext context) {
    if (widget._animShift)
      return CommonAnimation(
          endAnimation: () {
              endAnimation();
          },
          child: _clipChild(),
          start: widget._position,
          end: widget._recovery);
    else
      return Positioned(
          top: widget._position.first,
          left: widget._position.second,
          child: _clipChild());
  }

  @override
  void shift(DragUpdateDetails d) {
    double first = widget._position.first + d.delta.dy;
    double second = widget._position.second + d.delta.dx;
    bool state = false;
    if(first>widget._borderShift.top&&first<widget._borderShift.bottom){
         state = true;
    }else first = widget._position.first;
    if(second>widget._borderShift.left&&second<widget._borderShift.right){
      state = true;
    }else second = widget._position.second;
    if(state){
      setState(() {
        widget._position.first = first;
        widget._position.second = second;
      });
    }
  }

  void anim() {
    setState(() {
      widget._animShift = true;
    });
  }

  void endAnimation(){
    setState((){
      widget._position = widget._recovery.clone();
      widget._animShift = false;
    });
  }

  Widget _clipChild() {
    return ClipRRect(
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
            ])));
  }
}

class CommonBookmark extends StatelessWidget {
  final bool _isCenter;
  final String _text;
  final Pair<double, double> _size;

  CommonBookmark(
      {required bool isCenter,
      required String text,
      required Pair<double, double> size})
      : _isCenter = isCenter,
        _text = text,
        _size = size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size.first,
      height: _size.second*BuildCoefficient.H_BUK,
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
      return EdgeInsets.only(top: padding);
    else
      return EdgeInsets.only(top: padding, left: padding*2);
  }
}

class CommonAnimation extends StatefulWidget {
  final Widget _child;
  Pair<double, double> _start;
  Pair<double, double> _end;
  EndAnimation _endAnimation;

  CommonAnimation({
    required Widget child,
    required Pair<double, double> start,
    required Pair<double, double> end,
    required EndAnimation endAnimation,
  })  : _child = child,
        _start = start,
        _end = end,
        _endAnimation = endAnimation;

  @override
  State createState() => StateCommonAnimation();
}

class StateCommonAnimation extends State<CommonAnimation> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: widget._child,
      tween: TweenPair(begin: widget._start, end: widget._end),
      duration: const Duration(milliseconds: 500),
      builder:
          (BuildContext context, Pair<double, double> pair, Widget? child) {
        return Positioned(
          child: child!,
          top: pair.first,
          left: pair.second,
        );
      },
      onEnd: () {
        widget._endAnimation();
      },
    );
  }
}

class TweenPair extends Tween<Pair<double, double>> {
  TweenPair(
      {required Pair<double, double> begin, required Pair<double, double> end})
      : super(begin: begin, end: end);

  @override
  Pair<double, double> lerp(double t) {
    assert(begin != null);
    assert(end != null);
    Pair<double, double> start = begin as Pair<double, double>;
    Pair<double, double> fin = end as Pair<double, double>;
    double first = start.first + (fin.first - start.first) * t;
    double second = start.second + (fin.second - start.second) * t;
    return Pair(first, second);
  }
}
