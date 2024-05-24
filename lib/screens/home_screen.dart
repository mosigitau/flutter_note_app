import 'package:flutter/material.dart';
import 'package:note_app/models/model.dart';
import 'package:note_app/screens/create_note.dart';
import 'package:note_app/screens/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Note"),
      ),
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NoteCard(
              note: notes[index],
              index: index,
              onNoteDeleted: onNewNoteDeleted,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateNote(
                    onNewNoteCreated: onNewNoteCreated,
                  )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void onNewNoteCreated(Note note) {
    notes.add(note);
    setState(() {});
  }

  void onNewNoteDeleted(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}
