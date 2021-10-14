
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';

class HistoryNumber extends StatefulWidget{

  @override
  State createState() =>StateHistoryNumber();
}

class StateHistoryNumber extends State<HistoryNumber> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text(S.maybeOf(context)!.background_text,),
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.purpleAccent,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.purpleAccent
      ),
      // height: 100,
    );
  }

}