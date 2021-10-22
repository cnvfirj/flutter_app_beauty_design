import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'generation/actionsGenerator.dart';

class MainPresenter with PresenterGenerator{

    static late MainPresenter _single = MainPresenter();

    late BuildContext _context;

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
      return S.maybeOf(_context)!.massage_blank_field_generator;
    }

    @override
    void actionGenerate() {
      super.actionGenerate();
      print('action generate');
    }

    @override
    void endGenerate(String massage){
      super.endGenerate(massage);
    }

    @override
    void actionShare() {
    }

    @override
    void actionAddEx() {
      print('action ex');

    }
  }

