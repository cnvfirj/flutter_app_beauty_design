
import 'package:flutter_app_beauty_design/ui/db/ex.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

abstract class CommonModel{
  int? _id;
  final int _number;

  CommonModel(this._number);

  CommonModel fromJson(Map<String,dynamic> json);
  Map<String,dynamic>toMap();

  int? get id => _id;
  int get number => _number;

  CommonModel addId(int value) {
    _id = value;
    return this;
  }
}

class SQLDatabase{
  static final String DB = 'data.db';
  static final String T_EX = 'ex';
  static final String T_HIST = 'hist';
  static final int V_DB = 1;


  static SQLDatabase _single = SQLDatabase();

  SQLDatabase();

  static SQLDatabase inst()=>_single;

  late Database _db;

  final Lock _lock = Lock();

  Future<Database>openDB() async{
   if(_db==null){
     await _lock.synchronized(() async {
       _db = await openDatabase(
           join(await getDatabasesPath(),DB),
           version: V_DB,
           onCreate: (Database db, int version){
             db.execute(_table(T_EX));
             db.execute(_table(T_HIST));
           });
     });
   }
   return _db;
  }

  Future<CommonModel>insert(String table, CommonModel model) async{
    Database db = await openDB();
    model.addId(await db.insert(table, model.toMap()));
    return model;
  }

  Future<List<CommonModel>>delete(String table, CommonModel model)async{
    Database db = await openDB();
    db.delete(
        table,
        where: 'id = ?',
        whereArgs: [model.id]);
    List<CommonModel>list = (await db.query(table)).cast<CommonModel>();
    return list;
  }

   Future<List<CommonModel>>models(String table)async{
    Database db = await openDB();
    List<CommonModel>list = (await db.query(table)).cast<CommonModel>();
    return list;
  }

  String _table(String name){
    if(name==T_EX){
      return 'CREATE TABLE $T_EX(id INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT, number INTEGER, date STRING, source STRING)';
    }else{
      return 'CREATE TABLE $T_HIST(id INTEGER PRIMARY KEY AUTOINCREMENT, number INTEGER, date STRING, source STRING)';
    }
  }

}

// class MainDataBase{
//
//   static MainDataBase _single = MainDataBase();
//
//   static final String NAME_DB = 'databasernumbers.db';
//   static final String TABLE_EX = 'tableexr';
//   static final String TABLE_HIST = 'tablehist';
//
//   MainDataBase();
//
//   static MainDataBase inst(){
//     return _single;
//   }
//
//   Future<Database> openTable(String table)async{
//     return openDatabase(
//         join(
//             await getDatabasesPath(),NAME_DB),
//             onCreate: (Database db, int version){
//                db.execute(_table(table));
//             },
//             version: 2);
//   }
//
//   Future<Database>openDB()async{
//     return openDatabase(join(await getDatabasesPath(),NAME_DB),version: 1);
//   }
//
//   String _table(String name){
//     if(name==TABLE_EX){
//       return 'CREATE TABLE $TABLE_EX(id INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT, number INTEGER, date STRING, source STRING)';
//     }else{
//       return 'CREATE TABLE $TABLE_EX(id INTEGER PRIMARY KEY AUTOINCREMENT, number INTEGER, date STRING, source STRING)';
//     }
//   }
//
//   Future<void>insert(String table,CommonModel model)async{
//     openTable(table).then((Database db)async{
//       int id =  await db.insert(table, model.toMap());
//     });
//   }
//
//   Future<List<CommonModel>>models(String table)async{
//       final db = await openTable(table);
//       final List<Map<String,dynamic>> maps = await db.query(table);
//       return List.generate(maps.length, (i) {
//         return ModelEx(number: maps[i]['number'], date:maps[i]['date'], source: maps[i]['source']).addId(maps[i]['id']);
//       });
//   }
//
//
//
// }