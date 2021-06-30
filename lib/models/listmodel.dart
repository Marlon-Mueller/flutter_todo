import 'dart:html';

import 'package:flutter_todo/models/taskmodel.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'listmodel.g.dart';

@HiveType(typeId: 0)
class ToDoList {
  ToDoList({required this.name, required this.tasks});

  @HiveField(0)
  late String name;

  @HiveField(1)
  late List<Task> tasks;

  @override
  String toString() {
    return 'List: {name: ${name}, tasks: ${tasks}}';
  }
}
