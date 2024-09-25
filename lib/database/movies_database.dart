import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:proyecto1/models/movies_dao.dart';

class MoviesDatabase {
  //
  static const NAMEDB = 'MOVIESDB';
  static const VERSIONDB = 1;

  //
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    return _database = await initDatabase();
  }


Future<Database> initDatabase() async{
    Directory folder =  await getApplicationDocumentsDirectory();
    String path = join(folder.path,NAMEDB);
    return openDatabase(
      path,
      version: VERSIONDB,
      onCreate: (db, version) {
        String query1 = '''
        CREATE TABLE tblgenre(
          idGenre CHAR(1) PRIMARY KEY,
          dscgenre VARCHAR(50)
        );
        ''';
        db.execute(query1);
        String query2 = '''
        CREATE TABLE tblmovies(
          idMovie INTEGER PRIMARY KEY,
          nameMovie VARCHAR(100),
          overview TEXT,
          idGenre CHAR(1),
          imgMovie VARCHAR(150),
          releaseDate CHAR(10),
          CONSTRAINT fk_movie_genre FOREIGN KEY (idGenre) REFERENCES tblgenre (idGenre)
        );''';
        db.execute(query2);
      },
    );
  }


  Future<int> INSERT(String table, Map<String, dynamic> row) async {
    var con = await database;
    return await con.insert(table, row);
  } //  close method

  Future<int> UPDATE(String table, Map<String, dynamic> row) async {
    var con = await database;
    return await con.update(
      table,
      row,
      where: 'id_movie = ?',
      whereArgs: [row['id_movie']],
    );
  } //  close method

  Future<int> DELETE(String table, int idMovie) async {
    var con = await database;
    return await con.delete(table, where: 'id_movie = ?', whereArgs: [idMovie]);
  } //  close method

  Future<List<MoviesDao>> SELECT() async {
    var con = await database;
    var result = await con.query('tblmovies');
    return result
        .map(
          (movie) => MoviesDao.fromMap(movie),
        )
        .toList();
  }
}
