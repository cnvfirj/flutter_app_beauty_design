

import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';

class BoundariesNumber extends StatefulWidget{
  final Pair<double, double> _pair;


  BoundariesNumber(this._pair);

  @override
  State createState() =>StateBoundariesNumber();
}

class StateBoundariesNumber extends State<BoundariesNumber> {

  @override
  Widget build(BuildContext context) {
    double width = widget._pair.first<widget._pair.second?widget._pair.first:widget._pair.second;
    double height = widget._pair.first<widget._pair.second?widget._pair.second/10:widget._pair.first/4.5;
    return Positioned(
        top: 0,
        left: 0,
        child:Container(
          width: width,
          height: height,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Text("Boundaries"),
          ),
          decoration: BoxDecoration(
             border: Border.all(
                color: Colors.brown,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.brown
      ),
      // height: 100,
    )
    );
  }

}