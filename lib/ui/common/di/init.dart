

import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/ui/db/commonFloor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

/*inject in InteractionFile CommonProvider.class*/
/*inject in CommonFloor  CommonDatabase.class*/

class InjectPreparationWork{

  static final InjectPreparationWork _singleton = InjectPreparationWork();

  static InjectPreparationWork instance()=>_singleton;

  final Lock _lock = Lock();

  InitPref _initPref = InitPref();
  InitDB _initDB = InitDB();

  ready(Function function) async{
    await _lock.synchronized(() async{
      WidgetsFlutterBinding.ensureInitialized();
      await _initDB.initDatabase();
      await _initPref.initPref();
      function();
    });
  }

  preferences()=>_initPref._pref;
  database()=>_initDB._database;
}

class InitPref{
  SharedPreferences? _pref;

  Future<SharedPreferences?> initPref()async{
    if(_pref==null){
      _pref = await SharedPreferences.getInstance();
    }
    return _pref;
  }

}

class InitDB{

   MainDatabase? _database;

   Future<MainDatabase?>initDatabase()async{
     if(_database==null) _database = await $FloorMainDatabase.databaseBuilder('data.db').build();
     return _database!;
   }

}