import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_signin_example/models/question.dart';
import 'package:google_signin_example/widget/mainDrawer.dart';
import 'package:google_signin_example/widget/welcomePage.dart';
import '../models/answer.dart';
import '../models/users.dart';
import '../widget/questionWidget.dart';
import '../dummy_data.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database_tutorial/home.dart';
class QuestionScreen extends StatefulWidget {
//final Function user,ques,ans;

//QuestionScreen(this.user, this.ques, this.ans);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final categoryTopic = routeArgs['title'];
    final color = routeArgs['color'];
    final categoryTag = routeArgs['tag'];
    final id = routeArgs['id'];
    var _isInit = true;
    final user = FirebaseAuth.instance.currentUser;
    final String name = user.displayName;


    Future<void> addQuestion(String question, int urgency) async {
      final url = Uri.https(
          'askhere-31fe6-default-rtdb.asia-southeast1.firebasedatabase.app',
          '/questions.json');

      try {

        final response = await http.post(
          url,
          body: json.encode({
            'question': question,
            'urgency': urgency,
            'category': categoryTopic,
             'user': user.uid,
            'name': name,
            'isAnswered': false,
          }),
        );

        final ques = Question(
          question: question,
          urgency: urgency,
          category: categoryTopic,
          id: json.decode(response.body)['name'],
          user: user.uid,
          name: name,
          isAnswered: false,
        );

        setState(() {
          int coins=0;
          DUMMY_QUESTIONS.add(ques);
          final databaseRef =
           FirebaseDatabase.instance.reference().child('users');
          databaseRef.child(userData.id).child("coins").once().then((event){
            final data = event.snapshot;
           setState(() {
             coins=data.value;
           });
            int x=coins-urgency;

            databaseRef.child(userData.id).update({"coins": x});
            //WelcomePageState.fetchUserData();



          });

        });


      } catch (error) {
        throw error;
      }
    }

    void postQuestion(BuildContext ctx) {
      Navigator.of(ctx)
          .pushNamed('/post_question', arguments: {'addQuestion': addQuestion});
    }

    final categoryQuestions = DUMMY_QUESTIONS.where((meal) {
      return meal.category == categoryTopic;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTopic),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return QuestionWidget(categoryQuestions[index]);
        },
        itemCount: categoryQuestions.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        child: FloatingActionButton.extended(
          icon: Icon(Icons.file_upload),
          label: Text('Post Question'),
          onPressed: () => postQuestion(context),
        ),
      ),
    );
  }
}
