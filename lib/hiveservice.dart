import 'package:flutter_todo/models/listmodel.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  saveList(String boxName, ToDoList list) async {
    var box = await Hive.openBox<ToDoList>(boxName);
    box.put(list.name, list);
  }

  deleteList(String boxName, ToDoList list) async {
    var box = await Hive.openBox<ToDoList>(boxName);
    box.delete(list.name);
  }

  getLists(String boxName) async {
    var box = await Hive.openBox<ToDoList>(boxName);
    var answer = [];
    for (int i = 0; i < box.length; i++) {
      var list = box.getAt(i);
      answer.add(list);
    }
    return answer;
  }
}
