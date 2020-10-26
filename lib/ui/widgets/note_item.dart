import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/core/model/note.dart';
import 'package:flutterappdogandcat/core/viewmodel/note_model.dart';
import 'package:flutterappdogandcat/ui/views/subject/create_task_view.dart';

class ItemNoteAdapter extends StatelessWidget {
  final Note noteModel;
  final String slug;
  NoteModel model = NoteModel.instance;

  ItemNoteAdapter({@required this.noteModel, @required this.slug});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(noteModel.color),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ListTile(
        title: Text(noteModel.title),
        subtitle: Text(noteModel.createAt),
            trailing: IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                model.removeItemNote(noteModel.id, slug);
              },
            ),
          ),
        ), onTap: () {
      noteModel.slug = slug;
      Navigator.pushNamed(context, CreateTaskView.routeName, arguments: {
        'data': noteModel,
        'type': 1
      });
    });
  }
}
