import 'package:flutter/material.dart';
import '../models/question.dart';


class PostAnswer extends StatelessWidget {

  final ansInput = TextEditingController();
 


  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute
        .of(context)
        .settings
        .arguments as Map<String,Function>;

    void submitData() {
      final enteredAns = ansInput.text;
      
      if (enteredAns.isEmpty) return;

      routeArgs['addAnswer'](enteredAns);

      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Post Your Answer'),
      ),
      body: Column(
        children: [
         
          Card(
            elevation: 5,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: ansInput,
                    decoration: InputDecoration(labelText: 'Answer'),
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 10,
                    onSubmitted: (_) => submitData(),
                  ),
                  
                  FlatButton(
                    onPressed: submitData,
                    child: Text('Post Answer'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
