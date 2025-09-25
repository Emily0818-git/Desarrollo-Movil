import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../providers/notes_provider.dart';

class NoteDetailScreen extends StatefulWidget {
  final Note? note;
  NoteDetailScreen({this.note});

  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _content;

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? "Nueva Nota" : "Editar Nota"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.note?.title,
                decoration: InputDecoration(labelText: "Título"),
                validator: (val) => val!.isEmpty ? "Campo obligatorio" : null,
                onSaved: (val) => _title = val!,
              ),
              TextFormField(
                initialValue: widget.note?.content,
                decoration: InputDecoration(labelText: "Contenido"),
                maxLines: 5,
                validator: (val) => val!.isEmpty ? "Campo obligatorio" : null,
                onSaved: (val) => _content = val!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Guardar"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (widget.note == null) {
                      notesProvider.addNote(
                        Note(
                          title: _title,
                          content: _content,
                          date: DateTime.now().toIso8601String(),
                        ),
                      );
                    } else {
                      notesProvider.updateNote(
                        Note(
                          id: widget.note!.id,
                          title: _title,
                          content: _content,
                          date: DateTime.now().toIso8601String(),
                        ),
                      );
                    }
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
