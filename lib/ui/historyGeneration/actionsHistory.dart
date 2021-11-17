import 'package:flutter_app_beauty_design/ui/common/commonList.dart';
import 'package:flutter_app_beauty_design/ui/db/commonFloor.dart';
import 'package:flutter_app_beauty_design/ui/generation/actionsGenerator.dart';

mixin PresenterHistory {
  late ActionsList<HistEntity> _actions;

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
        listHistEntity().then((list) => _actions.setChange(list));
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

  void sortListHistory();

  void clearListHistory();
}
