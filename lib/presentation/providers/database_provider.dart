import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite_practice_flutter/data/models/notes.dart';
import 'package:sqflite_practice_flutter/data/services/database_service.dart';

class DatabaseProvider extends ChangeNotifier {
  final dbService = DatabaseService();
  bool isLoading = false;
  List<Notes> notesList = [];

  Future<void> addNote(Notes note) async {
    isLoading = true;
    try {
      await dbService.addNote(note);
      await getNotes();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getNotes() async {
    isLoading = true;

    try {
      notesList = await dbService.getNotes();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateNote(Notes note) async {
    isLoading = true;

    try {
      await dbService.updateNote(note);
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteNote(Notes note) async {
    isLoading = true;
    try {
      await dbService.deleteNote(note);
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
