import 'package:flutter_app_beauty_design/help/constants.dart';

mixin PresenterBoundaries {
  String _from = '';
  String _to = '';

  void setBound(String title, String value);

  String get from => _from;

  String get to => _to;

  set from(String from) =>_from = from;

  set to(String to) =>_to = to;
}
