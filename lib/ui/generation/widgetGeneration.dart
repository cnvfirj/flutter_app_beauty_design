import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';

class GenerationNumber extends StatefulWidget {
  final Pair<double, double> _pair;
  final double _side;
  late Pair<double, double> _position;

  GenerationNumber(this._pair)
      : _side =
            _pair.first < _pair.second ? _pair.first / 2 : _pair.second / 2 {
    _position = Pair(_side / 3, _side / 2);
  }

  @override
  State createState() => StateGenerationNumber();
}

class StateGenerationNumber extends State<GenerationNumber> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: widget._position.first,
        left: widget._position.second,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.cyan,
              width: widget._side,
              height: widget._side,
              padding: EdgeInsets.only(top: 10),
              child: Column(children: [
                GestureDetector(
                  onPanUpdate: (d) {
                    setState(() {
                      double top = widget._position.first + d.delta.dy;
                      double left = widget._position.second + d.delta.dx;
                      widget._position.first =
                          top > widget._side / 3 ? top : widget._position.first;
                      widget._position.second = left > 0 && left < widget._side
                          ? left
                          : widget._position.second;
                    });
                  },
                  child: Text(
                    S.maybeOf(context)!.widget_generator,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: GlobalColors.COLOR_FONT,
                        decoration: TextDecoration.none,
                        fontSize: widget._pair.second *
                            BuildCoefficient.WIN_FONT_SIZE),
                  ),
                ),
                /*main generate widget*/
                Flexible(
                    child: Container(
                  color: Colors.black12,
                ))
              ]),
            )));
  }

  void _initPos(BuildContext context) {
    /*проверяем в шаред преф старые настройки и вводим их в пос*/
  }
}
