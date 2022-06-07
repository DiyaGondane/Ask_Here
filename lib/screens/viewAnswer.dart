import 'package:flutter/material.dart';

class ViewAnswer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final routeArgs =
    ModalRoute.of(context).settings.arguments as Map<String, Object>;

    final categoryTopic = routeArgs['category'];
    final quesid= routeArgs['quesid'];
    final answer = routeArgs['answer'];
    /*
    final color = routeArgs['color'];
    final categoryTag = routeArgs['tag'];

*/


    return Scaffold(
      appBar: AppBar(
        title: Text("Answer"),
      ),
      body:
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
                child:SingleChildScrollView(
                 child:
                    Text(
                  answer,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

        ),
      );

  }
}
