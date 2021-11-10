import 'package:flutter_app_beauty_design/ui/db/commonFloor.dart';
import 'package:flutter_app_beauty_design/ui/generation/actionsGenerator.dart';

/*
* @override
  Future<List<int>> valuesEx() async {
    return await _queryAdapter.queryList('SELECT number FROM ex',
        mapper: (Map<String, Object?>row)=>row['number']as int);
  }
*
* */

typedef UpdateList = Function();
mixin PresenterExList {
  FormGenerate _form = FormGenerate(0, FormMassage.Generate_Number);

  void patternExclude(FormGenerate form) {
    _form = form;
  }

  void createExclude(Function function, String source) {
    /*формируем исключение только когда генерация готова*/
    if (_form.massage != FormMassage.Ready)
      function(createAlarmMassageEx(_form.massage));
    else {
      /*если генерация готова, то проверяем результат по базе*/
      CommonDatabase.inst()
          .db
          .numberDao
          .findExEntityToNumber(_form.number)
          .then((entity) {
        // d.numberDao.findExEntityToNumber(_form.number).then((entity) {
        /*если в базе результата нет, то добавляем его*/
        if (entity == null) {
          CommonDatabase.inst()
              .db
              .numberDao
              .insertEx(ExEntity(number: _form.number, source: source))
              .then((id) {
            function(createAddingMassageEx());
          });
        } else {
          /*если есть, то выводим алярм сообщение*/
          function(createAlarmMassageEx(FormMassage.Fill_Ex));
          // }
        }
      });
    }
  }

  Future<List<ExEntity>> listEntityEx() async {
    return await CommonDatabase.inst().db.numberDao.allNumbersEx();
  }

  Future<List<int>> listValuesEx() async {
    return await CommonDatabase.inst().db.numberDao.valuesEx();
  }

  String createAlarmMassageEx(FormMassage m);

  String createAddingMassageEx();
}
