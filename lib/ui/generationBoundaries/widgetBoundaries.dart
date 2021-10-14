

import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';

class BoundariesNumber extends StatefulWidget{

  @override
  State createState() =>StateBoundariesNumber();
}

class StateBoundariesNumber extends State<BoundariesNumber> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text(S.maybeOf(context)!.background_text,),
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.brown,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.brown
      ),
      // height: 100,
    );
  }

}