import 'package:flutter/material.dart';
import '../models/question.dart';

class PostQuestion extends StatefulWidget {
  @override
  State<PostQuestion> createState() => _PostQuestionState();
}

class _PostQuestionState extends State<PostQuestion> {
  final quesInput = TextEditingController();

  final urgencyInput = TextEditingController();

  var _isloading = false;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Function>;

    Future<void> submitData() async {
      final enteredQues = quesInput.text;
      final enteredUrg = int.parse(urgencyInput.text);
      setState(() {
        _isloading = false;
      });
      if (enteredUrg < 0 || enteredQues.isEmpty) return;
      try {
        await routeArgs['addQuestion'](enteredQues, enteredUrg);
      } catch (error) {
        await showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An error occured!'),
            content: Text('Something went wrong!'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      } finally {
        setState(() {
          _isloading = false;
        });
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Your Question'),
      ),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Text('Category'),
                Card(
                  elevation: 5,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          controller: quesInput,
                          decoration: InputDecoration(labelText: 'Question'),
                          keyboardType: TextInputType.multiline,
                          minLines: 3,
                          maxLines: 10,
                          onSubmitted: (_) => submitData(),
                        ),
                        TextField(
                          controller: urgencyInput,
                          decoration: InputDecoration(labelText: 'Coins'),
                          keyboardType: TextInputType.number,
                          onSubmitted: (_) => submitData(),
                        ),
                        FlatButton(
                          onPressed: submitData,
                          child: Text('Ask Question'),
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
