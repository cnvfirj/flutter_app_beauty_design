import 'package:flutter_app_beauty_design/ui/common/CommonList.dart';
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

typedef ObserverGridView = Function(List<ExEntity> list);

mixin PresenterExList {

  final ActionsList<ExEntity> _actions =
      ActionsList(CommonDatabase.inst().db.numberDao.allNumbersEx());

  FormGenerate _form = FormGenerate(0, FormMassage.Generate_Number);

  ActionsList get actionsList => _actions;

  void setObserver(ObserverGridView observer) {
    _actions.setObserver(observer);
  }

  void patternExclude(FormGenerate form) {
    _form = form;
  }

  void clearTable() {
     _database().clearEx().then((_){
       listEntityEx().then((list){
         _actions.setChange(list);
       });
     });
  }

  void createExclude(Function function, String source) {
    /*формируем исключение только когда генерация готова*/
    if (_form.massage != FormMassage.Ready)
      function(createAlarmMassageEx(_form.massage));
    else {
      /*если генерация готова, то проверяем результат по базе*/
      findEntity(_form.number).then((entity) {
        /*если в базе результата нет, то добавляем его*/
        if (entity == null) {
          insertEntity(ExEntity(number: _form.number, source: source))
              .then((id) {
            function(createAddingMassageEx());
            /*указываем что список исключений в бд изменен*/
            listEntityEx().then((list) {
              _actions.setChange(list);
            });
          });
        } else {
          /*если есть, то выводим алярм сообщение*/
          function(createAlarmMassageEx(FormMassage.Fill_Ex));
          // }
        }
      });
    }
  }

  Future<List<int>> listValuesEx() {
    return _database().valuesEx();
  }

  Future<List<ExEntity>> listEntityEx() {
    return _database().allNumbersEx();
  }

  Future<ExEntity?> findEntity(int number) {
    return _database().findExEntityToNumber(number);
  }

  Future<int> insertEntity(ExEntity entity) {
    return _database().insertEx(entity);
  }

  NumberDao _database(){
    return CommonDatabase.inst().db.numberDao;
  }

  List<ExEntity> getList() => _actions.getList();

  void manualExcludeEntry();

  String createAlarmMassageEx(FormMassage m);

  String createAddingMassageEx();
}
