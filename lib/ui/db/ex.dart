
class ModelEx{
  final int _number;
  final String _date;
  final String _source;

  ModelEx(this._number, this._date, this._source);

  String get source => _source;

  String get date => _date;

  int get number => _number;
}