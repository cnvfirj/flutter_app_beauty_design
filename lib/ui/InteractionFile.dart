
import 'generation/actionsGenerator.dart';


class MainPresenter with PresenterGenerator{

  static MainPresenter _singleton = MainPresenter();

  static MainPresenter get()=>_singleton;

  @override
  void actionGenerate() {
     showMassage('str');
  }

  @override
  void actionShare(String massage) {


  }

  @override
  void actionAddEx(String massage) {


  }

}