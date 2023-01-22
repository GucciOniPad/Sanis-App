import 'package:flutter/foundation.dart';

class Post {
  /*
  final int userId;
  final int id;
  final String title;
  final String body;
  */
  final int id;
  final int age;
  final String name;

  Post({
    /*
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    */
    required this.id,
    required this.name,
    required this.age,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      /*
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      */
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as int,
    );
  }
}
