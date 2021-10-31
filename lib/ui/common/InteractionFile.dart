import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generation/actionsGenerator.dart';

class MainPresenter with PresenterGenerator{

    static late MainPresenter _single = MainPresenter();


    late BuildContext _context;

    String _massage = "-";

    static MainPresenter inst() {
       return _single;
    }


  MainPresenter context(BuildContext context){
      _context = context;
      return this;
    }

    PresenterGenerator generator(){
       return _single;
    }

    @override
    String getMassage(){
      if(_massage=="-")_massage =  S.maybeOf(_context)!.massage_blank_field_generator;
      return _massage;
    }

    @override
    void actionGenerate() {

      int min = -4294967295~/2;
      int max = 4294967295~/2;
      print('min = ${min} max ${max}');

      String from = '$min';
      String to = '$max';


      super.actionGenerate();
      Request(from,to,[1,2,3]).generate((form) => endGenerate(form));
    }

    @override
    void actionShare() {

    }
    @override
    void actionAddEx() {

    }
    @override
    void endGenerate(FormGenerate form){
      if(form.massage==FormMassage.Ready)_massage = form.number.toString();
      else if(form.massage==FormMassage.Correct_Ex)_massage = S.maybeOf(_context)!.massage_error_ex;
      else if(form.massage==FormMassage.Fill_Fields)_massage = S.maybeOf(_context)!.massage_blank_fields_boundaries;
      else if(form.massage==FormMassage.Correct_Fields)_massage = S.maybeOf(_context)!.massage_error_fields_boundaries;
      super.endGenerate(form);

    }
  }

class CommonProvider extends CommonWriteReadPref with CommonObservable {
  static CommonProvider _single = CommonProvider();

  static CommonProvider inst() => _single;

}

typedef StartAnim = Function();
mixin CommonObservable {
  Map<NamesWidgets, StartAnim> _observer = {};

  void observer(StartAnim value, NamesWidgets name) {
    _observer[name] = value;
  }

  void action() {
    for (StartAnim val in _observer.values) {
      val();
    }
  }
}

class CommonWriteReadPref {
  late SharedPreferences _pref;

  void init(Function function) async {
    _pref = await SharedPreferences.getInstance();
    await function();
  }

  Pair<double, double> readPosition(
      NamesWidgets name, Pair<double, double> recovery) {
    print('read ${name.toString()}');
    double? first = _pref.getDouble(GlobalKeys.key(name, 'first'));
    double? second = _pref.getDouble(GlobalKeys.key(name, 'second'));
    if (first != null && second != null)
      return Pair(first, second);
    else
      return recovery.clone();
  }

  void writePosition(NamesWidgets name, Pair<double, double> pair) {
    print('write ${name.toString()}');
    _pref.setDouble(GlobalKeys.key(name, 'first'), pair.first);
    _pref.setDouble(GlobalKeys.key(name, 'second'), pair.second);
  }
}

