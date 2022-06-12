import 'package:flutter/material.dart';
import '../models/answer.dart';
import '../widget/mainDrawer.dart';
import '../widget/answerWidget.dart';

class answerList extends StatefulWidget {

  @override
  State<answerList> createState() => _answerListState();
}

class _answerListState extends State<answerList> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute.of(context).settings.arguments as Map<String, Object>;
    List<Answer> ans=routeArgs['ans'];
    return Scaffold(
      appBar: AppBar(
        title: Text('My Answers'),

      ),

      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return AnswerWidget(ans[index]);
        },
        itemCount: ans.length,
      ),

    );
  }
}
