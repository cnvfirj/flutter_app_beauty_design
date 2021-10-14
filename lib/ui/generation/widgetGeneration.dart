

import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';

class GenerationNumber extends StatefulWidget{

  @override
  State createState() =>StateGenerationNumber();
}

class StateGenerationNumber extends State<GenerationNumber> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text(S.maybeOf(context)!.background_text,),
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.cyan,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.cyan
      ),
      // height: 100,
    );
  }

}