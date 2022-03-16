import 'package:flutter/material.dart';
import 'package:google_signin_example/models/answer.dart';
import 'package:google_signin_example/models/question.dart';
import '../screens/question_screen.dart';

class AnswerWidget extends StatelessWidget {
  final Answer categoryAnswer;

  AnswerWidget(this.categoryAnswer);

 

 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
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
              flex: 6,
              child: Column(
                children: [Text(categoryAnswer.answer)],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
