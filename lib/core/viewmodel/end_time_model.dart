import 'package:flutter/cupertino.dart';

class EndTimeModel extends ChangeNotifier {
  bool _isEndTime = false;
  bool get isEndTime => _isEndTime;

  void complate(){
    if (_isEndTime == false) {
      _isEndTime = !_isEndTime;
      notifyListeners();
    }
  }
}
