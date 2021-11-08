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
      function(createAlarmMassage(_form.massage));
    else {
      /*если генерация готова, то проверяем результат по базе*/
      CommonDatabase.inst().db().then((d) {
        d.numberDao.findExEntityToNumber(_form.number).then((entity) {
          /*если в базе результата нет, то добавляем его*/
          if (entity == null) {
            d.numberDao
                .insertEx(ExEntity(number: _form.number, source: source))
                .then((id) {
              function(createAddingMassage());
            });
          } else {
            /*если есть, то выводим алярм сообщение*/
            function(createAlarmMassage(FormMassage.Fill_Ex));
          }
        });
      });
    }
  }

  Future<List<ExEntity>> listEntityEx() async {
    final d = await CommonDatabase.inst().db();
    return await d.numberDao.allNumbersEx();
  }

  Future<List<int>> listValuesEx() async {
    final d = await CommonDatabase.inst().db();
    return await d.numberDao.valuesEx();
  }

  String createAlarmMassage(FormMassage m);

  String createAddingMassage();
}
