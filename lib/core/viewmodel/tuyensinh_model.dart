import 'dart:async';
import 'package:flutterappdogandcat/core/bloc/bloc_base.dart';
import 'package:flutterappdogandcat/core/model/entertaiment.dart';
import 'package:flutterappdogandcat/core/model/question.dart';
import 'package:flutterappdogandcat/core/service/api.dart';
import 'package:flutterappdogandcat/ui/shared/api_url.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';

class TuyenSinhModel extends BlocBase {
  TuyenSinhModel._internal();

  static final TuyenSinhModel _instance = TuyenSinhModel._internal();

  static TuyenSinhModel get instance => _instance;

  final StreamController<List<Entertaiment>> _streamController =
      StreamController.broadcast();

  Stream<List<Entertaiment>> get entertaimentStream => _streamController.stream;

  final Api subjectProvider = Api();

  Future<List<Entertaiment>> getListEntertaiment(
      String slug, String type) async {
    List<Entertaiment> subject = await subjectProvider.fetchListEntertaiment();
    subject = subject.where((element) => element.type == slug).toList();
    if (subject == null) {
      _streamController.sink.addError("error");
    } else {
      _streamController.sink.add(subject);
    }
    return subject;
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
