import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notes_provider.dart';
import 'note_detail_screen.dart';
import '../widgets/note_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NotesProvider>(context, listen: false).fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Notas")),
      body:
          notesProvider.notes.isEmpty
              ? Center(child: Text("No hay notas"))
              : ListView.builder(
                itemCount: notesProvider.notes.length,
                itemBuilder: (ctx, i) => NoteItem(note: notesProvider.notes[i]),
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => NoteDetailScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
