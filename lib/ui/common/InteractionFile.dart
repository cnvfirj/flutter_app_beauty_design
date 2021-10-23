import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
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
      super.actionGenerate();
      Request('1','3',[1,2,3]).generate((form) => endGenerate(form));
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

