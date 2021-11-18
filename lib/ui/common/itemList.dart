
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/ui/db/commonFloor.dart';
typedef TapItem = Function(ExEntity);
class ItemTtranslate<T extends ExEntity> extends StatefulWidget{

  final T _entity;
  TapItem? _tapItem;

  ItemTtranslate({TapItem? tapItem,required T entity}):
  _entity = entity,
  _tapItem = tapItem;

  @override
  State createState() =>ItemTranslateState();
}

class ItemTranslateState extends State<ItemTtranslate>{

  @override
  Widget build(BuildContext context) {
    return
      Material(
          child: InkWell(
            splashColor: Colors.black26,
            onTap: (){
              if(widget._tapItem!=null)widget._tapItem!(widget._entity);
            },
            child: Card(
                child: Center(
                  child: Text(widget._entity.number.toString()),
                )
            ),
          ));
  }
}