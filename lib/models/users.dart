import 'package:flutter/foundation.dart';
import './question.dart';
import './answer.dart';

class Users{
  final String name;
  final String userId;
  List<Question> questions=[];
  List<Answer> answers=[];
  int coins;
  final String id;

   Users({
    @required this.name,
    @required this.userId,
     @required this.questions,
     @required this.answers,
    @required this.coins,
    @required this.id,
}
      );
}