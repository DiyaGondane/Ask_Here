import 'package:flutter/foundation.dart';

class Answer {
  // final String title;
  final String answer;
  final List<String> tags;
  final String category;
  final bool isAnswered;

  const Answer({
    // @required this.title,
    @required this.answer,
    this.tags,
    @required this.category,
    this.isAnswered = false,
  });
}
