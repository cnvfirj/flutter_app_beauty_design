



typedef ShowMassage = Function(String massage);

mixin PresenterGenerator{

  late ShowMassage _showMassage;

  void  setShowMassage(ShowMassage value) =>_showMassage = value;

  ShowMassage get showMassage => _showMassage;

  void actionGenerate();
  void actionShare(String massage);
  void actionAddEx(String massage);


}

