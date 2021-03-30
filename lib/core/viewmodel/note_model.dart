import 'dart:async';
import 'package:flutterappdogandcat/core/bloc/bloc_base.dart';
import 'package:flutterappdogandcat/core/model/note.dart';
import 'package:flutterappdogandcat/core/model/question.dart';
import 'package:flutterappdogandcat/core/service/api.dart';
import 'package:flutterappdogandcat/core/service/database_helpers.dart';
import 'package:flutterappdogandcat/ui/shared/api_url.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';

class NoteModel extends BlocBase {
  NoteModel._internal();

  static final NoteModel _instance = NoteModel._internal();

  static NoteModel get instance => _instance;

  final StreamController<List<Note>> _streamController =
      StreamController.broadcast();
  final StreamController<int> _streamRemoveNote = StreamController.broadcast();
  final StreamController<int> _streamAddNote = StreamController.broadcast();

  Stream<int> get removeNoteStream => _streamRemoveNote.stream;

  Stream<List<Note>> get noteStream => _streamController.stream;

  Stream<int> get addNoteStream => _streamAddNote.stream;

  final Api subjectProvider = Api();

  Future<List<Note>> getListAllNote(String slug) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    List<Note> notes = [];
    List<Note> noteItem = await helper.queryAllNote();
    if (noteItem == null) {
      return [];
    } else {
      noteItem.forEach((noteData) {
        if (noteData.slug == slug) {
          notes.add(Note(
              id: noteData.id,
              title: noteData.title,
              content: noteData.content,
              color: noteData.color,
              createAt: noteData.createAt));
        }
      });
    }
    if (notes == null) {
      _streamController.sink.addError("error");
    } else {
      _streamController.sink.add(notes.reversed.toList());
    }
    return notes.reversed.toList();
  }

  Future<int> addNote(Note note) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    int noteItem = await helper.insert(note);
    if (noteItem == null) {
      _streamAddNote.sink.addError("error");
    } else {
      _streamAddNote.sink.add(1);
      getListAllNote(note.slug);
    }
  }

  Future<int> updateNote(Note note) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    int noteItem = await helper.updateNote(note);
    print("update : $noteItem");
    if (noteItem == null) {
      _streamAddNote.sink.addError("error");
    } else {
      _streamAddNote.sink.add(noteItem);
      getListAllNote(note.slug);
    }
  }

  Future<int> removeItemNote(int id, String slug) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    int delete = await helper.deleteNote(id);
    if (delete == null) {
      _streamRemoveNote.sink.addError("error");
      print("kokoko");
    } else {
      print("ajajaj ${delete}");
      _streamRemoveNote.sink.add(delete);
      getListAllNote(slug);
    }
  }

  @override
  void dispose() {
    _streamController.close();
    _streamRemoveNote.close();
    _streamAddNote.close();
  }
}
