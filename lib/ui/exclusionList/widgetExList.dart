
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';

class ListEx extends StatefulWidget{

  @override
  State createState() =>StateListEx();
}

class StateListEx extends State<ListEx>{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text(S.maybeOf(context)!.background_text,),
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.amber,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.amber
      ),
      // height: 100,
    );
  }
}