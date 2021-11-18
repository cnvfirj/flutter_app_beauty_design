import 'package:flutter_app_beauty_design/ui/common/commonList.dart';
import 'package:flutter_app_beauty_design/ui/db/commonFloor.dart';
import 'package:flutter_app_beauty_design/ui/generation/actionsGenerator.dart';


mixin PresenterHistory {

  late ActionsList<HistEntity> _actions;

  Sort _sort = Sort.Id_Down;

  ActionsList get actionsList => _actions;

  void setActionsHist(ActionsList<HistEntity> actions) {
    _actions = actions;
  }

  void addValueToHist(FormGenerate form) {
    if (form.massage == FormMassage.Ready) {
      insertEntityHist(HistEntity(
              number: form.number,
              source: form.source,
              from: form.from,
              to: form.to))
          .then((id) {
        listHistEntity().then((list){
          // _actions.setChange(_sortList(list));
          _actions.setChange(list);

        });
      });
    }
  }



  Future<List<HistEntity>> listHistEntity() {
    return _database().allNumbersHist();
  }

  Future<int> insertEntityHist(HistEntity entity) {
    return _database().insertHist(entity);
  }

  NumberDao _database() {
    return CommonDatabase.inst().db.numberDao;
  }

  void sortListHistory(){
    _actions.selectorSort();
    _actions.setChange(_actions.getList());
    // int index  = Sort.values.indexOf(_sort);
    // index++;
    // if(index>=Sort.values.length)index = 0;
    // _sort = Sort.values[index];
    // _actions.setChange(_sortList(_actions.getList()));
  }

  void clearListHistory(){
    _database().clearHist().then((_){
      listHistEntity().then((list){
        _actions.setChange(list);
      });
    });
  }

}
