import 'package:flutter/foundation.dart';

class Answer {
  // final String title;
  final String answer;
  final List<String> tags;
  final String category;
  final String quesId;
  final String userId;
  final String name;
  final int coins;
  const Answer({
    // @required this.title,
    @required this.answer,
    this.tags,
    @required this.category,
    @required this.quesId,
    @required this.userId,
    @required this.name,
    @required this.coins,
  });
}
