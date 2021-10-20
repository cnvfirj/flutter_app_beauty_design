



import 'package:flutter_app_beauty_design/ui/generation/widgetGeneration.dart';

typedef ShowMassage = Function(String massage);

mixin PresenterGenerator{

  late ShowMassage _showMassage;
  PresentIdentificator _presentIdentificator = PresentIdentificator.Text;

  void  setShowMassage(ShowMassage value) =>_showMassage = value;

  ShowMassage get showMassage => _showMassage;

  void savePresentIdentificator(PresentIdentificator p) =>_presentIdentificator = p;

  PresentIdentificator get presentIdentificator =>_presentIdentificator;

  void actionGenerate();
  void actionShare(String massage);
  void actionAddEx(String massage);




}

