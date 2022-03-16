import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_signin_example/models/question.dart';
import '../dummy_data.dart';
import '../screens/question_screen.dart';
import 'package:http/http.dart' as http;

class QuestionWidget extends StatefulWidget {
  final Question categoryQuestion;

  QuestionWidget(this.categoryQuestion);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  var _isInit = true;

  IconData getIcon(Question q) {
    if (q.isAnswered)
      return Icons.check_box_rounded;
    else
      return Icons.check_box_outline_blank;
  }

  int getScore(Question q) {
    if (q.isAnswered)
      return 0;
    else
      return q.urgency;
  }

  void viewQuestion(BuildContext ctx, String question, String title) {
    Navigator.of(ctx).pushNamed(
      '/answerScreen',
      arguments: {
        'question': question,
        'title': title,
      },
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => viewQuestion(context, widget.categoryQuestion.question,
          widget.categoryQuestion.category),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Icon(
                  getIcon(widget.categoryQuestion),
                  color: Colors.green,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: [Text(widget.categoryQuestion.question)],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  getScore(widget.categoryQuestion).toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
