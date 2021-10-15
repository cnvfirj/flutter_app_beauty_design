

import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';

class GenerationNumber extends StatefulWidget{
  final Pair<double, double> _pair;

  GenerationNumber(this._pair);

  @override
  State createState() =>StateGenerationNumber();
}

class StateGenerationNumber extends State<GenerationNumber> {

  @override
  Widget build(BuildContext context) {
    double side = widget._pair.first<widget._pair.second?widget._pair.first/2:widget._pair.second/2;
    return Positioned(
      bottom: widget._pair.second-side*1.35,
      right: side-side/2,
      child:Container(
        width: side,
        height: side,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Text("Generation"),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.cyan,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.cyan
      ),
      // height: 100,
    )
    );
  }

}