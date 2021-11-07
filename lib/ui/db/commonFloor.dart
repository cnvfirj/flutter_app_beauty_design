
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'commonFloor.g.dart';


/*https://floor.codes/getting-started*/
@Database(version: 1,entities: [NumberEntity])
abstract class MainDatabase extends FloorDatabase {
  NumberDao get numberDao;
}

@entity
class NumberEntity{

  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'id')
  int? id;
  @ColumnInfo(name:'number')
  final int number;

  NumberEntity(this.id,{required this.number});
}

@dao
abstract class NumberDao{

  @Query('SELECT * FROM NumberEntity')
  Future<List<NumberEntity>>allNumbers();

  @insert
  Future<int>insertNumber(NumberEntity entity);

  @delete
  Future<void> deleteAll(List<NumberEntity>list);
}

class CommonFloorDatabase{
  static CommonFloorDatabase _single = CommonFloorDatabase();

  static CommonFloorDatabase inst()=>_single;

  void insert(){

  }
}

