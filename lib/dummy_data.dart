import 'package:flutter/material.dart';
import './models/question.dart';
import './models/answer.dart';

import './models/category.dart';

const DUMMY_CATEGORIES = const [
  Category(
    tag: 'c1',
    topic: 'Python',
    color: Colors.purple,
  
  ),
  Category(
    tag: 'c2',
    topic: 'Flutter',
    color: Colors.red,
  ),
  Category(
    tag: 'c3',
    topic: 'Web Dev',
    color: Colors.orange,
  ),
  Category(
    tag: 'c4',
    topic: 'Competitive Coding',
    color: Colors.amber,
  ),
  Category(
    tag: 'c5',
    topic: 'OOP',
    color: Colors.blue,
  ),
  Category(
    tag: 'c6',
    topic: 'DBMS',
    color: Colors.green,
  ),
  Category(
    tag: 'c7',
    topic: 'Science',
    color: Colors.lightBlue,
  ),
  Category(
    tag: 'c8',
    topic: 'Math',
    color: Colors.lightGreen,
  ),
  Category(
    tag: 'c9',
    topic: 'Movies',
    color: Colors.pink,
  ),
  Category(
    tag: 'c10',
    topic: 'Web Series',
    color: Colors.teal,
  ),
  Category(
    tag: 'c2',
    topic: 'Art',
    color: Colors.red,
  ),
  Category(
    tag: 'c2',
    topic: 'Entrepreneurship',
    color: Colors.blueGrey,
  ),
  Category(
    tag: 'c2',
    topic: 'Internet Of Things',
    color: Colors.red,
  ),
  Category(
    tag: 'c2',
    topic: 'Flutter',
    color: Colors.black26,
  ),
];
 List<Question> DUMMY_QUESTIONS = [
   /*
  Question(
    question: 'What is a dictionary in Python?',
    tags: [
      'Dictionary',
      'Baisc',
    ],
    urgency: 8,
    category: 'Python',
    isAnswered: false,
    id: '1',
  ),

  Question(
    question: '2*2?',
    tags: [
      'Math',
      'Multiplication',
      'Basic',
    ],
    urgency: 5,
    category: 'Math',
    isAnswered: false,
    id: '2',
  ),

  Question(
    question: 'What is a dictionary in Python?',
    tags: [
      'Dictionary',
      'Baisc',
    ],
    urgency: 8,
    category: 'Flutter',
    isAnswered: true,
    id: '3',
  ),

  Question(
    question: 'What is a dictionary in Python?',
    tags: [
      'Dictionary',
      'Baisc',
    ],
    urgency: 8,
    category: 'Python',
    isAnswered: true,
    id: '4',
  ),

  Question(
    question: 'Vakeel Saab Openings?',
    tags: [
      'FDFS',
      'Pawan Kalyan',
    ],
    urgency: 5,
    category: 'Movies',
    isAnswered: false,
    id: '5',
  ),

  Question(
    question: 'What is a dictionary in Python?And what are the uses of it and when is it used commonly? Please help me out',
    tags: [
      'Dictionary',
      'Baisc',
    ],
    urgency: 2,
    category: 'OOP',
    isAnswered: false,
    id: '6',
  ),
  */
];

final DUMMY_ANSWERS = [
    Answer(
    answer: 'Following is the answer',
    tags: [
      'Dictionary',
      'Baisc',
    ],
    category: 'Python',
    isAnswered: false,
  ),

 Answer(
    answer: 'Following is the answer',
    tags: [
      'Dictionary',
      'Baisc',
    ],
    category: 'Math',
    isAnswered: false,
  ),

  Answer(
    answer: 'Following is the answer',
    tags: [
      'Dictionary',
      'Baisc',
    ],
    category: 'Flutter',
    isAnswered: true,
  ),

  Answer(
    answer: 'Following is the answer',
    tags: [
      'Dictionary',
      'Baisc',
    ],
    category: 'Python',
    isAnswered: true,
  ),

  Answer(
    answer: 'Following is the answer',
    tags: [
      'Dictionary',
      'Baisc',
    ],
    category: 'Movies',
    isAnswered: false,
  ),

  Answer(
    answer: 'Following is the answer',
    tags: [
      'Dictionary',
      'Baisc',
    ],
    category: 'OOP',
    isAnswered: false,
  ),
];
