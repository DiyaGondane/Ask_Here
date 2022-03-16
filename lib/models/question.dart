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

  const Question({
    // @required this.title,
    @required this.question,
    this.tags,
    @required this.urgency,
    @required this.category,
    this.isAnswered = false,
    @required this.id,
  });
}
