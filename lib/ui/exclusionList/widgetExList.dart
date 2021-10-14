
import 'package:flutter/material.dart';

class ListEx extends StatefulWidget{

  @override
  State createState() =>StateListEx();
}

class StateListEx extends State<ListEx>{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      height: 100,
    );
  }
}