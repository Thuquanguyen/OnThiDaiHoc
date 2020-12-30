import 'package:flutter/cupertino.dart';

class CountModel extends ChangeNotifier {
  int _count = 1;
  int get count => _count;

  bool _isCheck = false;
  bool get isCheck => _isCheck;

  void complate(){
    if (_isCheck == false) {
      _isCheck = !_isCheck;
      notifyListeners();
    }
  }

  void increment() {
    if (_count < 50) {
      _count++;
      notifyListeners();
    }
  }

  void unIncrement() {
    if (_count > 1) {
      _count--;
      notifyListeners();
    }
  }

  void filterQuestion(int index){
    _count = index;
    notifyListeners();
  }
}
