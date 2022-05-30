
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/answer.dart';
import '../models/question.dart';
import '../provider/google_sign_in.dart';


class MainDrawer extends StatefulWidget {

 int coins;
final List<Question> ques;
final List<Answer> ans;
MainDrawer(this.coins,this.ques,this.ans);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

Widget buildListTile(String title, IconData icon,Function tapHandler) {
  return ListTile(
    leading: Icon(
      icon,
      size: 26,
    ),
    title: Text(
      title,
      style: TextStyle(
        fontFamily: 'RobotoCondensed',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    onTap: tapHandler,
  );
}

  @override
  Widget build(BuildContext context) {
    final provider =
    Provider.of<GoogleSignInProvider>(context, listen: false);

    final user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              user.displayName,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
         Row(

           children:<Widget>[
             Container(
               child: Text("     "
               ),
             ),
             Container(
               child: Icon(
                 Icons.currency_rupee_rounded,
                 size: 26,
               ),
             ),

             Container(

               child: Text('     My Coins',
                 style: TextStyle(
                   fontFamily: 'RobotoCondensed',
                   fontSize: 24,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
             Container(
               child: Text("                "
               ),
             ),
             Container(


               child: Text(widget.coins.toString(),
                 style: TextStyle(
                   fontFamily: 'RobotoCondensed',
                   fontSize: 30,
                   color: Colors.red,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),

           ],
         ),
          SizedBox(
            height: 11,
          ),
          buildListTile('My Questions',Icons.question_mark_rounded ,() {
            Navigator.of(context).pushNamed('/Ques',arguments: {'ques':widget.ques});
          }),
          buildListTile('My Answers',Icons.question_answer, () {
            Navigator.of(context).pushNamed('/Ans',arguments: {'ans':widget.ans});
          }),
          buildListTile('Sign Out', Icons.logout,(){provider.logout();}),

        ],
      ),
    );
  }
}