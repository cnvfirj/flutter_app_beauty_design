
import 'package:flutter_app_beauty_design/ui/db/ex.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class CommonModel{
  int? _id;
  CommonModel fromJson(Map<String,dynamic> json);
  Map<String,dynamic>toMap();

  int? get id => _id;

  CommonModel addId(int value) {
    _id = value;
    return this;
  }
}

class MainDataBase{

  static MainDataBase _single = MainDataBase();

  static final String NAME_DB = 'databasernumbers.db';
  static final String TABLE_EX = 'tableexr';
  static final String TABLE_HIST = 'tablehist';

  MainDataBase();

  static MainDataBase inst(){
    return _single;
  }

  Future<Database> openTable(String table)async{
    return openDatabase(
        join(
            await getDatabasesPath(),NAME_DB),
            onCreate: (Database db, int version){
               db.execute(_table(table));
            },
            version: 2);
  }
  
  Future<Database>openDB()async{
    return openDatabase(join(await getDatabasesPath(),NAME_DB),version: 1);
  }

  String _table(String name){
    if(name==TABLE_EX){
      return 'CREATE TABLE $TABLE_EX(id INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT, number INTEGER, date STRING, source STRING)';
    }else{
      return 'CREATE TABLE $TABLE_EX(id INTEGER PRIMARY KEY AUTOINCREMENT, number INTEGER, date STRING, source STRING)';
    }
  }

  // Future<void>insert(String table,CommonModel model)async{
  //   final Database db = await openTable(table);
  //   await db.insert(table, model.toMap(),
  //                    conflictAlgorithm: ConflictAlgorithm.replace);
  // }

  Future<void>insert(String table,CommonModel model)async{
    openTable(table).then((Database db)async{
      int id =  await db.insert(table, model.toMap());
    });
  }

  Future<List<CommonModel>>models(String table)async{
      final db = await openTable(table);
      final List<Map<String,dynamic>> maps = await db.query(table);
      return List.generate(maps.length, (i) {
        return ModelEx(number: maps[i]['number'], date:maps[i]['date'], source: maps[i]['source']).addId(maps[i]['id']);
      });
  }



}