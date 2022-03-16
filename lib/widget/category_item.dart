import 'package:flutter/material.dart';
import 'package:google_signin_example/screens/question_screen.dart';
import '../dummy_data.dart';

class CategoryItem extends StatelessWidget {
  final String tag;
  final String title;
  final Color color;

  CategoryItem(this.title, this.color, this.tag);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/category_questions',
      arguments: {
        'tag': tag,
        'title': title,
        'color': color,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
