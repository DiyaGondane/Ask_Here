import 'dart:ui';

import 'package:flutter/material.dart';
import './screens/postAnswer.dart';
import 'screens/question_screen.dart';
import './screens/postQuestion.dart';
import './page/home_page.dart';
//import 'package:firebase_core/firebase_core.dart';
import './widget/welcomePage.dart';
import 'screens/answer_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ))),
        home: WelcomePage(),
        routes: {
          '/category_questions': (ctx) => QuestionScreen(),
          '/post_question': (ctx) => PostQuestion(),
          '/answerScreen': (ctx) => AnswerScreen(),
          '/post_answer': (ctx) => PostAnswer(),
        },
      );
}
