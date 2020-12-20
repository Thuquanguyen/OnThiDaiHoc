import 'package:flutter/cupertino.dart';

class SnackBarModel extends ChangeNotifier {
  bool _isShowSnack = false;
  bool get isShowSnack => _isShowSnack;

  void showSnackBar(){
    _isShowSnack = true;
    notifyListeners();
  }

  void hintSnackBar(){
    _isShowSnack = false;
    notifyListeners();
  }
}
