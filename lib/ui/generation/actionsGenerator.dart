import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:intl/intl.dart';

typedef SelectorState = Function(PresentIdentificator identificator);
enum PresentIdentificator { Text, Progress }

mixin PresenterGenerator{

  late SelectorState _selectorState;
  PresentIdentificator _presentIdentificator = PresentIdentificator.Text;

  void setSelectorState(SelectorState value) => _selectorState = value;

  SelectorState get selectorState => _selectorState;

  void savePresentIdentificator(PresentIdentificator p) =>
      _presentIdentificator = p;

  PresentIdentificator get presentIdentificator => _presentIdentificator;

  void actionGenerate() {
    savePresentIdentificator(PresentIdentificator.Progress);
    selectorState(PresentIdentificator.Progress);
  }

  void endGenerate(FormGenerate form) {
    savePresentIdentificator(PresentIdentificator.Text);
    selectorState(PresentIdentificator.Text);
  }

  String getMassage();

  void actionShare();

  void actionAddEx();
}

enum FormMassage{Correct_Fields, Fill_Fields, Correct_Ex, Ready}

class FormGenerate {

  static final String App = "Application";
  static final String Net = "Internet";
  static final String Non = 'NoN';

  String source = Non;
  final int number;
  String date = Non;
  final String _massage;

  late int from;
  late int to;


  FormGenerate(this.number, FormMassage massage):_massage = massage.toString();

  FormGenerate setSource(String v) {
    source = v;
    return this;
  }

  FormGenerate setBoundaries(int from, int to){
    this.from = from;
    this.to = to;
    return this;
  }

  FormGenerate setDate(String v) {
    date = v;
    return this;
  }

  FormMassage get massage{
      for(FormMassage m in FormMassage.values){
        if(m.toString()==_massage)return m;
      }
      return FormMassage.Ready;
  }

}

class Request {

  final String from;
  final String to;
  final List<int>ex;
  FormMassage _massage = FormMassage.Ready;
  int _delta = 0;

  Request(this.from, this.to,this.ex){
    checkBoundaries();
  }

  void generate(ReadyForm ready){
    if(_massage==FormMassage.Ready){
      _MassageFormer(
          _sourceGenerate()
              ._setBoundaries(from: int.parse(from), to: int.parse(to))
              ._setExcludes(ex))
          .form(ready);
    }else{
      ready(FormGenerate(0, _massage));
    }
  }

  _SourceGenerate _sourceGenerate(){
    return _delta>1000?_GenerateBigNumber():_GenerateCommonNumber();
  }

  void checkBoundaries() {
    if (from.length == 0 || to.length == 0) {
      _massage = FormMassage.Fill_Fields;
    }else if (from == to) {
      _massage = FormMassage.Correct_Fields;
    }else if ((from.length == 1 && from.substring(0, 1) == "-" ) ||
        (to.length == 1&&to.substring(0, 1) == "-")) {
        _massage = FormMassage.Correct_Fields;
    }
    if(_massage==FormMassage.Ready){
      checkDelta();
    }
  }

  void checkDelta(){
    int start = int.parse(from)<int.parse(to)?int.parse(from):int.parse(to);
    int fin = int.parse(from)<int.parse(to)?int.parse(to):int.parse(from);
    _delta = fin - start;
    if(_delta>GlobalValues.MAX_DIAPAZON)_massage = FormMassage.Correct_Fields;
    // if(_delta==ex.length)_massage = FormMassage.Correct_Ex;
  }
}

typedef ReadyForm = Function(FormGenerate form);

class _MassageFormer {

  final _SourceGenerate _generate;

  String _source = FormGenerate.App;

  _MassageFormer(this._generate);

  void form(ReadyForm ready) {
    _generate._generate((number) {
           ready(
              FormGenerate(number, _generate._massage)
                  .setBoundaries(_generate._from, _generate._to)
                  .setSource(_source)
                  .setDate(DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())));
    });
  }
}

class _GenerateBigNumber extends _SourceGenerate {
  late int _delta;
  late int _start;
  late int _end;

  @override
  void _prepared() {
    if (_from < _to) {
      _delta = (_to - _from).abs() + 1;
      _start = _from;
      _end = _to;
    }
    else {
      _delta = (_from - _to).abs() + 1;
      _start = _to;
      _end = _from;
    }
  }

  @override
  int _value() {
    _prepared();
    int value = _random().nextInt(_delta);
    int start = value + _start;
    return _compare(start);
  }
  late int _index = 0;
  int _compare(int value) {
    if(_index == 2){
      _massage = FormMassage.Correct_Ex;
      return 0;
    }
    if (_excludes.contains(value)) return _compare(value + 1);
    if (value > _end) {
      _index +=1;
      return _compare(_start);
    }
    return value;
  }

}

class _GenerateCommonNumber extends _SourceGenerate {

  late List<int>_arr = [];

  @override
  void _prepared() {
    int delta = (_to - _from).abs() + 1;
    int start = _from;
    if (_to < _from) {
      delta = (_from - _to).abs() + 1;
      start = _to;
    }
    List<int>d = List.generate(delta, (index) => start+index);
    for(int value in d){
      if(!_excludes.contains(value))_arr.add(value);
    }
    if(_arr.length==0)_check = false;
    super._prepared();
  }

  @override
  int _value() {
    _prepared();
    if(!_check){
      _massage = FormMassage.Correct_Ex;
      return 0;
    }
    int index = _random().nextInt(_arr.length);
    return _arr[index];
  }

}


typedef GetNumber = Function(int number);

abstract class _SourceGenerate {

  late int _from;
  late int _to;
  FormMassage _massage = FormMassage.Ready;
  bool _check = true;

  _SourceGenerate _setBoundaries({required int from, required int to}) {
    _from = from;
    _to = to;
    return this;
  }

  late List<int>_excludes;

  _SourceGenerate _setExcludes(List<int>list) {
    _excludes = list;
    return this;
  }

  Future<int> _future() {
    return Future(() => _value());
  }

  void _generate(GetNumber number) {
    /*Задержка для эмуляции длительности процесса*/
    Future.delayed(const Duration(seconds: 2),(){
        _future().then((value) => number(value));
    });

  }

   Random _random(){
    Random r;
    try {
      r = Random.secure();
    } on UnsupportedError catch (_) {
      r = Random();
    }
    return r;
  }

  FormMassage getMassage(){
    return _massage;
  }
  void _prepared(){

  }

  int _value();

}

