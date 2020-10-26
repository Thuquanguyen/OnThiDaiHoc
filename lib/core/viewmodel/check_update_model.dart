import 'dart:async';
import 'package:flutterappdogandcat/core/bloc/bloc_base.dart';
import 'package:flutterappdogandcat/core/model/entertaiment.dart';
import 'package:flutterappdogandcat/core/model/info_app.dart';
import 'package:flutterappdogandcat/core/service/api.dart';

class CheckupdateModel extends BlocBase {
  CheckupdateModel._internal();

  static final CheckupdateModel _instance = CheckupdateModel._internal();

  static CheckupdateModel get instance => _instance;

  final StreamController<InfoApp> _streamController =
      StreamController.broadcast();

  Stream<InfoApp> get entertaimentStream => _streamController.stream;

  final Api subjectProvider = Api();

  Future<InfoApp> getVersionApp() async {
    InfoApp subject = await subjectProvider.getversionApp();
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
