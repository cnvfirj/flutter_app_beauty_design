



import 'package:flutter_app_beauty_design/ui/generation/widgetGeneration.dart';

// typedef ShowMassage = Function(String massage);
typedef SelectorState = Function(PresentIdentificator identificator);

enum PresentIdentificator { Text, Progress }

mixin PresenterGenerator{

  // late ShowMassage _showMassage;
  late SelectorState _selectorState;
  PresentIdentificator _presentIdentificator = PresentIdentificator.Text;

  // void  setShowMassage(ShowMassage value) =>_showMassage = value;

  void setSelectorState(SelectorState value) =>_selectorState = value;

  // ShowMassage get showMassage => _showMassage;

  SelectorState get selectorState =>_selectorState;

  void savePresentIdentificator(PresentIdentificator p) =>_presentIdentificator = p;

  PresentIdentificator get presentIdentificator =>_presentIdentificator;

  void actionGenerate(){
    selectorState(PresentIdentificator.Progress);
  }

  void endGenerate(String massage){
    selectorState(PresentIdentificator.Text);
    // showMassage(massage);
  }

  String getMassage();
  void actionShare();
  void actionAddEx();






}

