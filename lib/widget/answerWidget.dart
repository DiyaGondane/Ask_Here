import 'package:flutter/material.dart';
import 'package:google_signin_example/models/answer.dart';
import 'package:google_signin_example/models/question.dart';
import '../screens/question_screen.dart';

class AnswerWidget extends StatelessWidget {
  final Answer categoryAnswer;

  AnswerWidget(this.categoryAnswer);

  void viewAnswer(BuildContext ctx, String answer, String category, String quesid) {
    Navigator.of(ctx).pushNamed(
      '/view_answer',
      arguments: {
        'answer': answer,
        'category': category,
        'quesid': quesid,
      },
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => viewAnswer(context, categoryAnswer.answer,
          categoryAnswer.category, categoryAnswer.quesId),
      child: SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),

    child: Column(

    children:[
      Row(children:<Widget>[
    Container(
      child: Icon(
      Icons.account_circle_rounded,

    ),
      ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.topLeft,
          child:
          Text(categoryAnswer.name,style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
      ),

    Row(
      children:[
        Container(

          child: Text(
            categoryAnswer.coins.toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
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
              categoryAnswer.answer,
              style: TextStyle(fontSize: 18, ),
            ),
          ),

        ),
      ]
    )

        ],
      ),
    ),
      ),
      );

  }
}
