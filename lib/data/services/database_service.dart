import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_practice_flutter/data/models/notes.dart';

class DatabaseService {
  Future<Database> myDatabase() async {
    final Database myDb = await openDatabase(
      join(await getDatabasesPath(), 'notes_database.db'),
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, createdAt TEXT)',
        );
      },
      version: 1,
    );

    return myDb;
  }

  Future<void> addNote(Notes note) async {
    final db = await myDatabase();

    final resultId = await db.insert('notes', note.toMap());
    log("Data inserted into notes table => $resultId");
  }

  Future<List<Notes>> getNotes() async {
    final db = await myDatabase();
    List<Notes> noteList = [];

    final data = await db.query('notes');
    for (var note in data) {
      noteList.add(Notes.fromMap(note));
    }

    return noteList;
  }

  Future<void> updateNote(Notes note) async {
    final db = await myDatabase();

    await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );

    log("Updated value on id : ${note.id}");
  }

  Future<void> deleteNote(Notes note) async {
    final db = await myDatabase();

    await db.delete('notes', where: 'id = ?', whereArgs: [note.id]);
  }
}
