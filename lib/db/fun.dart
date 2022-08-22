// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:carolclient/models/NoteModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Fun {
  static Future<Database> _openDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'notes.db'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE notes (id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
      },
      version: 9,
    );
  }

  static Future<void> insert(Note note) async {
    // Get a reference to the database.
    final db = await _openDB();

    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Note>> listz() async {
    final Database db = await _openDB();

    // Consulta la tabla por todos los Dogs.
    final List<Map<String, dynamic>> maps = await db.query('notes');

    // Convierte List<Map<String, dynamic> en List<Dog>.
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
      );
    });
  }

  static lista() async {
    print(await listz());
  }

  static Future<void> delete(int id) async {
    final db = await _openDB();

    db.delete('notes', where: 'id =  ?', whereArgs: [id]);
  }
}
