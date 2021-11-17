
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_app_beauty_design/ui/common/di/init.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'commonFloor.g.dart';

/*flutter packages pub run build_runner build*/
class CommonDatabase{
  static CommonDatabase? _single;

  static CommonDatabase inst(){
    if(_single==null)_single = CommonDatabase(InjectPreparationWork.instance().database());
    return _single!;
  }

  final MainDatabase _database;

  /*inject*/
  CommonDatabase(this._database);

  MainDatabase get db => _database;

}

/*
 @override
  Future<List<int>> valuesEx() async {
    return await _queryAdapter.queryList('SELECT number FROM ex',
        mapper: (Map<String, Object?>row)=>row['number']as int);
  }
  */

/*https://floor.codes/getting-started*/
@Database(version: 2,entities: [ExEntity, HistEntity])
abstract class MainDatabase extends FloorDatabase {
  NumberDao get numberDao;
}

@Entity(tableName: 'ex')
class ExEntity{

  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'id')
  int? id;
  @ColumnInfo(name:'number')
  final int number;
  @ColumnInfo(name:'source')
  final String source;

  ExEntity({this.id,required this.number,required this.source});
}

@Entity(tableName: 'hist')
class HistEntity extends ExEntity{
  @ColumnInfo(name: 'from')
  final int from;
  @ColumnInfo(name: 'to')
  final int to;

  HistEntity({int?id,required int number,required String source,required this.from, required this.to}):
  super(id:id,number: number,source: source);
}

@dao
abstract class NumberDao{

  @Query('SELECT * FROM ex')
  Future<List<ExEntity>>allNumbersEx();

  @Query('SELECT * FROM hist')
  Future<List<HistEntity>>allNumbersHist();
  
  @Query('SELECT number FROM ex')
  Future<List<int>>valuesEx();

  @Query('SELECT * FROM ex WHERE number = :number')
  Future<ExEntity?>findExEntityToNumber(int number);

  @Query('DELETE FROM ex')
  Future<void>clearEx();

  @Query('DELETE FROM hist')
  Future<void>clearHist();

  @insert
  Future<int>insertEx(ExEntity entity);

  @insert
  Future<int>insertHist(HistEntity entity);

  @delete
  Future<void> allDeleteEx(List<ExEntity>list);

  @delete
  Future<void> allDeleteHist(List<HistEntity>list);

  @delete
  Future<void> deleteEx(ExEntity entity);

  @delete
  Future<void> deleteHist(HistEntity entity);




}


