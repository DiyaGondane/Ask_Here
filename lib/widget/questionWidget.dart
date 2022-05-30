import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
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

  final user = FirebaseAuth.instance.currentUser;
  IconData getIcon(Question q) {

    if (q.isAnswered)
      return Icons.check_box_rounded;
    else
      return Icons.check_box_outline_blank;
  }

  int getScore(Question q) {
      return q.urgency;
  }

  void viewQuestion(BuildContext ctx, String question, String category, String id,int urgency) {
    Navigator.of(ctx).pushNamed(
      '/answerScreen',
      arguments: {
        'question': question,
        'category': category,
        'id': id,
        'urgency': urgency
      },
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => viewQuestion(context, widget.categoryQuestion.question,
          widget.categoryQuestion.category, widget.categoryQuestion.id, widget.categoryQuestion.urgency),
      child: SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),

        child: Column(
        children: <Widget>[
          Row(
            children:<Widget>[
            Container(
              child: Icon(
                Icons.account_circle_rounded,

              ),
            ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.topLeft,
                child:
                Text(widget.categoryQuestion.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
         ], ),





         Container(

          child:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Column(

              children:
                  <Widget> [
          Container(

           child: Text(
             getScore(widget.categoryQuestion).toString(),
             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
           ),
         ),

                    Container(
                  child: Icon(
                    getIcon(widget.categoryQuestion),
                    color: Colors.green,
                  ),
                ),



               ],
              ),
              Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 80,
                width: 289,
                child:SingleChildScrollView(
                child: Text(
                    widget.categoryQuestion.question,
                    style: TextStyle(fontSize: 18),
                  ),
                ),

              ),
            ],
          ),
        ),

              ],
              ),
      ),
    ),
    );
  }
}
