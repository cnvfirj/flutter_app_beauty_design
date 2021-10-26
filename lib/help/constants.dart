
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/ui/common/CommonWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuildCoefficient{

  static final double H_APP_BAR = 0.07;
  static final double H_BOUNDARIES = 0.1;
  static final double H_HISTORY = 0.5;
  static final double H_EX = 0.2;
  static final double WIN_FONT_SIZE = 0.018;
  static final double MASSAGE_FONT_SIZE = 0.03;

  static final double SIDE_SHIFT_WIN = 0.9;
  static final double H_BUKMARK = 0.010;
  static final double H_BUK = 0.04;
  static final double H_BOTTOM_BAR = 0.3;

  static final double R_CIRCLE_ANGLES_WID = 20;

}

class GlobalColors{
  static final Color COLOR_MAIN_FONT = Color.fromRGBO(226, 226, 226, 1.0);
  static final Color COLOR_TEXT = Colors.white;
  static final Color COLOR_WIN_GENERATOR = Color.fromRGBO(62, 130, 151, 1.0);
  static final Color COLOR_WIN_BOUND = Color.fromRGBO(58, 53, 128, 1.0);
  static final Color COLOR_WIN_EX = Color.fromRGBO(128, 46, 46, 1.0);
  static final Color COLOR_WIN_HIST = Color.fromRGBO(104, 55, 76, 1.0);
}

enum NamesWidgets{
  GENERATE,
  BOUNDARIES,
  EXCLUDES,
  HISTORY
}

class LoadParams{

  static final LoadParams _single = LoadParams();

  static LoadParams inst()=>_single;

  final Map<NamesWidgets,Pair<double,double>> _positions = {};
  final Map<NamesWidgets,bool>_readinessPos = {};


  Map<NamesWidgets, Pair<double, double>> get positions => _positions;
  Map<NamesWidgets, bool> get readinessPos => _readinessPos;

  void reed(Function function)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
     for(NamesWidgets name in NamesWidgets.values) {
      _readPositions(name, pref);
    }
    await function();
  }


  void _readPositions(NamesWidgets name, final SharedPreferences pref){
    _readinessPos[name]=false;
    double? first = pref.getDouble(_keyPosition(name.toString(),'first'));
    double? second = pref.getDouble(_keyPosition(name.toString(),'second'));
    if(first!=null&&second!=null){
      _positions[name]=Pair(first,second);
      _readinessPos[name]=true;
    }
  }

  String _keyPosition(String name, String pair){
    return '${CommonParentWidget.PREF}$name$pair';
  }
}

// class Id{
//
//  static Id _single = Id();
//
//  static inst(){
//    return _single;
//  }
//
//  late String _ID_Generate;
//  late String _ID_Bound;
//  late String _ID_Ex;
//  late String _ID_Hist;
//
//  Id setGenerate(String value){
//    _ID_Generate = value;
//    return this;
//  }
//  Id setBound(String value){
//    _ID_Bound = value;
//    return this;
//  }
//  Id setEx(String value){
//    _ID_Ex = value;
//    return this;
//  }
//  Id setHist(String value){
//    _ID_Hist = value;
//    return this;
//  }
//
//
//
// }