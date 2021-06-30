import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_todo/model/listmodel.dart';
import 'pages/home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoListAdapter());
  var box = await Hive.openBox<ToDoList>('Homework');
  var todo = ToDoList(
      name: 'math', tasks: [Task('task one', false), Task('task two', true)]);
  /*  await box.add(todo);
  print(Hive.box<ToDoList>('math')); */

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
