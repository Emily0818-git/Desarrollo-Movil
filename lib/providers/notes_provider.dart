import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import '../models/note.dart';

class NotesProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> fetchNotes() async {
    _notes = await DBHelper.getNotes();
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    await DBHelper.insert(note);
    await fetchNotes();
  }

  Future<void> updateNote(Note note) async {
    await DBHelper.update(note);
    await fetchNotes();
  }

  Future<void> deleteNote(int id) async {
    await DBHelper.delete(id);
    await fetchNotes();
  }
}
