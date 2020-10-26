import 'package:flutter/cupertino.dart';

class Note {
  int id;
  String slug;
  String title;
  String content;
  int color;
  String createAt;

  Note(
      {@required this.id,
        @required this.slug,
      @required this.title,
      @required this.content,
      @required this.color,
      @required this.createAt});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'slug': this.slug,
      'title': this.title,
      'content': this.content,
      'color': this.color,
      'createAt': this.createAt,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return new Note(
      id: map['id'] as int,
      slug: map['slug'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      color: map['color'] as int,
      createAt: map['createAt'] as String,
    );
  }

  Note.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        slug = json['slug'],
        title = json['title'],
        content = json['content'],
        color = json['color'],
        createAt = json['createAt'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'title': title,
        'content': content,
        'color': color,
        'createAt': createAt,
      };
}
