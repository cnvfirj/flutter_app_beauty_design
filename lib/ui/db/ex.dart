
import 'package:flutter_app_beauty_design/ui/db/commonFloor.dart';
import 'package:flutter_app_beauty_design/ui/db/commonSQL.dart';

class ModelExSQL extends CommonModel{
  final String _date;
  final String _source;

  ModelExSQL({required int number, required String date, required String source}):
  // _number = number,
  _date = date,
  _source = source,
   super(number);

  String get source => _source;

  String get date => _date;

  @override
  CommonModel fromJson(Map<String,dynamic> json) {
    return ModelExSQL(number:json['number'], date:json['date'], source:json['source']).addId(json['id']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {'number':number,'date':_date,'source':_source};
  }
}

class ModelExFloor{

}

