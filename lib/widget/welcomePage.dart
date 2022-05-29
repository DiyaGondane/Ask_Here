import 'dart:convert';

import 'package:provider/provider.dart';

import '../models/answer.dart';
import '../models/question.dart';
import '../provider/google_sign_in.dart';

import './logged_in_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import '../dummy_data.dart';
import 'package:http/http.dart' as http;
import 'category_item.dart';
import 'logged_in_widget.dart';
import '/models/users.dart';
import 'mainDrawer.dart';
class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => WelcomePageState();


}

class WelcomePageState extends State<WelcomePage> {
  final user = FirebaseAuth.instance.currentUser;
  Users userInfo;
  int coins=100;
   List<Question> ques=[];
   List<Answer> answer=[];


  @override
  void initState() {
    print(user.uid);
    fetchAndSetQuestions();
    fetchAndSetAnswers();
 fetchUserData();

    super.initState();
  }

   Future<void> fetchUserData() async{
    final url = Uri.https(
        'askhere-31fe6-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/users.json');
    try {
      final response = await http.get(url);
      final extractedData =
      json.decode(response.body) as Map<dynamic,dynamic>;
      if(extractedData == null){
       addUser();
      }


      extractedData.forEach((userId,userData){

       if(userData['userId']==user.uid) {
         userInfo = Users(name: userData['name'],
           userId: userData['userId'],
           questions: userData['questions'],
           answers: userData['answers'],
           coins: userData['coins'],
           id: userId,
         );
       }
      }

      );
      if(userInfo==null){
        addUser();
      }

      // print(extractedData);
      //  print("diya");//print(loadedQuestions); print(DUMMY_QUESTIONS);
      setState(() {
        coins=userInfo.coins;
        userData=userInfo;//print(DUMMY_QUESTIONS);

      });
    } catch (error) { print(error);//print("diya");
    throw error;
    }
  }
  Future<void> addUser() async {
    final url = Uri.https(
        'askhere-31fe6-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/users.json');
    //print(name);
    try {


      final response = await http.post(
        url,
        body: json.encode({
          'name': user.displayName,
          'userId': user.uid,
          'questions': ques,
          'answers': answer,
          'coins': 100,

        }),
      );
      // print("Diya");


      userInfo= Users(
        name: user.displayName,
        userId: user.uid,
        questions: ques,
        answers: answer,
        coins: 0,
        id:json.decode(response.body)['name'],
      );

      setState(() {
        userData=userInfo;
      });
    }
  catch(error){
      throw error;
  }
  }
  Future<void> fetchAndSetQuestions() async {
    final url = Uri.https(
        'askhere-31fe6-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/questions.json');
    try {
      final response = await http.get(url);
      final extractedData =
      json.decode(response.body) as Map<String,dynamic>;
      if(extractedData == null){
        return;
      }
      final List<Question> loadedQuestions = [];
      print(extractedData);
      extractedData.forEach((quesId,quesData){
        Question que=Question(
          question:quesData['question'],
          urgency: quesData['urgency'],
          category: quesData['category'],
          user: quesData['user'],
          name: quesData['name'],
          id: quesId,
          isAnswered: quesData['isAnswered'],
        );
        loadedQuestions.add(que);
        if(quesData['user']==user.uid)
          ques.add(que);
      }
      );
      // print(extractedData);
      //  print("diya");//print(loadedQuestions); print(DUMMY_QUESTIONS);

      setState(() {
        //print(DUMMY_QUESTIONS);
        DUMMY_QUESTIONS = loadedQuestions;
      });
    } catch (error) { print(error);//print("diya");
    throw error;
    }
  }
  Future<void> fetchAndSetAnswers() async {
    final url = Uri.https(
        'askhere-31fe6-default-rtdb.asia-southeast1.firebasedatabase.app',
        '/answers.json');
    try {
      final response = await http.get(url);
      final extractedData =
      json.decode(response.body) as Map<String,dynamic>;
      if(extractedData == null){
        return;
      }
      final List<Answer> loadedAnswers = [];

      // print(extractedData);
      extractedData.forEach((ansId,ansData){
        Answer ans=Answer(
          answer:ansData['answer'],
          userId: ansData['userId'],
          name: ansData['name'],
          category: ansData['category'],
          quesId: ansData['id'],
          coins: ansData['coins'],
        );
        loadedAnswers.add(ans);
        if(ansData['userId']==user.uid)
          answer.add(ans);
      }
      );
      // print(extractedData);
      //  print("diya");//print(loadedQuestions); print(DUMMY_QUESTIONS);
      setState(() {
        //print(DUMMY_ANSWERS);
        DUMMY_ANSWERS = loadedAnswers;
      });
    } catch (error) { print(error);//print("diya");
    throw error;
    }
  }
  //QuestionScreen(fetchAndSetQuestions,fetchAndSetAnswers,fetchUserData);
  /*Future<void> fetchUsersInfo() async {
   final url = Uri.https(
       'askhere-31fe6-default-rtdb.asia-southeast1.firebasedatabase.app',
       '/users.json');
   try {
     final response = await http.get(url);
     final extractedData =
     json.decode(response.body) as Map<dynamic,dynamic>;
     if(extractedData == null){
       return;
     }
     final List<Users> User= [];
     final size = extractedData.length;
     print(extractedData);
     for(int i=0;i<size;i++) {
       if (extractedData['userId'] == user.uid) {
        User
       }
     }
     extractedData.forEach((quesId,userData){

       loadedUsers.add(Users(
         name:userData['name'],
         userId: userData['userId'],
         questions: userData['questions'],
         answers: userData['answers'],
         coins: userData['coins'],

       )
       );
     }
     );
     // print(extractedData);
     //  print("diya");//print(loadedQuestions); print(DUMMY_QUESTIONS);
     setState(() {
       //print(DUMMY_QUESTIONS);
       DUMMY_QUESTIONS = loadedQuestions;
     });
   } catch (error) { print(error);//print("diya");
   throw error;
   }
 }
 */

  void logOut(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
     return LoggedInWidget();
    }));
}
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: MainDrawer(coins,ques,answer),
      appBar: AppBar(
        title: Text('Home', style:TextStyle(fontFamily: 'RobotoCondensed',

          fontSize: 24,
          fontWeight: FontWeight.bold,)
          ),
        backgroundColor: Colors.pink,

        actions: [
         IconButton(icon: Icon(Icons.logout), onPressed:() {

            final provider =
            Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout();
          },)

        ],
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.account_circle),
        ),
      ),


      body: GridView(
        padding: EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map(
              (catData) =>
              CategoryItem(
                catData.topic,
                catData.color,
                catData.tag,
              ),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
