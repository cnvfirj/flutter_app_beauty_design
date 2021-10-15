
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';

class ListEx extends StatefulWidget{

  final Pair<double, double> _pair;


  ListEx(this._pair);

  @override
  State createState() =>StateListEx();
}

class StateListEx extends State<ListEx>{

  @override
  Widget build(BuildContext context) {
    double width = widget._pair.first<widget._pair.second?widget._pair.first:widget._pair.second;
    double height = widget._pair.first<widget._pair.second?widget._pair.second/5:widget._pair.first/2;
    return Positioned(
        bottom: widget._pair.second/2,
        left: 0,
        child:Container(
          width: width,
          height: height,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Text("LIst Ex"),
          ),
          decoration: BoxDecoration(
          border: Border.all(
            color: Colors.amber,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.amber
      ),
      // height: 100,
    )
    );
  }
}