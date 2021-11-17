
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/ui/db/commonFloor.dart';

class ItemTtranslate<T extends ExEntity> extends StatefulWidget{

  final T _entity;

  ItemTtranslate({ required T entity}):
  _entity = entity;

  @override
  State createState() =>ItemTranslateState();
}

class ItemTranslateState extends State<ItemTtranslate>{

  @override
  Widget build(BuildContext context) {
    return
      Card(
      child: Center(
        child: Text(widget._entity.number.toString()),
      )
    );
  }
}