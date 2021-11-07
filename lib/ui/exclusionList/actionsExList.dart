import 'package:flutter_app_beauty_design/ui/db/common.dart';
import 'package:flutter_app_beauty_design/ui/db/ex.dart';
import 'package:flutter_app_beauty_design/ui/generation/actionsGenerator.dart';

mixin PresenterExList {

  FormGenerate _form = FormGenerate(0, FormMassage.Generate_Number);

  void patternExclude(FormGenerate form) {
    _form = form;
  }

  void createExclude(Function function) {
    if (_form.massage != FormMassage.Ready)
      function(createAlarmMassage(_form.massage));
    else {
      // MainDataBase.inst().insert(MainDataBase.TABLE_EX,
      //     ModelEx(
      //         number: _form.number,
      //         date: _form.date,
      //         source: _form.source
      //     ));
      function(createAddingMassage());
    }

    // MainDataBase.inst().models(MainDataBase.TABLE_EX).then(
    //         (value) {
    //           print('length db ${value.length}');
    //           for(CommonModel m in value){
    //             print('add id in ${(m as ModelEx).id}');
    //             print('add number in ${(m as ModelEx).number}');
    //
    //           }
    //     });
  }

  String createAlarmMassage(FormMassage m);
  String createAddingMassage();
}
