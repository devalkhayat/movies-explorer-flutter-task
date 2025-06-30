import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/cinema_model.dart';



abstract class HomeLocalDataSource{
  Future<void> cacheCinemas(List<CinemaModel> cinemas);
  Future<List<CinemaModel>> getCachedCinemas();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource{

  static Database? _db;

  Future<Database?> get db async{
    if(_db==null){
      _db=await initalDb();
      return _db;
    }else{
      return _db;
    }

  }
  initalDb() async{
    String databasePath=await getDatabasesPath();
    String path = join(databasePath, 'movies.db');
    Database myDB = await openDatabase(path,onCreate:  _onCreate , version: 1, onUpgrade: _onUpgrade);
    return myDB;
  }


  _onCreate(Database db, int version) async{
    await db.execute(''' 
    
    CREATE TABLE Cinemas (ID INTEGER  NOT NULL PRIMARY KEY,
                            NAME TEXT,
                            DISTANCE TEXT,
                            CLOSE_TIME TEXT,
                            RATING TEXT,
                            LOGO_URL TEXT
                            )
    
    ''');

    print("onCreate ===============");
  }

  _onUpgrade(Database db , int oldVersion , int newVersion)  {
    print("onUpgrade ====================");
  }

  @override
  Future<void> cacheCinemas(List<CinemaModel> cinemas) async{

   final db = await _db;

    await db!.delete('Cinemas'); // Clear old tasks

    for (var c in cinemas) {
      await db.insert('Cinemas', c.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  @override
  Future<List<CinemaModel>> getCachedCinemas() async{

    Database? myDB = await db;

    final maps = await myDB!.query('Cinemas');

    print("data23==========================$maps");
    return maps.map((map) => CinemaModel.fromMap(map)).toList();
  }


}