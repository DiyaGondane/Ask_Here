import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Question {
  // final String title;
  final String question;
  final List<String> tags;
  final int urgency;
  final String category;
  final bool isAnswered;
  final String id;
  final String user;
  final String name;

  const Question({
    // @required this.title,
    @required this.question,
    this.tags,
    @required this.urgency,
    @required this.category,
    @required this.isAnswered,
    @required this.id,
    @required this.user,
    @required this.name,
  });
}
