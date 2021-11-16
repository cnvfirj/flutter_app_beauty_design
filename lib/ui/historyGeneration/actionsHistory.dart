import 'package:flutter_app_beauty_design/ui/common/commonList.dart';
import 'package:flutter_app_beauty_design/ui/db/commonFloor.dart';

mixin PresenterHistory {

  late ActionsList<HistEntity> _actions;

  ActionsList get actionsList => _actions;

  void setActionsHist(ActionsList<HistEntity> actions){
    _actions = actions;
  }


  void sortListHistory();

  void clearListHistory();

}