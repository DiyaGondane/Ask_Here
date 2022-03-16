import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_signin_example/models/question.dart';
import '../widget/questionWidget.dart';
import '../dummy_data.dart';
import 'package:http/http.dart' as http;

class QuestionScreen extends StatefulWidget {
  // final String categoryTopic;
  // final String categoryTag;
  // final Color color;
  //
  //
  // QuestionScreen({this.categoryTag, this.categoryTopic, this.color});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final categoryTopic = routeArgs['title'];
    final color = routeArgs['color'];
    final categoryTag = routeArgs['tag'];
    final id = routeArgs['id'];
    var _isInit = true;

    /* Future<void> fetchAndSetQuestions() async {
      final url = Uri.https(
          'askhere-31fe6-default-rtdb.asia-southeast1.firebasedatabase.app',
          '/questions.json');
      try {
        final response = await http.get(url);
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;
        final List<Question> loadedQuestions = [];
        extractedData.forEach((quesId, quesData) {
          loadedQuestions.add(Question(
            question: quesData['question'],
            urgency: quesData['urgency'],
            category: quesData['category'],
            id: quesId,
          ));
        });
        DUMMY_QUESTIONS = loadedQuestions;
      } catch (error) {
        throw error;
      }
    }
*/
    Future<void> fetchAndSetQuestions() async {
      final url = Uri.https(
          'askhere-31fe6-default-rtdb.asia-southeast1.firebasedatabase.app',
          '/questions.json');
      try {
        final response = await http.get(url);
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;
        final List<Question> loadedQuestions = [];
        extractedData.forEach((quesId, quesData) {
          loadedQuestions.add(Question(
            question: quesData['question'],
            urgency: quesData['urgency'],
            category: quesData['category'],
            id: quesId,
          ));
        });
        DUMMY_QUESTIONS = loadedQuestions;
      } catch (error) {
        throw error;
      }
    }

    @override
    void initState() {
      super.initState();
    }

    @override
    void didChangeDependencies() {
      if (_isInit) {
        fetchAndSetQuestions();
      }
      _isInit = false;
      super.didChangeDependencies();
    }

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
          }),
        );
        final ques = Question(
          question: question,
          urgency: urgency,
          category: categoryTopic,
          id: json.decode(response.body)['name'],
        );

        setState(() {
          DUMMY_QUESTIONS.add(ques);
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
