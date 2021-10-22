import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import '../generation/actionsGenerator.dart';

class MainPresenter with PresenterGenerator{

    static late MainPresenter _single = MainPresenter();

    late RequestGeneration _generation;

    late BuildContext _context;

    String _massage = "-";

    static MainPresenter inst() {
       return _single;
    }

    MainPresenter(){
      _generation = RequestGeneration(this);
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
      _generation.excludes([1]).boundaries('-', '22').startGenerate();
    }

    @override
    void actionShare() {

    }
    @override
    void actionAddEx() {

    }
    @override
    void endGenerate(FormGenerate form){
      if(form.source=="NON")_massage =  S.maybeOf(_context)!.massage_error_fields_boundaries;
      super.endGenerate(form);

    }
  }

