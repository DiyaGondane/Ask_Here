import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_signin_example/models/question.dart';
import 'package:google_signin_example/screens/postQuestion.dart';
import '../widget/questionWidget.dart';
import '../dummy_data.dart';
import '../widget/answerWidget.dart';
import '../models/answer.dart';
import './postAnswer.dart';
import 'package:http/http.dart' as http;

class AnswerScreen extends StatefulWidget {
  // final String categoryTopic;
  // final String categoryTag;
  // final Color color;
  //
  //
  // QuestionScreen({this.categoryTag, this.categoryTopic, this.color});

  @override
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  void initState() {
   // fetchAndSetAnswers();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final categoryTopic = routeArgs['category'];
    final quesid= routeArgs['id'];
    final question = routeArgs['question'];
    final user = FirebaseAuth.instance.currentUser;
    final String name = user.displayName;
    final int coins=routeArgs['urgency'];
    /*
    final color = routeArgs['color'];
    final categoryTag = routeArgs['tag'];

*/
    void addAnswer(String answer) {
      final url = Uri.https(
          'askhere-31fe6-default-rtdb.asia-southeast1.firebasedatabase.app',
          '/answers.json');
      print(coins);
      http.post(url,
          body: json.encode({
            'answer': answer,
            'category': categoryTopic,
            'id': quesid,
            'userId' : user.uid,
            'name' : name,
            'coins': coins,
          }));
      final ans = Answer(
        answer: answer,
        category: categoryTopic,
        quesId: quesid,
        userId: user.uid,
        name: name,
        coins: coins,
      );
     print(ans);
      setState(() {
        DUMMY_ANSWERS.add(ans);
        int val=0;
        final databaseRef =
        FirebaseDatabase.instance.reference().child('users');
        databaseRef.child(userData.id).child("coins").once().then((event){
          final data = event.snapshot;
          setState(() {
            val=data.value;
          });
          int x=coins+val;

          databaseRef.child(userData.id).update({"coins": x});
        });
        final db= FirebaseDatabase.instance.reference().child('questions');
        db.child(ans.quesId).update({"isAnswered": true});
      });
    }



    void postAnswer(BuildContext ctx) {
      Navigator.of(ctx)
          .pushNamed('/post_answer', arguments: {'addAnswer': addAnswer});
    }

    final categoryAnswers = DUMMY_ANSWERS.where((meal) {
      return meal.category == categoryTopic && meal.quesId==quesid;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Answers"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              //width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Question',
                style: Theme.of(context).textTheme.headline6,
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
              width: double.infinity,
              child: SizedBox(
                width: 100,
                child: Text(
                  question,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              //width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Answers',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return AnswerWidget(categoryAnswers[index]);
                },
                itemCount: categoryAnswers.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        child: FloatingActionButton.extended(
          icon: Icon(Icons.file_upload),
          label: Text('Post Answer'),
          onPressed: () => postAnswer(context),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
