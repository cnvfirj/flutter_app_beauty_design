import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/common/CommonList.dart';
import 'package:flutter_app_beauty_design/ui/common/di/init.dart';
import 'package:flutter_app_beauty_design/ui/exclusionList/actionsExList.dart';
import 'package:flutter_app_beauty_design/ui/generationBoundaries/actionsBoundaries.dart';
import 'package:flutter_app_beauty_design/ui/historyGeneration/actionsHistory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generation/actionsGenerator.dart';

class MainPresenter
    with PresenterGenerator, PresenterBoundaries, PresenterExList, PresenterHistory{
  static MainPresenter _single = MainPresenter();

  late BuildContext _context;

  String _massage = "-";

  static MainPresenter inst() {
    return _single;
  }

  MainPresenter context(BuildContext context) {
    _context = context;
    return this;
  }

  PresenterGenerator generator() {
    return _single;
  }

  PresenterBoundaries boundaries() {
    return _single;
  }

  PresenterExList ex() {
    return _single;
  }

  @override
  String getMassage() {
    if (_massage == "-")
      _massage = S.maybeOf(_context)!.massage_blank_field_generator;
    return _massage;
  }

  @override
  void actionGenerate() {
    super.actionGenerate();
    /*регистрируем в исключениях начало генерации числа.
    * обнуляем оставшееся значение*/
    patternExclude(FormGenerate(0, FormMassage.Generate_Number));
    /*даем запрос в бд и извлекаем значения исключений*/
    listValuesEx().then((list) {
      Request(from, to, list).generate((form) => endGenerate(form));
    });
  }

  @override
  void actionShare() {

  }

  @override
  void actionAddEx() {
    createExclude(
      (massage) {
        _massage = massage;
        viewMassage();
      },
      'Generated Application',
    );
  }

  @override
  void endGenerate(FormGenerate form) {
    /*регистрируем в исключениях конец генерации числа.
    * его значение*/
    patternExclude(form);
    if (form.massage == FormMassage.Ready)
      _massage = form.number.toString();
    else if (form.massage == FormMassage.Correct_Ex)
      _massage = S.maybeOf(_context)!.massage_error_ex;
    else if (form.massage == FormMassage.Fill_Fields)
      _massage = S.maybeOf(_context)!.massage_blank_fields_boundaries;
    else if (form.massage == FormMassage.Correct_Fields)
      _massage = S.maybeOf(_context)!.massage_error_fields_boundaries;
    super.endGenerate(form);
  }

  @override
  void setBound(String title, String value) {
    if (title == S.maybeOf(_context)!.from)
      from = value;
    else if (title == S.maybeOf(_context)!.to) to = value;
  }

  @override
  String createAddingMassageEx() {
    return S.maybeOf(_context)!.massage_ex_add;
  }

  @override
  String createAlarmMassageEx(FormMassage m) {
    return S.maybeOf(_context)!.massage_ex_no_add;
  }

}

class CommonProvider extends CommonWriteReadPref with CommonObservable {
  static CommonProvider? _single;

  static CommonProvider inst(){
    if(_single==null){
      /**/
      _single = CommonProvider(InjectPreparationWork.instance().preferences());
    }
    return _single!;
  }

  /*inject*/
  CommonProvider(SharedPreferences preferences):super(preferences);
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


class CommonWriteReadPref{

  final SharedPreferences _pref;


  CommonWriteReadPref(this._pref);

  // void init(Function function) async {
  //   _pref = await SharedPreferences.getInstance();
  //   await function();
  // }
  //
  SharedPreferences get pref =>_pref;

  Pair<double, double> readPosition(
      NamesWidgets name, Pair<double, double> recovery) {
    double? first = _pref.getDouble(GlobalKeys.key(name, 'first'));
    double? second = _pref.getDouble(GlobalKeys.key(name, 'second'));
    if (first != null && second != null)
      return Pair(first, second);
    else
      return recovery.clone();
  }

  void writePosition(NamesWidgets name, Pair<double, double> pair) {
    _pref.setDouble(GlobalKeys.key(name, 'first'), pair.first);
    _pref.setDouble(GlobalKeys.key(name, 'second'), pair.second);
  }
}
