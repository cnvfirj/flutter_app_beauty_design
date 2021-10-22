

import 'dart:io';
import 'package:flutter_app_beauty_design/help/byCode.dart';

typedef SelectorState = Function(PresentIdentificator identificator);
enum PresentIdentificator { Text, Progress }

mixin PresenterGenerator{

  late SelectorState _selectorState;
  PresentIdentificator _presentIdentificator = PresentIdentificator.Text;

  void setSelectorState(SelectorState value) =>_selectorState = value;

  SelectorState get selectorState =>_selectorState;

  void savePresentIdentificator(PresentIdentificator p) =>_presentIdentificator = p;

  PresentIdentificator get presentIdentificator =>_presentIdentificator;

  void actionGenerate(){
    savePresentIdentificator(PresentIdentificator.Progress);
    selectorState(PresentIdentificator.Progress);
  }

  void endGenerate(FormGenerate form){
    savePresentIdentificator(PresentIdentificator.Text);
    selectorState(PresentIdentificator.Text);
    // showMassage(massage);
  }

  String getMassage();
  void actionShare();
  void actionAddEx();
}

class RequestGeneration{

  final PresenterGenerator _presenter;

  RequestGeneration(this._presenter);

  late Pair<String,String>_boundaries;
  late List<int>_excludes;

  RequestGeneration boundaries(String from, String to){
    _boundaries = Pair(from, to);
    return this;
  }
  RequestGeneration excludes(List<int>excludes){
    _excludes = excludes;
    return this;
  }


  void startGenerate(){
    if(checkBoundaries()){
      generate();
    }else{
      _presenter.endGenerate(FormGenerate());
    }
  }

  bool checkBoundaries(){
    if(_boundaries.first.length==0||_boundaries.second.length==0)return false;
    if(_boundaries.first==_boundaries.second)return false;
      if(_boundaries.first.length==1||_boundaries.second.length==1){
        if(_boundaries.first.substring(0,1)=="-"||_boundaries.second.substring(0,1)=="-")
          return false;
      }
    return true;
  }

   Future<bool>checkNetwork() async{
    try{
      final result = await InternetAddress.lookup('https://qrng.anu.edu.au');
      return false;
    }on SocketException catch (_){
      return false;
    }
  }

  generate(){
    checkNetwork().then((value) => null);
  }

  //
  //
  // String generate(){
  //  int from = int.parse(_boundaries.first);
  //  int to = int.parse(_boundaries.second);
  //  int length = (to-from).abs();
  //  if(to<from)length = (from-to).abs();
  //  if(length>1000){
  //
  //  }else{
  //
  //  }
  //  return "";
  // }


}

class FormGenerate{

  String source = 'NON';
  String number = 'NON';
  String date = 'NON';
  FormGenerate setSource(String v){
    source = v;
    return this;
  }
  FormGenerate setNumber(String v){
    number = v;
    return this;
  }
  FormGenerate setdate(String v){
    date = v;
    return this;
  }

}

