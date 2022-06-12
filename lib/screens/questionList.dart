import 'package:flutter/material.dart';
import '../models/question.dart';
import '../widget/mainDrawer.dart';
import '../widget/questionWidget.dart';

class questionList extends StatefulWidget {

  @override
  State<questionList> createState() => _questionListState();
}

class _questionListState extends State<questionList> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute.of(context).settings.arguments as Map<String, Object>;
    List<Question> ques=routeArgs['ques'];
    return Scaffold(
    appBar: AppBar(
    title: Text('My Questions'),

    ),

      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return QuestionWidget(ques[index]);
        },
        itemCount: ques.length,
      ),

    );
  }
}
