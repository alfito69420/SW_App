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

  Future<Database> initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();

    String path = join(folder.path, NAMEDB);

    return openDatabase(
      path,
      version: VERSIONDB,
      onCreate: (db, version) {
        String query = '''
          CREATE TABLE tbl_genre(
            id_genre CHAR(1),
            dsc_genre VARCHAR(50)
          )

          CREATE TABLE tbl_movies(
            id_movie INTEGER PRIMARY KEY,
            name_movie VARCHAR(255),
            over_view TEXT,
            id_genre CHAR(1),
            img_movie VARCHAR(150),
            release_date CHAR(10),
            CONSTRAINT fk_gen FOREIGN KEY(id_genre) REFERENCES tbl_genre(id_genre) 
        )''';
        db.execute(query);
      },
    );

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
      var result = await con.query('tbl_movies');
      return result
          .map(
            (movie) => MoviesDao.fromMap(movie),
          )
          .toList();
    } //  close method
  }
}
