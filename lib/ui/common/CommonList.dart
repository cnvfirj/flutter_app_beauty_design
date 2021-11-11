
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/db/commonFloor.dart';
import 'package:provider/provider.dart';

class CommonGridView extends StatefulWidget{
  final Axis _axis;
  final int _columns;
  final double _aspectRatio;
  final double _marginCol;
  final double _marginRow;
  // List<ExEntity>_list = [];

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
    return Consumer<ActionsList>(builder:(BuildContext context, ActionsList actions, Widget? child){

      actions.setObserver((list){
        setState(() {
          // widget._list = list;
        });
      });

      return Container(
        color: GlobalColors.COLOR_TEXT,
        child:Stack(
          children: [
            Text(_createMassage(context,actions.getList().length),textAlign: TextAlign.center,),
            GridView.builder(
              itemCount: actions.getList().length,
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
                  child: Text(actions.getList()[index].number.toString()),
                );
              },

            ),
          ],
        )
      );
    });
  }


  @override
  void initState() {
    super.initState();

  }

  String _createMassage(BuildContext context,int i){
    if(i==0)return S.maybeOf(context)!.background_text_list_ex;
    return '';
  }

}



class ActionsList<T extends ExEntity> {

  Function(List<T> list)? _observerGridView;
  // late Function(Future<List<T>> future) _loaderList;
  List<T>_list = [];

  final Future<List<T>> _loader;


  ActionsList(this._loader);

  void setObserver(Function(List<T> list) observer) {
    bool primary = _observerGridView==null;
    _observerGridView = observer;
    if(primary)_loader.then((list) {
      setChange(list);
    });
  }

  void scanTable() {
    _loader.then((list) {
      setChange(list);
    });
  }

  void setChange(List<T> list){
    _list = list;
    if(_observerGridView!=null){
      _observerGridView!(list);
    }
  }

  List<T>getList(){
    return _list;
  }

}