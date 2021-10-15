
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';

class HistoryNumber extends StatefulWidget{

  final Pair<double, double> _pair;


  HistoryNumber(this._pair);

  @override
  State createState() =>StateHistoryNumber();
}

class StateHistoryNumber extends State<HistoryNumber> {

  @override
  Widget build(BuildContext context) {
    double width = widget._pair.first<widget._pair.second?widget._pair.first:widget._pair.second;
    double height = widget._pair.first<widget._pair.second?widget._pair.second/2:widget._pair.first/2;
    return Positioned(
        child: Container(
          width: width,
          height: height,
          child: Container(
             width: width,
             height: height,
             margin: EdgeInsets.all(10),
              child: Text("List history"),
          ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.purpleAccent,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.purpleAccent
      ),
      // height: 100,
    )
    );
  }

}