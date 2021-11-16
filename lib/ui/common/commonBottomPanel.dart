import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/common/InteractionFile.dart';

typedef Tap = Function();

class TwoBottomButtonsPanel extends StatelessWidget {
  final double _heightBottom;
  final Color _color;

  final Tap _one;
  final Tap _two;

  final List<IconData> _icons;

  TwoBottomButtonsPanel(
      {required double heightBottom,
      required Color color,
      required Tap one,
      required Tap two,
      required List<IconData> icons})
      : _heightBottom = heightBottom,
        _color = color,
        _one = one,
        _two = two,
        _icons = icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _heightBottom,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Material(
                    color: _color,
                    child: InkWell(
                      splashColor: Colors.black38,
                      onTap: _one,
                      child: Icon(
                        _icons[0],
                        color: GlobalColors.COLOR_TEXT,
                      ),
                    ))),
            Container(
              width: GlobalSizes.DELIMITER,
              color: GlobalColors.COLOR_BACKGROUND_WIDGET,
            ),
            Expanded(
                child: Material(
                    color: _color,
                    child: InkWell(
                      splashColor: Colors.black38,
                      onTap: _two,
                      child: Icon(
                        _icons[1],
                        color: GlobalColors.COLOR_TEXT,
                      ),
                    ))),
          ]),
    );
  }
}
