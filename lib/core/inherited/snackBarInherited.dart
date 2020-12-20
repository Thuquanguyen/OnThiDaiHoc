import 'package:flutter/material.dart';

class SnackBarInherited extends InheritedWidget {
  final bool showSnack;

  const SnackBarInherited({@required this.showSnack, @required Widget child})
      : super(child: child);

  static SnackBarInherited of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(SnackBarInherited);
  }

  @override
  bool updateShouldNotify(SnackBarInherited oldWidget) {
    return showSnack != oldWidget.showSnack;
  }
}
