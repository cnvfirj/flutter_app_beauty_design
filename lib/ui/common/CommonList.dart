
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/db/commonFloor.dart';
import 'package:flutter_app_beauty_design/ui/exclusionList/actionsExList.dart';
import 'package:provider/provider.dart';

class CommonGridView extends StatefulWidget{
  final Axis _axis;
  final int _columns;
  final double _aspectRatio;
  final double _marginCol;
  final double _marginRow;
  List<ExEntity>_list = [];

  CommonGridView({
    required Axis axis,
    required int columns,
    required double aspectRatio,
    required double marginCol,
    required double marginRow}):
   _axis = axis,
  _columns = columns,
  _aspectRatio = aspectRatio,
  _marginCol = marginCol,
  _marginRow = marginRow;

  @override
  State createState()=>StateCommonGridView();
}

class StateCommonGridView extends State<CommonGridView>{

  @override
  Widget build(BuildContext context) {
    return Consumer<PresenterExList>(builder:(BuildContext context, PresenterExList presenter, Widget? child){

      presenter.setObserver((list){
        print('state ${list.length}');
        setState(() {
          widget._list = list;
        });
      });

      return Container(
        color: GlobalColors.COLOR_TEXT,
        child:Stack(
          children: [
            Text(_createMassage(context,widget._list.length),textAlign: TextAlign.center,),
            GridView.builder(
              itemCount: widget._list.length,
              scrollDirection: widget._axis,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget._columns,
                // MediaQuery.of(context).orientation == Orientation.landscape ? 5 : 3,
                crossAxisSpacing: widget._marginCol,
                mainAxisSpacing: widget._marginRow,
                childAspectRatio: widget._aspectRatio,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Text(widget._list[index].number.toString()),
                );
              },

            ),
          ],
        )
      );
    });
  }

  String _createMassage(BuildContext context,int i){
    if(i==0)return S.maybeOf(context)!.background_text_list_ex;
    return '';
  }
}