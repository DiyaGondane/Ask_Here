import 'dart:collection';

import '../models/topic.dart';
import 'package:flutter/material.dart';
import '../models/topic.dart';

class TopicNotifier with ChangeNotifier {
  List<Topic> _topicList = [];
  Topic _currentTopic;

  UnmodifiableListView<Topic> get topicList => UnmodifiableListView(_topicList);

  Topic get currentTopic => _currentTopic;

  set topicList(List<Topic> foodList) {
    _topicList = topicList;
    notifyListeners();
  }

  set currentTopic(Topic topic) {
    _currentTopic = topic;
    notifyListeners();
  }

  addTopic(Topic topic) {
    _topicList.insert(0, topic);
    notifyListeners();
  }

  deleteTopic(Topic topic) {
    _topicList.removeWhere((_topic) => _topic.id == topic.id);
    notifyListeners();
  }
}