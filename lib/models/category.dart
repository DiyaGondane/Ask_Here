import 'package:flutter/material.dart';

class Category {
  final String topic;
  final String tag;
  final Color color;

  const Category({
    @required this.topic,
    this.tag,
    this.color = Colors.orange,
  });
}
