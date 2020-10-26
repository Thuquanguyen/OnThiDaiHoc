import 'package:flutter/material.dart';

class QuestionInherited extends InheritedWidget {
  final String slug;

  const QuestionInherited({@required this.slug, @required Widget child})
      : super(child: child);

  static QuestionInherited of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(QuestionInherited);
  }

  @override
  bool updateShouldNotify(QuestionInherited oldWidget) {
    return slug != oldWidget.slug;
  }
}
