import 'package:provider/provider.dart';

import '../provider/google_sign_in.dart';

import './logged_in_widget.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

import 'category_item.dart';
import 'logged_in_widget.dart';

class WelcomePage extends StatelessWidget {
  //final user = FirebaseAuth.instance.currentUser;

  // void logOut(BuildContext ctx){
  //   Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
  //     return LoggedInWidget();
  //   }));
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello '),
        backgroundColor: Colors.black26,
        //actions: [
         // IconButton(icon: Icon(Icons.logout), onPressed:() {
           // final provider =
            //Provider.of<GoogleSignInProvider>(context, listen: false);
            //provider.logout();
          //},)
      
        //],

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
