import 'package:flutter/material.dart';
import 'package:note_app/models/model.dart';
import 'package:note_app/screens/note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard(
      {super.key,
      required this.note,
      required this.index,
      required this.onNoteDeleted});

  final Note note;
  final int index;

  final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteView(
                  note: note,
                  index: index,
                  onNoteDeleted: onNoteDeleted,
                )));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                note.body,
                style: const TextStyle(
                  fontSize: 20,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
